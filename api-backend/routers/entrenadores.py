from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from db.database import get_db
from models import models
from schemas import schemas
from auth.dependencies import get_current_entrenador
from datetime import datetime
from sqlalchemy import and_, or_

router = APIRouter(prefix="/entrenadores", tags=["Entrenadores"])

@router.post("/equipos", response_model=schemas.EquipoResponse)
def crear_equipo(equipo: schemas.EquipoCreate, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    nuevo_equipo = models.Equipo(
        **equipo.dict(),
        entrenador_id=current_entrenador.id
    )
    db.add(nuevo_equipo)
    db.commit()
    db.refresh(nuevo_equipo)
    return nuevo_equipo

@router.get("/equipos/mis-equipos")
def get_mis_equipos(db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    equipos = db.query(models.Equipo).filter(models.Equipo.entrenador_id == current_entrenador.id).all()
    result = []
    for e in equipos:
        result.append({
            "id": e.id,
            "nombre": e.nombre,
            "escudo_url": e.escudo_url,
            "torneo": e.torneo.nombre if hasattr(e, 'torneo') and e.torneo else "Sin Torneo",
            "puntos": 0,
            "jugados": 0,
            "ganados": 0,
            "empatados": 0,
            "perdidos": 0
        })
    return result

@router.get("/sedes")
def get_sedes(db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    sedes = db.query(models.Sede).filter(models.Sede.activa == True).all()
    return [{
        "id": s.id,
        "nombre": s.nombre,
        "direccion": s.direccion,
        "ciudad": s.ciudad,
        "telefono": s.telefono,
        "cantidad_canchas": s.cantidad_canchas,
        "foto_url": s.foto_url
    } for s in sedes]

@router.get("/sedes/{sede_id}/torneos")
def get_sede_torneos(sede_id: int, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    sede = db.query(models.Sede).filter(models.Sede.id == sede_id).first()
    if not sede:
        raise HTTPException(status_code=404, detail="Sede no encontrada")
    torneos = db.query(models.Torneo).filter(models.Torneo.sede_id == sede_id).all()
    return {
        "sede": {"id": sede.id, "nombre": sede.nombre},
        "torneos": [{
            "id": t.id,
            "nombre": t.nombre,
            "fecha_inicio": t.fecha_inicio,
            "fecha_fin": t.fecha_fin,
            "cupo_equipos": t.cupo_equipos,
            "costo_inscripcion": t.costo_inscripcion,
            "estado": t.estado
        } for t in torneos]
    }

@router.post("/torneos/{torneo_id}/inscribir")
def inscribir_torneo(torneo_id: int, request_data: dict, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    equipo_id = request_data.get("equipo_id")
    if not equipo_id:
        raise HTTPException(status_code=400, detail="Equipo_id es requerido")
    equipo = db.query(models.Equipo).filter(models.Equipo.id == equipo_id, models.Equipo.entrenador_id == current_entrenador.id).first()
    if not equipo:
        raise HTTPException(status_code=404, detail="Equipo no encontrado")
        
    inscripcion = models.TorneoEquipo(
        equipo_id=equipo_id,
        torneo_id=torneo_id,
        estado="inscrito"
    )
    db.add(inscripcion)
    db.commit()
    return {"message": "Inscrito con éxito"}

@router.get("/equipos/{equipo_id}/proximo-partido")
def get_proximo_partido(equipo_id: int, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    partido = db.query(models.Partido).filter(
        or_(models.Partido.equipo_local_id == equipo_id, models.Partido.equipo_visita_id == equipo_id),
        models.Partido.fecha_hora >= datetime.now()
    ).order_by(models.Partido.fecha_hora.asc()).first()
    
    if not partido:
        return None
        
    return {
        "id": partido.id,
        "rival": partido.equipo_visita.nombre if partido.equipo_local_id == equipo_id else partido.equipo_local.nombre,
        "rival_escudo": partido.equipo_visita.escudo_url if partido.equipo_local_id == equipo_id else partido.equipo_local.escudo_url,
        "condicion": "Local" if partido.equipo_local_id == equipo_id else "Visitante",
        "fecha": partido.fecha_hora.strftime("%d/%m/%Y"),
        "hora": partido.fecha_hora.strftime("%H:%M"),
        "fecha_hora": partido.fecha_hora.isoformat(),
        "estado": partido.estado,
        "cancha": partido.cancha.nombre if partido.cancha else "Por definir",
        "sede": partido.cancha.sede.nombre if partido.cancha and partido.cancha.sede else None,
        "arbitro": partido.arbitro.usuario.nombre if partido.arbitro and partido.arbitro.usuario else None
    }

@router.post("/equipos/{equipo_id}/alineacion")
def guardar_alineacion(equipo_id: int, request_data: dict, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    equipo = db.query(models.Equipo).filter(models.Equipo.id == equipo_id, models.Equipo.entrenador_id == current_entrenador.id).first()
    if not equipo:
        raise HTTPException(status_code=404, detail="Equipo no encontrado")

    partido = db.query(models.Partido).filter(
        or_(models.Partido.equipo_local_id == equipo_id, models.Partido.equipo_visita_id == equipo_id),
        models.Partido.fecha_hora >= datetime.now()
    ).order_by(models.Partido.fecha_hora.asc()).first()

    if not partido:
        raise HTTPException(status_code=404, detail="No hay un partido próximo para este equipo")

    existing = db.query(models.Alineacion).filter(
        models.Alineacion.partido_id == partido.id,
        models.Alineacion.equipo_id == equipo_id
    ).first()
    if existing:
        db.delete(existing)
        db.flush()

    alineacion = models.Alineacion(
        partido_id=partido.id,
        equipo_id=equipo_id,
        entrenador_id=current_entrenador.id,
        formacion=request_data.get("formacion")
    )
    db.add(alineacion)
    db.flush()

    for jugador in request_data.get("jugadores", []):
        db.add(models.AlineacionJugador(
            alineacion_id=alineacion.id,
            jugador_id=jugador.get("jugador_id"),
            posicion=jugador.get("posicion", ""),
            es_titular=jugador.get("es_titular", True),
            numero_dorsal=jugador.get("numero_dorsal")
        ))

    db.commit()
    return {"message": "Alineación guardada exitosamente"}

@router.get("/equipos/{equipo_id}/partidos")
def get_equipo_partidos(equipo_id: int, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    partidos = db.query(models.Partido).filter(
        or_(models.Partido.equipo_local_id == equipo_id, models.Partido.equipo_visita_id == equipo_id)
    ).order_by(models.Partido.fecha_hora.desc()).all()
    
    return [{
        "id": p.id,
        "equipo_local": p.equipo_local.nombre if p.equipo_local else None,
        "equipo_visita": p.equipo_visita.nombre if p.equipo_visita else None,
        "rival": p.equipo_visita.nombre if p.equipo_local_id == equipo_id else p.equipo_local.nombre,
        "resultado": f"{p.goles_local} - {p.goles_visita}" if p.estado == "finalizado" else "Por jugar",
        "condicion": "Local" if p.equipo_local_id == equipo_id else "Visitante",
        "fecha": p.fecha_hora.strftime("%d/%m/%Y"),
        "fecha_hora": p.fecha_hora.isoformat(),
        "cancha": p.cancha.nombre if p.cancha else "Por definir",
        "sede": p.cancha.sede.nombre if p.cancha and p.cancha.sede else None,
        "arbitro": p.arbitro.usuario.nombre if p.arbitro and p.arbitro.usuario else None,
        "estado": p.estado
    } for p in partidos]

@router.get("/equipos/{equipo_id}/solicitudes")
def get_equipo_solicitudes(equipo_id: int, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    solicitudes = db.query(models.SolicitudEquipo).filter(
        models.SolicitudEquipo.equipo_id == equipo_id,
        models.SolicitudEquipo.estado == 'pendiente'
    ).all()
    return [{
        "id": s.id,
        "solicitud_id": s.id,
        "jugador_id": s.jugador_id,
        "nombre": s.jugador.usuario.nombre if s.jugador and s.jugador.usuario else "Desconocido",
        "posicion": s.jugador.posicion if s.jugador else None,
        "foto_url": s.jugador.usuario.foto_url if s.jugador and s.jugador.usuario else None,
        "fecha": s.fecha_solicitud.strftime("%d/%m/%Y")
    } for s in solicitudes]

@router.put("/solicitudes/{solicitud_id}")
def responder_solicitud(solicitud_id: int, request_data: dict, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    estado = request_data.get("estado")
    dorsal = request_data.get("dorsal", 0)
    if not estado:
        raise HTTPException(status_code=400, detail="Estado es requerido")

    solicitud = db.query(models.SolicitudEquipo).filter(models.SolicitudEquipo.id == solicitud_id).first()
    if not solicitud:
        raise HTTPException(status_code=404, detail="Solicitud no encontrada")
        
    solicitud.estado = estado
    if estado == 'aceptado':
        miembro = models.EquipoJugador(
            equipo_id=solicitud.equipo_id,
            jugador_id=solicitud.jugador_id,
            estado='activo',
            numero_dorsal=dorsal
        )
        db.add(miembro)
    
    db.commit()
    return {"message": f"Solicitud {estado}"}

@router.get("/equipos/{equipo_id}/jugadores")
def get_equipo_jugadores(equipo_id: int, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    miembros = db.query(models.EquipoJugador).filter(
        models.EquipoJugador.equipo_id == equipo_id,
        models.EquipoJugador.estado == 'activo'
    ).all()
    
    return [{
        "id": m.jugador_id,
        "nombre": m.jugador.usuario.nombre,
        "dorsal": m.numero_dorsal,
        "posicion": m.jugador.posicion,
        "foto_url": getattr(m.jugador.usuario, 'foto_url', None),
        "goles": 0,
        "asistencias": 0,
        "amarillas": 0,
        "rojas": 0
    } for m in miembros if m.jugador and m.jugador.usuario]

@router.delete("/equipos/{equipo_id}/jugadores/{jugador_id}")
def expulsar_jugador(equipo_id: int, jugador_id: int, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    miembro = db.query(models.EquipoJugador).filter(
        models.EquipoJugador.equipo_id == equipo_id,
        models.EquipoJugador.jugador_id == jugador_id
    ).first()
    if not miembro:
        raise HTTPException(status_code=404, detail="Jugador no encontrado")
    
    db.delete(miembro)
    db.commit()
    return {"message": "Jugador eliminado del equipo"}

@router.get("/perfil")
def get_perfil(db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    return {
        "nombre": current_entrenador.nombre,
        "correo": current_entrenador.correo,
        "telefono": current_entrenador.telefono,
        "foto_url": current_entrenador.foto_url,
        "anios_experiencia": current_entrenador.entrenador_detalles.anios_experiencia if current_entrenador.entrenador_detalles else 0
    }

@router.put("/perfil")
def update_perfil(data: dict, db: Session = Depends(get_db), current_entrenador: models.Usuario = Depends(get_current_entrenador)):
    if "nombre" in data:
        current_entrenador.nombre = data["nombre"]
    if "telefono" in data:
        current_entrenador.telefono = data["telefono"]
    if "foto_url" in data:
        current_entrenador.foto_url = data["foto_url"]
    db.commit()
    return {"message": "Perfil actualizado exitosamente"}