from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from db.database import get_db
from models import models
from schemas import schemas
from auth.dependencies import get_current_arbitro

router = APIRouter(prefix="/arbitros", tags=["Árbitros"])

@router.get("/mis-partidos")
def get_mis_partidos(db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    
    partidos = db.query(models.Partido).filter(models.Partido.arbitro_id == current_arbitro.id).all()
    return partidos

@router.post("/partido/{partido_id}/evento")
def registrar_evento(partido_id: int, evento: schemas.EventoPartidoCreate, db: Session = Depends(get_db), current_arbitro: models.Usuario = Depends(get_current_arbitro)):
    nuevo_evento = models.EventoPartido(
        partido_id=partido_id,
        **evento.dict()
    )
    db.add(nuevo_evento)
    db.commit()
    db.refresh(nuevo_evento)
    return nuevo_evento
