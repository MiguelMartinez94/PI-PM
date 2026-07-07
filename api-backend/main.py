from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from db.database import engine, Base
from routers import auth_router, administrativos, arbitros, jugadores, entrenadores


Base.metadata.create_all(bind=engine)

app = FastAPI(title="API Torneos de Fútbol", description="Backend para la gestión de torneos deportivos", version="1.0.0")


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(auth_router.router)
app.include_router(administrativos.router)
app.include_router(arbitros.router)
app.include_router(jugadores.router)
app.include_router(entrenadores.router)

@app.get("/")
def read_root():
    return {"message": "Bienvenido a la API de Torneos de Fútbol. Visita /docs para ver la documentación."}
