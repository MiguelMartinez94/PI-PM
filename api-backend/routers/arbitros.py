from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from sqlalchemy import or_

from db.database import get_db
from models import models
from schemas import schemas
from auth.dependencies import get_current_arbitro
from datetime import datetime

router = APIRouter(prefix="/arbitros", tags=["Árbitros"])

@router.get("/mis-partidos")
def get_mis_partidos(db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    partidos = db.query(models.Partido).filter(models.Partido.arbitro_id == current_arbitro.id).order_by(models.Partido.fecha_hora.asc()).all()
    result = []
    for p in partidos:
        result.append({
            "partido_id": p.id,
            "equipo_local": p.equipo_local.nombre if p.equipo_local else "Por definir",
            "equipo_visita": p.equipo_visita.nombre if p.equipo_visita else "Por definir",
            "sede": p.torneo.sede.nombre if p.torneo and p.torneo.sede else "Por definir",
            "fecha": p.fecha_hora.strftime("%d/%m/%Y"),
            "hora": p.fecha_hora.strftime("%H:%M"),
            "estado": p.estado,
            "estado_arbitro": p.estado_arbitro,
            "goles_local": p.goles_local,
            "goles_visita": p.goles_visita
        })
    return result

@router.get("/partido/{partido_id}")
def get_partido(partido_id: int, db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    p = db.query(models.Partido).filter(models.Partido.id == partido_id).first()
    if not p:
        raise HTTPException(status_code=404, detail="Partido no encontrado")
    return {
        "partido_id": p.id,
        "equipo_local": p.equipo_local.nombre if p.equipo_local else "Por definir",
        "equipo_local_escudo": p.equipo_local.escudo_url if p.equipo_local else None,
        "equipo_visita": p.equipo_visita.nombre if p.equipo_visita else "Por definir",
        "equipo_visita_escudo": p.equipo_visita.escudo_url if p.equipo_visita else None,
        "sede": p.torneo.sede.nombre if p.torneo and p.torneo.sede else "Por definir",
        "cancha": p.cancha.nombre if p.cancha else "Por definir",
        "torneo": p.torneo.nombre if p.torneo else "Por definir",
        "fecha": p.fecha_hora.strftime("%d/%m/%Y"),
        "hora": p.fecha_hora.strftime("%H:%M"),
        "estado": p.estado,
        "estado_arbitro": p.estado_arbitro,
        "goles_local": p.goles_local,
        "goles_visita": p.goles_visita
    }

@router.put("/partido/{partido_id}/iniciar")
def iniciar_partido(partido_id: int, db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    p = db.query(models.Partido).filter(models.Partido.id == partido_id, models.Partido.arbitro_id == current_arbitro.id).first()
    if not p:
        raise HTTPException(status_code=404, detail="Partido no encontrado o no asignado")
    p.estado = "en_curso"
    p.estado_arbitro = "iniciado"
    db.commit()
    return {"message": "Partido iniciado"}

@router.put("/partido/{partido_id}/finalizar")
def finalizar_partido(partido_id: int, db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    p = db.query(models.Partido).filter(models.Partido.id == partido_id, models.Partido.arbitro_id == current_arbitro.id).first()
    if not p:
        raise HTTPException(status_code=404, detail="Partido no encontrado o no asignado")
    p.estado = "finalizado"
    p.estado_arbitro = "finalizado"
    db.commit()
    return {"message": "Partido finalizado"}

@router.get("/sedes")
def get_sedes_arbitro(db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    sedes = db.query(models.Sede).all()
    # Check postulaciones
    postulaciones = db.query(models.PostulacionArbitro).filter(models.PostulacionArbitro.arbitro_id == current_arbitro.id).all()
    sedes_postuladas_ids = [p.sede_id for p in postulaciones]
    
    result = []
    for s in sedes:
        result.append({
            "id": s.id,
            "nombre": s.nombre,
            "direccion": s.direccion,
            "foto_url": s.foto_url,
            "estado": s.estado,
            "isPostulado": s.id in sedes_postuladas_ids
        })
    return result

@router.post("/sedes/{sede_id}/postular")
def postular_sede(sede_id: int, db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    existe = db.query(models.PostulacionArbitro).filter(
        models.PostulacionArbitro.arbitro_id == current_arbitro.id,
        models.PostulacionArbitro.sede_id == sede_id
    ).first()
    if existe:
        raise HTTPException(status_code=400, detail="Ya estás postulado a esta sede")
    
    postulacion = models.PostulacionArbitro(
        arbitro_id=current_arbitro.id,
        sede_id=sede_id,
        estado="pendiente"
    )
    db.add(postulacion)
    db.commit()
    return {"message": "Postulación enviada"}

@router.get("/partido/{partido_id}/jugadores")
def get_partido_jugadores(partido_id: int, db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    p = db.query(models.Partido).filter(models.Partido.id == partido_id).first()
    if not p:
        raise HTTPException(status_code=404, detail="Partido no encontrado")
    
    def format_equipo(equipo):
        if not equipo: return []
        jugadores = db.query(models.EquipoJugador).filter(
            models.EquipoJugador.equipo_id == equipo.id,
            models.EquipoJugador.estado == 'activo'
        ).all()
        return [{"id": j.jugador_id, "nombre": j.jugador.usuario.nombre, "dorsal": j.numero_dorsal, "foto_url": j.jugador.usuario.foto_url} for j in jugadores if j.jugador and j.jugador.usuario]
        
    return {
        "equipo_local": format_equipo(p.equipo_local),
        "equipo_visita": format_equipo(p.equipo_visita)
    }

@router.get("/partido/{partido_id}/estadisticas")
def get_partido_estadisticas(partido_id: int, db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    p = db.query(models.Partido).filter(models.Partido.id == partido_id).first()
    if not p:
        raise HTTPException(status_code=404, detail="Partido no encontrado")
    
    eventos = db.query(models.EventoPartido).filter(models.EventoPartido.partido_id == partido_id).order_by(models.EventoPartido.minuto.desc()).all()
    
    return {
        "partido": {
            "goles_local": p.goles_local,
            "goles_visita": p.goles_visita,
            "estado": p.estado
        },
        "eventos": [{
            "id": e.id,
            "tipo_evento": e.tipo_evento,
            "minuto": e.minuto,
            "equipo_id": e.equipo_id,
            "detalle": e.detalle,
            "jugador_nombre": e.jugador.usuario.nombre if e.jugador else None
        } for e in eventos]
    }

@router.post("/partido/{partido_id}/evento")
def registrar_evento(partido_id: int, evento: schemas.EventoPartidoCreate, db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    p = db.query(models.Partido).filter(models.Partido.id == partido_id).first()
    if not p:
        raise HTTPException(status_code=404, detail="Partido no encontrado")
        
    nuevo_evento = models.EventoPartido(
        partido_id=partido_id,
        **evento.dict()
    )
    db.add(nuevo_evento)
    
    # Update score if goal
    if evento.tipo_evento == "gol":
        if p.equipo_local_id == evento.equipo_id:
            p.goles_local += 1
        elif p.equipo_visita_id == evento.equipo_id:
            p.goles_visita += 1
            
    db.commit()
    db.refresh(nuevo_evento)
    return {"message": "Evento registrado"}

@router.get("/perfil")
def get_perfil(db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    return {
        "nombre": current_arbitro.nombre,
        "correo": current_arbitro.correo,
        "telefono": current_arbitro.telefono,
        "foto_url": current_arbitro.foto_url,
        "anios_experiencia": current_arbitro.arbitro_detalles.anios_experiencia if current_arbitro.arbitro_detalles else 0,
        "calificacion": float(current_arbitro.arbitro_detalles.calificacion_promedio) if current_arbitro.arbitro_detalles and current_arbitro.arbitro_detalles.calificacion_promedio else 5.0
    }

@router.put("/perfil")
def update_perfil(data: dict, db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    if "nombre" in data:
        current_arbitro.nombre = data["nombre"]
    if "telefono" in data:
        current_arbitro.telefono = data["telefono"]
    if "foto_url" in data:
        current_arbitro.foto_url = data["foto_url"]
    db.commit()
    return {"message": "Perfil actualizado exitosamente"}