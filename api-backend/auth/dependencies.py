from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.orm import Session
from jose import JWTError

from db.database import get_db
from models import models
from schemas import schemas
from auth.jwt_handler import verify_access_token

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/login")

def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="No se pudieron validar las credenciales",
        headers={"WWW-Authenticate": "Bearer"},
    )
    payload = verify_access_token(token)
    if payload is None:
        raise credentials_exception
        
    correo: str = payload.get("sub")
    if correo is None:
        raise credentials_exception
        
    user = db.query(models.Usuario).filter(models.Usuario.correo == correo).first()
    if user is None:
        raise credentials_exception
    return user

def require_role(required_role_id: int):
    def role_dependency(current_user: models.Usuario = Depends(get_current_user)):
        if current_user.rol_id != required_role_id:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail=f"Permisos insuficientes. Se requiere rol_id {required_role_id}"
            )
        return current_user
    return role_dependency


get_current_admin = require_role(1)
get_current_jugador = require_role(3)
get_current_arbitro = require_role(2)
get_current_entrenador = require_role(4)
