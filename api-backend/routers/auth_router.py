from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.orm import Session

from db.database import get_db
from models import models
from schemas import schemas
from security.hashing import verify_password
from auth.jwt_handler import create_access_token

router = APIRouter(prefix="/auth", tags=["Autenticación"])

@router.post("/login", response_model=schemas.Token)
def login(form_data: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(get_db)):
    user = db.query(models.Usuario).filter(models.Usuario.correo == form_data.username).first()
    if not user or not verify_password(form_data.password, user.contrasena_hash):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Correo o contraseña incorrectos",
            headers={"WWW-Authenticate": "Bearer"},
        )
    if not user.activo:
        raise HTTPException(status_code=400, detail="Usuario inactivo")
        
    access_token = create_access_token(data={"sub": user.correo, "rol_id": user.rol_id})
    rol_nombre = user.rol.nombre if user.rol else None
    return {
        "access_token": access_token, 
        "token_type": "bearer",
        "user_id": user.id,
        "rol_id": user.rol_id,
        "rol_nombre": rol_nombre
    }
