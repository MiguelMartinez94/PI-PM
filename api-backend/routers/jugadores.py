from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from sqlalchemy import or_
from datetime import datetime

from db.database import get_db
from models import models
from schemas import schemas
from auth.dependencies import get_current_jugador

router = APIRouter(prefix="/jugadores", tags=["Jugadores"])

@router.get("/agenda")
def get_agenda(db: Session = Depends(get_db), current_jugador: models.Usuario = Depends(get_current_jugador)):
    miembro = db.query(models.EquipoJugador).filter(
        models.EquipoJugador.jugador_id == current_jugador.id,
        models.EquipoJugador.estado == 'activo'
    ).first()
    
    if not miembro:
        return {"partidos": []}
        
    equipo_id = miembro.equipo_id
    partidos = db.query(models.Partido).filter(
        or_(models.Partido.equipo_local_id == equipo_id, models.Partido.equipo_visita_id == equipo_id),
        models.Partido.fecha_hora >= datetime.now()
    ).order_by(models.Partido.fecha_hora.asc()).all()
    
    result = []
    for p in partidos:
        result.append({
            "id": p.id,
            "rival": p.equipo_visita.nombre if p.equipo_local_id == equipo_id else p.equipo_local.nombre,
            "condicion": "Local" if p.equipo_local_id == equipo_id else "Visitante",
            "fecha": p.fecha_hora.strftime("%d/%m/%Y"),
            "hora": p.fecha_hora.strftime("%H:%M"),
            "cancha": p.cancha.nombre if p.cancha else "Por definir",
            "asistenciaConfirmada": False # This requires an Asistencia model, mocked for now
        })
        
    return {"partidos": result}

@router.get("/equipos-disponibles")
def get_equipos_disponibles(db: Session = Depends(get_db), current_jugador: models.Usuario = Depends(get_current_jugador)):
    jugador = current_jugador.jugador_detalles
    cat_id = jugador.categoria_id if jugador else None
    
    query = db.query(models.Equipo)
    if cat_id:
        query = query.filter(models.Equipo.categoria_id == cat_id)
        
    equipos = query.all()
    
    # Get active request
    solicitud_activa = db.query(models.SolicitudEquipo).filter(
        models.SolicitudEquipo.jugador_id == current_jugador.id,
        models.SolicitudEquipo.estado == 'pendiente'
    ).first()
    
    return {
        "equipos": [{
            "id": e.id,
            "nombre": e.nombre,
            "entrenador": e.entrenador.usuario.nombre if e.entrenador and e.entrenador.usuario else "Sin entrenador",
            "escudo_url": e.escudo_url,
            "jugadores": db.query(models.EquipoJugador).filter(models.EquipoJugador.equipo_id == e.id, models.EquipoJugador.estado == 'activo').count(),
            "limite_jugadores": e.limite_jugadores
        } for e in equipos],
        "solicitudPendiente": solicitud_activa.equipo_id if solicitud_activa else None
    }

@router.get("/mi-equipo")
def get_mi_equipo(db: Session = Depends(get_db), current_jugador: models.Usuario = Depends(get_current_jugador)):
    miembro = db.query(models.EquipoJugador).filter(
        models.EquipoJugador.jugador_id == current_jugador.id,
        models.EquipoJugador.estado == 'activo'
    ).first()
    
    if not miembro:
        return {"equipo": None}
        
    equipo = miembro.equipo
    
    jugadores = db.query(models.EquipoJugador).filter(
        models.EquipoJugador.equipo_id == equipo.id,
        models.EquipoJugador.estado == 'activo'
    ).all()
    
    return {
        "equipo": {
            "id": equipo.id,
            "nombre": equipo.nombre,
            "escudo_url": equipo.escudo_url,
            "entrenador": equipo.entrenador.usuario.nombre if equipo.entrenador and equipo.entrenador.usuario else "Sin entrenador",
            "torneo": equipo.torneo.nombre if hasattr(equipo, 'torneo') and equipo.torneo else "Sin Torneo",
            "estadisticas": {
                "jugados": 0,
                "ganados": 0,
                "puntos": 0,
                "golesFavor": 0
            },
            "jugadores": [{
                "id": j.jugador_id,
                "nombre": j.jugador.usuario.nombre,
                "dorsal": j.numero_dorsal,
                "posicion": j.jugador.posicion,
                "foto_url": getattr(j.jugador.usuario, 'foto_url', None)
            } for j in jugadores if j.jugador and j.jugador.usuario]
        }
    }

