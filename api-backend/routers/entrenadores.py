from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from db.database import get_db
from models import models
from schemas import schemas
from auth.dependencies import get_current_entrenador

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
    return equipos
