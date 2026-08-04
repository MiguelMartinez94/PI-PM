from sqlalchemy import Column, Integer, SmallInteger, String, Boolean, ForeignKey, Numeric, Date, Time, DateTime, Text
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from db.database import Base

class Rol(Base):
    __tablename__ = 'roles'
    id = Column(SmallInteger, primary_key=True)
    nombre = Column(String(50), nullable=False, unique=True)
    descripcion = Column(String(150))
    usuarios = relationship('Usuario', back_populates='rol')

class Categoria(Base):
    __tablename__ = 'categorias'
    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(60), nullable=False, unique=True)
    descripcion = Column(String(200))

class Usuario(Base):
    __tablename__ = 'usuarios'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    rol_id = Column(SmallInteger, ForeignKey('roles.id'), nullable=False)
    nombre = Column(String(100), nullable=False)
    correo = Column(String(150), nullable=False, unique=True)
    contrasena_hash = Column(String(255), nullable=False)
    telefono = Column(String(20))
    foto_url = Column(String(255))
    activo = Column(Boolean, default=True, nullable=False)
    creado_en = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)
    actualizado_en = Column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now(), nullable=False)

    rol = relationship('Rol', back_populates='usuarios')
    jugador_detalles = relationship('Jugador', back_populates='usuario', uselist=False, cascade="all, delete-orphan")
    arbitro_detalles = relationship('Arbitro', back_populates='usuario', uselist=False, cascade="all, delete-orphan")
    entrenador_detalles = relationship('Entrenador', back_populates='usuario', uselist=False, cascade="all, delete-orphan")
    sedes_administradas = relationship('Sede', back_populates='admin')
    torneos_administrados = relationship('Torneo', back_populates='admin')

class Jugador(Base):
    __tablename__ = 'jugadores'
    usuario_id = Column(Integer, ForeignKey('usuarios.id', ondelete='CASCADE'), primary_key=True)
    categoria_id = Column(Integer, ForeignKey('categorias.id'))
    dorsal_preferido = Column(SmallInteger)
    posicion = Column(String(30))
    especialidad = Column(String(60))

    usuario = relationship('Usuario', back_populates='jugador_detalles')
    categoria = relationship('Categoria')
    equipos = relationship('EquipoJugador', back_populates='jugador')
    solicitudes = relationship('SolicitudEquipo', back_populates='jugador')
    eventos = relationship('EventoPartido', foreign_keys="[EventoPartido.jugador_id]", back_populates='jugador')
    eventos_entra = relationship('EventoPartido', foreign_keys="[EventoPartido.jugador_entra_id]", back_populates='jugador_entra')
    sanciones = relationship('Sancion', back_populates='jugador')

class Arbitro(Base):
    __tablename__ = 'arbitros'
    usuario_id = Column(Integer, ForeignKey('usuarios.id', ondelete='CASCADE'), primary_key=True)
    categoria_id = Column(Integer, ForeignKey('categorias.id'))
    anios_experiencia = Column(SmallInteger, default=0)
    calificacion_promedio = Column(Numeric(3, 2))

    usuario = relationship('Usuario', back_populates='arbitro_detalles')
    categoria = relationship('Categoria')
    partidos = relationship('Partido', back_populates='arbitro')
    postulaciones = relationship('PostulacionArbitro', back_populates='arbitro')
    pagos = relationship('PagoArbitraje', back_populates='arbitro')

class Entrenador(Base):
    __tablename__ = 'entrenadores'
    usuario_id = Column(Integer, ForeignKey('usuarios.id', ondelete='CASCADE'), primary_key=True)
    anios_experiencia = Column(SmallInteger, default=0)

    usuario = relationship('Usuario', back_populates='entrenador_detalles')
    equipos = relationship('Equipo', back_populates='entrenador')

