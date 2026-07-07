from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from db.database import get_db
from models import models
from schemas import schemas
from auth.dependencies import get_current_jugador

router = APIRouter(prefix="/jugadores", tags=["Jugadores"])

@router.get("/agenda")
def get_agenda(db: Session = Depends(get_db), current_jugador: models.Usuario = Depends(get_current_jugador)):
    
    return {"message": f"Agenda de {current_jugador.nombre}"}

@router.post("/equipo/{equipo_id}/unirse")
def solicitar_ingreso_equipo(equipo_id: int, db: Session = Depends(get_db), current_jugador: models.Usuario = Depends(get_current_jugador)):
    solicitud = models.SolicitudEquipo(
        jugador_id=current_jugador.id,
        equipo_id=equipo_id
    )
    db.add(solicitud)
    db.commit()
    db.refresh(solicitud)
    return solicitud
