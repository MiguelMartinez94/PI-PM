from fastapi import Depends, FastAPI, UploadFile, File, HTTPException, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import OAuth2PasswordRequestForm
from fastapi.staticfiles import StaticFiles
from sqlalchemy import text
from sqlalchemy.exc import OperationalError
import os
import shutil
import time
import uuid

from db.database import engine, Base, SessionLocal
from security.hashing import verify_password
from auth.jwt_handler import create_access_token
from routers import administrativos, arbitros, entrenadores, jugadores
from routers import auth_router


def init_db():
    retries = 5
    while retries > 0:
        try:
            Base.metadata.create_all(bind=engine)
            print("Database connected and tables created.")
            break
        except OperationalError:
            print("Database not ready yet, retrying in 2 seconds...")
            time.sleep(2)
            retries -= 1


init_db()

app = FastAPI(
    title="API Torneos de Fútbol",
    description="Backend para la gestión de torneos deportivos",
    version="1.0.0",
)

app.add_middleware(
    CORSMiddleware,
    allow_origin_regex=r"https?://(localhost|127\.0\.0\.1|0\.0\.0\.0|10\.\d+\.\d+\.\d+|192\.168\.\d+\.\d+|172\.(1[6-9]|2\d|3[0-1])\.\d+\.\d+)(:\d+)?$",
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

UPLOAD_DIR = "uploads"
os.makedirs(UPLOAD_DIR, exist_ok=True)
app.mount("/uploads", StaticFiles(directory=UPLOAD_DIR), name="uploads")

app.include_router(administrativos.router)
app.include_router(arbitros.router)
app.include_router(entrenadores.router)
app.include_router(jugadores.router)
app.include_router(auth_router.router)


@app.post("/auth/login")
def login(form_data: OAuth2PasswordRequestForm = Depends()):
    with SessionLocal() as db:
        result = db.execute(
            text(
                """
                SELECT u.id, u.correo, u.contrasena_hash, u.rol_id, u.activo, r.nombre as rol_nombre
                FROM usuarios u
                LEFT JOIN roles r ON r.id = u.rol_id
                WHERE u.correo = :correo
                LIMIT 1
                """
            ),
            {"correo": form_data.username},
        ).first()

    if result is None:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Correo o contraseña incorrectos",
        )

    if not result.activo:
        raise HTTPException(status_code=400, detail="Usuario inactivo")

    if not verify_password(form_data.password, result.contrasena_hash):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Correo o contraseña incorrectos",
        )

    access_token = create_access_token(data={"sub": result.correo, "rol_id": result.rol_id})

    return {
        "access_token": access_token,
        "token_type": "bearer",
        "user_id": result.id,
        "rol_id": result.rol_id,
        "rol_nombre": result.rol_nombre,
    }





@app.post("/upload")
def upload_file(file: UploadFile = File(...)):
    file_extension = file.filename.split(".")[-1]
    file_name = f"{uuid.uuid4()}.{file_extension}"
    file_path = os.path.join(UPLOAD_DIR, file_name)
    with open(file_path, "wb") as buffer:
        shutil.copyfileobj(file.file, buffer)
    return {"url": f"/uploads/{file_name}"}


@app.get("/")
def read_root():
    return {
        "message": "Bienvenido a la API de Torneos de Fútbol. Visita /docs para ver la documentación."
    }


@app.get("/health")
def health():
    return {"status": "ok"}