class Sede(Base):
    __tablename__ = 'sedes'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    admin_id = Column(Integer, ForeignKey('usuarios.id'), nullable=False)
    nombre = Column(String(100), nullable=False)
    direccion = Column(String(255), nullable=False)
    activa = Column(Boolean, default=True, nullable=False)
    creado_en = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)
    telefono = Column(String(20))
    ciudad = Column(String(100))
    cantidad_canchas = Column(Integer, default=1)
    horario_apertura = Column(Time)
    horario_cierre = Column(Time)
    foto_url = Column(String(255))
    amenidades = Column(Text)

    admin = relationship('Usuario', back_populates='sedes_administradas')
    canchas = relationship('Cancha', back_populates='sede', cascade="all, delete-orphan")
    torneos = relationship('Torneo', back_populates='sede')

class Cancha(Base):
    __tablename__ = 'canchas'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    sede_id = Column(Integer, ForeignKey('sedes.id', ondelete='CASCADE'), nullable=False)
    nombre = Column(String(50), nullable=False)
    tipo_superficie = Column(String(30))
    techada = Column(Boolean, default=False, nullable=False)
    activa = Column(Boolean, default=True, nullable=False)

    sede = relationship('Sede', back_populates='canchas')
    horarios = relationship('HorarioCancha', back_populates='cancha', cascade="all, delete-orphan")
    partidos = relationship('Partido', back_populates='cancha')

class HorarioCancha(Base):
    __tablename__ = 'horarios_cancha'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    cancha_id = Column(Integer, ForeignKey('canchas.id', ondelete='CASCADE'), nullable=False)
    dia_semana = Column(SmallInteger, nullable=False)
    hora_inicio = Column(Time, nullable=False)
    hora_fin = Column(Time, nullable=False)

    cancha = relationship('Cancha', back_populates='horarios')

class Equipo(Base):
    __tablename__ = 'equipos'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    entrenador_id = Column(Integer, ForeignKey('entrenadores.usuario_id'), nullable=False)
    categoria_id = Column(Integer, ForeignKey('categorias.id'))
    nombre = Column(String(100), nullable=False)
    escudo_url = Column(String(255))
    limite_jugadores = Column(SmallInteger, default=20, nullable=False)
    creado_en = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    entrenador = relationship('Entrenador', back_populates='equipos')
    categoria = relationship('Categoria')
    jugadores = relationship('EquipoJugador', back_populates='equipo')
    solicitudes = relationship('SolicitudEquipo', back_populates='equipo')
    torneos = relationship('TorneoEquipo', back_populates='equipo')
    eventos = relationship('EventoPartido', back_populates='equipo')
    sanciones = relationship('Sancion', back_populates='equipo')
    pagos_inscripcion = relationship('PagoInscripcion', back_populates='equipo')

class EquipoJugador(Base):
    __tablename__ = 'equipo_jugadores'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    equipo_id = Column(Integer, ForeignKey('equipos.id', ondelete='CASCADE'), nullable=False)
    jugador_id = Column(Integer, ForeignKey('jugadores.usuario_id'), nullable=False)
    numero_dorsal = Column(SmallInteger, nullable=False)
    fecha_ingreso = Column(Date, server_default=func.current_date(), nullable=False)
    fecha_baja = Column(Date)
    estado = Column(String(20), default='activo', nullable=False)

    equipo = relationship('Equipo', back_populates='jugadores')
    jugador = relationship('Jugador', back_populates='equipos')

class SolicitudEquipo(Base):
    __tablename__ = 'solicitudes_equipo'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    jugador_id = Column(Integer, ForeignKey('jugadores.usuario_id'), nullable=False)
    equipo_id = Column(Integer, ForeignKey('equipos.id', ondelete='CASCADE'), nullable=False)
    estado = Column(String(20), default='pendiente', nullable=False)
    fecha_solicitud = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)
    fecha_respuesta = Column(DateTime(timezone=True))

    jugador = relationship('Jugador', back_populates='solicitudes')
    equipo = relationship('Equipo', back_populates='solicitudes')