@router.get("/equipo/{equipo_id}")
def get_equipo_detalle(equipo_id: int, db: Session = Depends(get_db), current_jugador: models.Usuario = Depends(get_current_jugador)):
    equipo = db.query(models.Equipo).filter(models.Equipo.id == equipo_id).first()
    if not equipo:
        raise HTTPException(status_code=404, detail="Equipo no encontrado")
        
    return {
        "id": equipo.id,
        "nombre": equipo.nombre,
        "escudo_url": equipo.escudo_url,
        "entrenador": equipo.entrenador.usuario.nombre if equipo.entrenador and equipo.entrenador.usuario else "Sin entrenador",
        "torneo": equipo.torneo.nombre if hasattr(equipo, 'torneo') and equipo.torneo else "Sin Torneo",
        "estadisticas": {
            "jugados": 0,
            "ganados": 0,
            "puntos": 0,
            "golesFavor": 0
        }
    }

@router.post("/equipo/{equipo_id}/unirse")
def solicitar_ingreso_equipo(equipo_id: int, db: Session = Depends(get_db), current_jugador: models.Usuario = Depends(get_current_jugador)):
    miembro = db.query(models.EquipoJugador).filter(
        models.EquipoJugador.jugador_id == current_jugador.id,
        models.EquipoJugador.estado == 'activo'
    ).first()
    if miembro:
        raise HTTPException(status_code=400, detail="Ya perteneces a un equipo")
        
    pendiente = db.query(models.SolicitudEquipo).filter(
        models.SolicitudEquipo.jugador_id == current_jugador.id,
        models.SolicitudEquipo.estado == 'pendiente'
    ).first()
    if pendiente:
        raise HTTPException(status_code=400, detail="Ya tienes una solicitud pendiente")

    solicitud = models.SolicitudEquipo(
        jugador_id=current_jugador.id,
        equipo_id=equipo_id,
        estado="pendiente"
    )
    db.add(solicitud)
    db.commit()
    return {"message": "Solicitud enviada exitosamente"}

@router.post("/partido/{partido_id}/confirmar-asistencia")
def confirmar_asistencia(partido_id: int, data: dict, db: Session = Depends(get_db), current_jugador: models.Usuario = Depends(get_current_jugador)):
    pago_id = data.get("pagoId")
    # For now, just a stub
    return {"message": "Asistencia confirmada", "pago_id": pago_id}

@router.get("/perfil")
def get_perfil(db: Session = Depends(get_db), current_jugador: models.Usuario = Depends(get_current_jugador)):
    return {
        "nombre": current_jugador.nombre,
        "correo": current_jugador.correo,
        "telefono": current_jugador.telefono,
        "foto_url": current_jugador.foto_url,
        "posicion": current_jugador.jugador_detalles.posicion if current_jugador.jugador_detalles else "No definida",
        "dorsal": current_jugador.jugador_detalles.dorsal_preferido if current_jugador.jugador_detalles else 0
    }

@router.put("/perfil")
def update_perfil(data: dict, db: Session = Depends(get_db), current_jugador: models.Usuario = Depends(get_current_jugador)):
    if "nombre" in data:
        current_jugador.nombre = data["nombre"]
    if "telefono" in data:
        current_jugador.telefono = data["telefono"]
    if "foto_url" in data:
        current_jugador.foto_url = data["foto_url"]
    
    if current_jugador.jugador_detalles:
        if "posicion" in data:
            current_jugador.jugador_detalles.posicion = data["posicion"]
        if "dorsal" in data:
            current_jugador.jugador_detalles.dorsal_preferido = data["dorsal"]
            
    db.commit()
    return {"message": "Perfil actualizado exitosamente"}