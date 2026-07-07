from pydantic import BaseModel, EmailStr
from typing import Optional, List
from datetime import date, time, datetime


class Token(BaseModel):
    access_token: str
    token_type: str

class TokenData(BaseModel):
    correo: Optional[str] = None
    rol_id: Optional[int] = None

class UsuarioBase(BaseModel):
    nombre: str
    correo: EmailStr
    telefono: Optional[str] = None

class UsuarioCreate(UsuarioBase):
    contrasena: str
    rol_id: int

class UsuarioResponse(UsuarioBase):
    id: int
    rol_id: int
    activo: bool
    creado_en: datetime
    class Config:
        orm_mode = True


class JugadorCreate(BaseModel):
    categoria_id: Optional[int] = None
    dorsal_preferido: Optional[int] = None
    posicion: Optional[str] = None
    especialidad: Optional[str] = None

class ArbitroCreate(BaseModel):
    categoria_id: Optional[int] = None
    anios_experiencia: Optional[int] = 0

class EntrenadorCreate(BaseModel):
    anios_experiencia: Optional[int] = 0


class TorneoBase(BaseModel):
    sede_id: int
    categoria_id: Optional[int] = None
    nombre: str
    cupo_equipos: int
    fecha_inicio: date
    fecha_fin: date

class TorneoCreate(TorneoBase):
    pass

class TorneoResponse(TorneoBase):
    id: int
    admin_id: int
    estado: str
    class Config:
        orm_mode = True


class EquipoBase(BaseModel):
    categoria_id: Optional[int] = None
    nombre: str
    escudo_url: Optional[str] = None
    limite_jugadores: int = 20

class EquipoCreate(EquipoBase):
    pass

class EquipoResponse(EquipoBase):
    id: int
    entrenador_id: int
    class Config:
        orm_mode = True


class PartidoBase(BaseModel):
    torneo_id: int
    equipo_local_id: int
    equipo_visita_id: int
    cancha_id: int
    fecha_hora: datetime

class PartidoResponse(PartidoBase):
    id: int
    arbitro_id: Optional[int] = None
    estado: str
    estado_arbitro: str
    goles_local: int
    goles_visita: int
    class Config:
        orm_mode = True

class EventoPartidoCreate(BaseModel):
    equipo_id: int
    jugador_id: Optional[int] = None
    tipo_evento: str
    minuto: int
    detalle: Optional[str] = None