class Torneo(Base):
    __tablename__ = 'torneos'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    sede_id = Column(Integer, ForeignKey('sedes.id'), nullable=False)
    admin_id = Column(Integer, ForeignKey('usuarios.id'), nullable=False)
    categoria_id = Column(Integer, ForeignKey('categorias.id'))
    nombre = Column(String(100), nullable=False)
    cupo_equipos = Column(SmallInteger, nullable=False)
    estado = Column(String(20), default='planeado', nullable=False)
    fecha_inicio = Column(Date, nullable=False)
    fecha_fin = Column(Date, nullable=False)
    creado_en = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)
    formato = Column(String(50))
    costo_inscripcion = Column(Numeric(10, 2))
    reglamento_url = Column(String(255))

    sede = relationship('Sede', back_populates='torneos')
    admin = relationship('Usuario', back_populates='torneos_administrados')
    categoria = relationship('Categoria')
    equipos = relationship('TorneoEquipo', back_populates='torneo')
    partidos = relationship('Partido', back_populates='torneo')
    pagos_inscripcion = relationship('PagoInscripcion', back_populates='torneo')
    posiciones = relationship('TablaPosicion', back_populates='torneo')

class TorneoEquipo(Base):
    __tablename__ = 'torneo_equipos'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    torneo_id = Column(Integer, ForeignKey('torneos.id', ondelete='CASCADE'), nullable=False)
    equipo_id = Column(Integer, ForeignKey('equipos.id', ondelete='CASCADE'), nullable=False)
    fecha_inscripcion = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)
    estado = Column(String(20), default='inscrito', nullable=False)

    torneo = relationship('Torneo', back_populates='equipos')
    equipo = relationship('Equipo', back_populates='torneos')

class Partido(Base):
    __tablename__ = 'partidos'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    torneo_id = Column(Integer, ForeignKey('torneos.id', ondelete='CASCADE'), nullable=False)
    equipo_local_id = Column(Integer, ForeignKey('equipos.id'), nullable=False)
    equipo_visita_id = Column(Integer, ForeignKey('equipos.id'), nullable=False)
    arbitro_id = Column(Integer, ForeignKey('arbitros.usuario_id'))
    cancha_id = Column(Integer, ForeignKey('canchas.id'), nullable=False)
    fecha_hora = Column(DateTime(timezone=True), nullable=False)
    estado = Column(String(20), default='programado', nullable=False)
    estado_arbitro = Column(String(20), default='pendiente', nullable=False)
    goles_local = Column(SmallInteger, default=0, nullable=False)
    goles_visita = Column(SmallInteger, default=0, nullable=False)
    minutos_extra = Column(SmallInteger, default=0, nullable=False)
    motivo_cancelacion = Column(String(255))
    creado_en = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    torneo = relationship('Torneo', back_populates='partidos')
    cancha = relationship('Cancha', back_populates='partidos')
    arbitro = relationship('Arbitro', back_populates='partidos')
    equipo_local = relationship('Equipo', foreign_keys=[equipo_local_id])
    equipo_visita = relationship('Equipo', foreign_keys=[equipo_visita_id])
    eventos = relationship('EventoPartido', back_populates='partido')
    pagos = relationship('PagoArbitraje', back_populates='partido')
    alineaciones = relationship('Alineacion', back_populates='partido')

class PostulacionArbitro(Base):
    __tablename__ = 'postulaciones_arbitro'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    arbitro_id = Column(Integer, ForeignKey('arbitros.usuario_id'), nullable=False)
    torneo_id = Column(Integer, ForeignKey('torneos.id', ondelete='CASCADE'))
    equipo_id = Column(Integer, ForeignKey('equipos.id', ondelete='CASCADE'))
    estado = Column(String(20), default='pendiente', nullable=False)
    fecha_postulacion = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    arbitro = relationship('Arbitro', back_populates='postulaciones')

class EventoPartido(Base):
    __tablename__ = 'eventos_partido'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    partido_id = Column(Integer, ForeignKey('partidos.id', ondelete='CASCADE'), nullable=False)
    equipo_id = Column(Integer, ForeignKey('equipos.id'), nullable=False)
    jugador_id = Column(Integer, ForeignKey('jugadores.usuario_id'))
    jugador_entra_id = Column(Integer, ForeignKey('jugadores.usuario_id'))
    tipo_evento = Column(String(30), nullable=False)
    minuto = Column(SmallInteger, nullable=False)
    detalle = Column(String(255))
    creado_en = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    partido = relationship('Partido', back_populates='eventos')
    equipo = relationship('Equipo', back_populates='eventos')
    jugador = relationship('Jugador', foreign_keys=[jugador_id], back_populates='eventos')
    jugador_entra = relationship('Jugador', foreign_keys=[jugador_entra_id], back_populates='eventos_entra')

