from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from db.database import get_db
from models import models
from schemas import schemas
from auth.dependencies import get_current_admin

router = APIRouter(prefix="/admin", tags=["Administrativos"])

@router.get("/dashboard")
def get_dashboard(db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    return {"message": f"Bienvenido super_admin {current_admin.nombre}", "data": "Dashboard Data"}

@router.post("/torneos", response_model=schemas.TorneoResponse)
def crear_torneo(torneo: schemas.TorneoCreate, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    nuevo_torneo = models.Torneo(
        **torneo.dict(),
        admin_id=current_admin.id
    )
    db.add(nuevo_torneo)
    db.commit()
    db.refresh(nuevo_torneo)
    return nuevo_torneo