class Sancion(Base):
    __tablename__ = 'sanciones'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    jugador_id = Column(Integer, ForeignKey('jugadores.usuario_id'))
    equipo_id = Column(Integer, ForeignKey('equipos.id'))
    partido_id = Column(Integer, ForeignKey('partidos.id'))
    tipo = Column(String(30), nullable=False)
    motivo = Column(String(255))
    partidos_suspension = Column(SmallInteger, default=0, nullable=False)
    fecha_inicio = Column(Date, server_default=func.current_date(), nullable=False)
    fecha_fin = Column(Date)
    estado = Column(String(20), default='activa', nullable=False)
    creado_en = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    jugador = relationship('Jugador', back_populates='sanciones')
    equipo = relationship('Equipo', back_populates='sanciones')

class PagoInscripcion(Base):
    __tablename__ = 'pagos_inscripcion'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    torneo_id = Column(Integer, ForeignKey('torneos.id'), nullable=False)
    equipo_id = Column(Integer, ForeignKey('equipos.id'), nullable=False)
    monto = Column(Numeric(10,2), nullable=False)
    metodo = Column(String(50))
    estado = Column(String(20), default='pendiente', nullable=False)
    pagado_en = Column(DateTime(timezone=True))

    torneo = relationship('Torneo', back_populates='pagos_inscripcion')
    equipo = relationship('Equipo', back_populates='pagos_inscripcion')

class PagoArbitraje(Base):
    __tablename__ = 'pagos_arbitraje'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    partido_id = Column(Integer, ForeignKey('partidos.id'), nullable=False)
    arbitro_id = Column(Integer, ForeignKey('arbitros.usuario_id'), nullable=False)
    monto = Column(Numeric(10,2), nullable=False)
    metodo = Column(String(50))
    estado = Column(String(20), default='pendiente', nullable=False)
    pagado_en = Column(DateTime(timezone=True))

    partido = relationship('Partido', back_populates='pagos')
    arbitro = relationship('Arbitro', back_populates='pagos')

class Alineacion(Base):
    __tablename__ = 'alineaciones'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    partido_id = Column(Integer, ForeignKey('partidos.id', ondelete='CASCADE'), nullable=False)
    equipo_id = Column(Integer, ForeignKey('equipos.id'), nullable=False)
    entrenador_id = Column(Integer, ForeignKey('entrenadores.usuario_id'), nullable=False)
    formacion = Column(String(10))
    creado_en = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    partido = relationship('Partido', back_populates='alineaciones')
    jugadores = relationship('AlineacionJugador', back_populates='alineacion', cascade="all, delete-orphan")

class AlineacionJugador(Base):
    __tablename__ = 'alineacion_jugadores'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    alineacion_id = Column(Integer, ForeignKey('alineaciones.id', ondelete='CASCADE'), nullable=False)
    jugador_id = Column(Integer, ForeignKey('jugadores.usuario_id'), nullable=False)
    posicion = Column(String(30), nullable=False)
    es_titular = Column(Boolean, default=True, nullable=False)
    numero_dorsal = Column(SmallInteger)

    alineacion = relationship('Alineacion', back_populates='jugadores')

class TablaPosicion(Base):
    __tablename__ = 'tabla_posiciones'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    torneo_id = Column(Integer, ForeignKey('torneos.id', ondelete='CASCADE'), nullable=False)
    equipo_id = Column(Integer, ForeignKey('equipos.id', ondelete='CASCADE'), nullable=False)
    partidos_jugados = Column(SmallInteger, default=0, nullable=False)
    ganados = Column(SmallInteger, default=0, nullable=False)
    empatados = Column(SmallInteger, default=0, nullable=False)
    perdidos = Column(SmallInteger, default=0, nullable=False)
    goles_favor = Column(SmallInteger, default=0, nullable=False)
    goles_contra = Column(SmallInteger, default=0, nullable=False)
    puntos = Column(SmallInteger, default=0, nullable=False)
    actualizado_en = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    torneo = relationship('Torneo', back_populates='posiciones')
