਍ഀ
\restrict nmIPjwv8sSE4PenL5vwPyIekufaDct7ktkPMNgH8c1Vk1jEks1b3YkGD0fsB6gB਍ഀ
਍ഀ
਍ഀ
SET statement_timeout = 0;਍ഀ
SET lock_timeout = 0;਍ഀ
SET idle_in_transaction_session_timeout = 0;਍ഀ
SET client_encoding = 'UTF8';਍ഀ
SET standard_conforming_strings = on;਍ഀ
SELECT pg_catalog.set_config('search_path', '', false);਍ഀ
SET check_function_bodies = false;਍ഀ
SET xmloption = content;਍ഀ
SET client_min_messages = warning;਍ഀ
SET row_security = off;਍ഀ
਍ഀ
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_rol_id_fkey;਍ഀ
ALTER TABLE ONLY public.torneos DROP CONSTRAINT torneos_sede_id_fkey;਍ഀ
ALTER TABLE ONLY public.torneos DROP CONSTRAINT torneos_categoria_id_fkey;਍ഀ
ALTER TABLE ONLY public.torneos DROP CONSTRAINT torneos_admin_id_fkey;਍ഀ
ALTER TABLE ONLY public.torneo_equipos DROP CONSTRAINT torneo_equipos_torneo_id_fkey;਍ഀ
ALTER TABLE ONLY public.torneo_equipos DROP CONSTRAINT torneo_equipos_equipo_id_fkey;਍ഀ
ALTER TABLE ONLY public.tabla_posiciones DROP CONSTRAINT tabla_posiciones_torneo_id_fkey;਍ഀ
ALTER TABLE ONLY public.tabla_posiciones DROP CONSTRAINT tabla_posiciones_equipo_id_fkey;਍ഀ
ALTER TABLE ONLY public.solicitudes_equipo DROP CONSTRAINT solicitudes_equipo_jugador_id_fkey;਍ഀ
ALTER TABLE ONLY public.solicitudes_equipo DROP CONSTRAINT solicitudes_equipo_equipo_id_fkey;਍ഀ
ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_admin_id_fkey;਍ഀ
ALTER TABLE ONLY public.sanciones DROP CONSTRAINT sanciones_partido_id_fkey;਍ഀ
ALTER TABLE ONLY public.sanciones DROP CONSTRAINT sanciones_jugador_id_fkey;਍ഀ
ALTER TABLE ONLY public.sanciones DROP CONSTRAINT sanciones_equipo_id_fkey;਍ഀ
ALTER TABLE ONLY public.postulaciones_arbitro DROP CONSTRAINT postulaciones_arbitro_torneo_id_fkey;਍ഀ
ALTER TABLE ONLY public.postulaciones_arbitro DROP CONSTRAINT postulaciones_arbitro_equipo_id_fkey;਍ഀ
ALTER TABLE ONLY public.postulaciones_arbitro DROP CONSTRAINT postulaciones_arbitro_arbitro_id_fkey;਍ഀ
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_torneo_id_fkey;਍ഀ
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_equipo_visita_id_fkey;਍ഀ
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_equipo_local_id_fkey;਍ഀ
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_cancha_id_fkey;਍ഀ
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_arbitro_id_fkey;਍ഀ
ALTER TABLE ONLY public.pagos_inscripcion DROP CONSTRAINT pagos_inscripcion_torneo_id_fkey;਍ഀ
ALTER TABLE ONLY public.pagos_inscripcion DROP CONSTRAINT pagos_inscripcion_equipo_id_fkey;਍ഀ
ALTER TABLE ONLY public.pagos_arbitraje DROP CONSTRAINT pagos_arbitraje_partido_id_fkey;਍ഀ
ALTER TABLE ONLY public.pagos_arbitraje DROP CONSTRAINT pagos_arbitraje_arbitro_id_fkey;਍ഀ
ALTER TABLE ONLY public.jugadores DROP CONSTRAINT jugadores_usuario_id_fkey;਍ഀ
ALTER TABLE ONLY public.jugadores DROP CONSTRAINT jugadores_categoria_id_fkey;਍ഀ
ALTER TABLE ONLY public.horarios_cancha DROP CONSTRAINT horarios_cancha_cancha_id_fkey;਍ഀ
ALTER TABLE ONLY public.eventos_partido DROP CONSTRAINT eventos_partido_partido_id_fkey;਍ഀ
ALTER TABLE ONLY public.eventos_partido DROP CONSTRAINT eventos_partido_jugador_id_fkey;਍ഀ
ALTER TABLE ONLY public.eventos_partido DROP CONSTRAINT eventos_partido_jugador_entra_id_fkey;਍ഀ
ALTER TABLE ONLY public.eventos_partido DROP CONSTRAINT eventos_partido_equipo_id_fkey;਍ഀ
ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_entrenador_id_fkey;਍ഀ
ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_categoria_id_fkey;਍ഀ
ALTER TABLE ONLY public.equipo_jugadores DROP CONSTRAINT equipo_jugadores_jugador_id_fkey;਍ഀ
ALTER TABLE ONLY public.equipo_jugadores DROP CONSTRAINT equipo_jugadores_equipo_id_fkey;਍ഀ
ALTER TABLE ONLY public.entrenadores DROP CONSTRAINT entrenadores_usuario_id_fkey;਍ഀ
ALTER TABLE ONLY public.canchas DROP CONSTRAINT canchas_sede_id_fkey;਍ഀ
ALTER TABLE ONLY public.arbitros DROP CONSTRAINT arbitros_usuario_id_fkey;਍ഀ
ALTER TABLE ONLY public.arbitros DROP CONSTRAINT arbitros_categoria_id_fkey;਍ഀ
ALTER TABLE ONLY public.alineaciones DROP CONSTRAINT alineaciones_partido_id_fkey;਍ഀ
ALTER TABLE ONLY public.alineaciones DROP CONSTRAINT alineaciones_equipo_id_fkey;਍ഀ
ALTER TABLE ONLY public.alineaciones DROP CONSTRAINT alineaciones_entrenador_id_fkey;਍ഀ
ALTER TABLE ONLY public.alineacion_jugadores DROP CONSTRAINT alineacion_jugadores_jugador_id_fkey;਍ഀ
ALTER TABLE ONLY public.alineacion_jugadores DROP CONSTRAINT alineacion_jugadores_alineacion_id_fkey;਍ഀ
DROP INDEX public.ix_usuarios_id;਍ഀ
DROP INDEX public.ix_torneos_id;਍ഀ
DROP INDEX public.ix_torneo_equipos_id;਍ഀ
DROP INDEX public.ix_tabla_posiciones_id;਍ഀ
DROP INDEX public.ix_solicitudes_equipo_id;਍ഀ
DROP INDEX public.ix_sedes_id;਍ഀ
DROP INDEX public.ix_sanciones_id;਍ഀ
DROP INDEX public.ix_postulaciones_arbitro_id;਍ഀ
DROP INDEX public.ix_partidos_id;਍ഀ
DROP INDEX public.ix_pagos_inscripcion_id;਍ഀ
DROP INDEX public.ix_pagos_arbitraje_id;਍ഀ
DROP INDEX public.ix_horarios_cancha_id;਍ഀ
DROP INDEX public.ix_eventos_partido_id;਍ഀ
DROP INDEX public.ix_equipos_id;਍ഀ
DROP INDEX public.ix_equipo_jugadores_id;਍ഀ
DROP INDEX public.ix_categorias_id;਍ഀ
DROP INDEX public.ix_canchas_id;਍ഀ
DROP INDEX public.ix_alineaciones_id;਍ഀ
DROP INDEX public.ix_alineacion_jugadores_id;਍ഀ
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;਍ഀ
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_correo_key;਍ഀ
ALTER TABLE ONLY public.torneos DROP CONSTRAINT torneos_pkey;਍ഀ
ALTER TABLE ONLY public.torneo_equipos DROP CONSTRAINT torneo_equipos_pkey;਍ഀ
ALTER TABLE ONLY public.tabla_posiciones DROP CONSTRAINT tabla_posiciones_pkey;਍ഀ
ALTER TABLE ONLY public.solicitudes_equipo DROP CONSTRAINT solicitudes_equipo_pkey;਍ഀ
ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_pkey;਍ഀ
ALTER TABLE ONLY public.sanciones DROP CONSTRAINT sanciones_pkey;਍ഀ
ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;਍ഀ
ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_nombre_key;਍ഀ
ALTER TABLE ONLY public.postulaciones_arbitro DROP CONSTRAINT postulaciones_arbitro_pkey;਍ഀ
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_pkey;਍ഀ
ALTER TABLE ONLY public.pagos_inscripcion DROP CONSTRAINT pagos_inscripcion_pkey;਍ഀ
ALTER TABLE ONLY public.pagos_arbitraje DROP CONSTRAINT pagos_arbitraje_pkey;਍ഀ
ALTER TABLE ONLY public.jugadores DROP CONSTRAINT jugadores_pkey;਍ഀ
ALTER TABLE ONLY public.horarios_cancha DROP CONSTRAINT horarios_cancha_pkey;਍ഀ
ALTER TABLE ONLY public.eventos_partido DROP CONSTRAINT eventos_partido_pkey;਍ഀ
ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_pkey;਍ഀ
ALTER TABLE ONLY public.equipo_jugadores DROP CONSTRAINT equipo_jugadores_pkey;਍ഀ
ALTER TABLE ONLY public.entrenadores DROP CONSTRAINT entrenadores_pkey;਍ഀ
ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;਍ഀ
ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_nombre_key;਍ഀ
ALTER TABLE ONLY public.canchas DROP CONSTRAINT canchas_pkey;਍ഀ
ALTER TABLE ONLY public.arbitros DROP CONSTRAINT arbitros_pkey;਍ഀ
ALTER TABLE ONLY public.alineaciones DROP CONSTRAINT alineaciones_pkey;਍ഀ
ALTER TABLE ONLY public.alineacion_jugadores DROP CONSTRAINT alineacion_jugadores_pkey;਍ഀ
ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.torneos ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.torneo_equipos ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.tabla_posiciones ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.solicitudes_equipo ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.sedes ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.sanciones ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.postulaciones_arbitro ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.partidos ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.pagos_inscripcion ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.pagos_arbitraje ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.horarios_cancha ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.eventos_partido ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.equipos ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.equipo_jugadores ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.categorias ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.canchas ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.alineaciones ALTER COLUMN id DROP DEFAULT;਍ഀ
ALTER TABLE public.alineacion_jugadores ALTER COLUMN id DROP DEFAULT;਍ഀ
DROP SEQUENCE public.usuarios_id_seq;਍ഀ
DROP TABLE public.usuarios;਍ഀ
DROP SEQUENCE public.torneos_id_seq;਍ഀ
DROP TABLE public.torneos;਍ഀ
DROP SEQUENCE public.torneo_equipos_id_seq;਍ഀ
DROP TABLE public.torneo_equipos;਍ഀ
DROP SEQUENCE public.tabla_posiciones_id_seq;਍ഀ
DROP TABLE public.tabla_posiciones;਍ഀ
DROP SEQUENCE public.solicitudes_equipo_id_seq;਍ഀ
DROP TABLE public.solicitudes_equipo;਍ഀ
DROP SEQUENCE public.sedes_id_seq;਍ഀ
DROP TABLE public.sedes;਍ഀ
DROP SEQUENCE public.sanciones_id_seq;਍ഀ
DROP TABLE public.sanciones;਍ഀ
DROP SEQUENCE public.roles_id_seq;਍ഀ
DROP TABLE public.roles;਍ഀ
DROP SEQUENCE public.postulaciones_arbitro_id_seq;਍ഀ
DROP TABLE public.postulaciones_arbitro;਍ഀ
DROP SEQUENCE public.partidos_id_seq;਍ഀ
DROP TABLE public.partidos;਍ഀ
DROP SEQUENCE public.pagos_inscripcion_id_seq;਍ഀ
DROP TABLE public.pagos_inscripcion;਍ഀ
DROP SEQUENCE public.pagos_arbitraje_id_seq;਍ഀ
DROP TABLE public.pagos_arbitraje;਍ഀ
DROP TABLE public.jugadores;਍ഀ
DROP SEQUENCE public.horarios_cancha_id_seq;਍ഀ
DROP TABLE public.horarios_cancha;਍ഀ
DROP SEQUENCE public.eventos_partido_id_seq;਍ഀ
DROP TABLE public.eventos_partido;਍ഀ
DROP SEQUENCE public.equipos_id_seq;਍ഀ
DROP TABLE public.equipos;਍ഀ
DROP SEQUENCE public.equipo_jugadores_id_seq;਍ഀ
DROP TABLE public.equipo_jugadores;਍ഀ
DROP TABLE public.entrenadores;਍ഀ
DROP SEQUENCE public.categorias_id_seq;਍ഀ
DROP TABLE public.categorias;਍ഀ
DROP SEQUENCE public.canchas_id_seq;਍ഀ
DROP TABLE public.canchas;਍ഀ
DROP TABLE public.arbitros;਍ഀ
DROP SEQUENCE public.alineaciones_id_seq;਍ഀ
DROP TABLE public.alineaciones;਍ഀ
DROP SEQUENCE public.alineacion_jugadores_id_seq;਍ഀ
DROP TABLE public.alineacion_jugadores;਍ഀ
SET default_tablespace = '';਍ഀ
਍ഀ
SET default_table_access_method = heap;਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.alineacion_jugadores (਍ഀ
    id integer NOT NULL,਍ഀ
    alineacion_id integer NOT NULL,਍ഀ
    jugador_id integer NOT NULL,਍ഀ
    posicion character varying(30) NOT NULL,਍ഀ
    es_titular boolean NOT NULL,਍ഀ
    numero_dorsal smallint਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.alineacion_jugadores_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.alineacion_jugadores_id_seq OWNED BY public.alineacion_jugadores.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.alineaciones (਍ഀ
    id integer NOT NULL,਍ഀ
    partido_id integer NOT NULL,਍ഀ
    equipo_id integer NOT NULL,਍ഀ
    entrenador_id integer NOT NULL,਍ഀ
    formacion character varying(10),਍ഀ
    creado_en timestamp with time zone DEFAULT now() NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.alineaciones_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.alineaciones_id_seq OWNED BY public.alineaciones.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.arbitros (਍ഀ
    usuario_id integer NOT NULL,਍ഀ
    categoria_id integer,਍ഀ
    anios_experiencia smallint,਍ഀ
    calificacion_promedio numeric(3,2),਍ഀ
    certificado_url character varying(255)਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.canchas (਍ഀ
    id integer NOT NULL,਍ഀ
    sede_id integer NOT NULL,਍ഀ
    nombre character varying(50) NOT NULL,਍ഀ
    tipo_superficie character varying(30),਍ഀ
    techada boolean NOT NULL,਍ഀ
    activa boolean NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.canchas_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.canchas_id_seq OWNED BY public.canchas.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.categorias (਍ഀ
    id integer NOT NULL,਍ഀ
    nombre character varying(60) NOT NULL,਍ഀ
    descripcion character varying(200)਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.categorias_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.entrenadores (਍ഀ
    usuario_id integer NOT NULL,਍ഀ
    anios_experiencia smallint਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.equipo_jugadores (਍ഀ
    id integer NOT NULL,਍ഀ
    equipo_id integer NOT NULL,਍ഀ
    jugador_id integer NOT NULL,਍ഀ
    numero_dorsal smallint NOT NULL,਍ഀ
    fecha_ingreso date DEFAULT CURRENT_DATE NOT NULL,਍ഀ
    fecha_baja date,਍ഀ
    estado character varying(20) NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.equipo_jugadores_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.equipo_jugadores_id_seq OWNED BY public.equipo_jugadores.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.equipos (਍ഀ
    id integer NOT NULL,਍ഀ
    entrenador_id integer NOT NULL,਍ഀ
    categoria_id integer,਍ഀ
    nombre character varying(100) NOT NULL,਍ഀ
    escudo_url character varying(255),਍ഀ
    limite_jugadores smallint NOT NULL,਍ഀ
    creado_en timestamp with time zone DEFAULT now() NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.equipos_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.equipos_id_seq OWNED BY public.equipos.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.eventos_partido (਍ഀ
    id integer NOT NULL,਍ഀ
    partido_id integer NOT NULL,਍ഀ
    equipo_id integer NOT NULL,਍ഀ
    jugador_id integer,਍ഀ
    jugador_entra_id integer,਍ഀ
    tipo_evento character varying(30) NOT NULL,਍ഀ
    minuto smallint NOT NULL,਍ഀ
    detalle character varying(255),਍ഀ
    creado_en timestamp with time zone DEFAULT now() NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.eventos_partido_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.eventos_partido_id_seq OWNED BY public.eventos_partido.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.horarios_cancha (਍ഀ
    id integer NOT NULL,਍ഀ
    cancha_id integer NOT NULL,਍ഀ
    dia_semana smallint NOT NULL,਍ഀ
    hora_inicio time without time zone NOT NULL,਍ഀ
    hora_fin time without time zone NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.horarios_cancha_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.horarios_cancha_id_seq OWNED BY public.horarios_cancha.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.jugadores (਍ഀ
    usuario_id integer NOT NULL,਍ഀ
    categoria_id integer,਍ഀ
    dorsal_preferido smallint,਍ഀ
    posicion character varying(30),਍ഀ
    especialidad character varying(60)਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.pagos_arbitraje (਍ഀ
    id integer NOT NULL,਍ഀ
    partido_id integer NOT NULL,਍ഀ
    arbitro_id integer NOT NULL,਍ഀ
    monto numeric(10,2) NOT NULL,਍ഀ
    metodo character varying(50),਍ഀ
    estado character varying(20) NOT NULL,਍ഀ
    pagado_en timestamp with time zone਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.pagos_arbitraje_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.pagos_arbitraje_id_seq OWNED BY public.pagos_arbitraje.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.pagos_inscripcion (਍ഀ
    id integer NOT NULL,਍ഀ
    torneo_id integer NOT NULL,਍ഀ
    equipo_id integer NOT NULL,਍ഀ
    monto numeric(10,2) NOT NULL,਍ഀ
    metodo character varying(50),਍ഀ
    estado character varying(20) NOT NULL,਍ഀ
    pagado_en timestamp with time zone਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.pagos_inscripcion_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.pagos_inscripcion_id_seq OWNED BY public.pagos_inscripcion.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.partidos (਍ഀ
    id integer NOT NULL,਍ഀ
    torneo_id integer NOT NULL,਍ഀ
    equipo_local_id integer,਍ഀ
    equipo_visita_id integer,਍ഀ
    arbitro_id integer,਍ഀ
    cancha_id integer,਍ഀ
    fecha_hora timestamp with time zone,਍ഀ
    estado character varying(20) NOT NULL,਍ഀ
    estado_arbitro character varying(20) NOT NULL,਍ഀ
    goles_local smallint NOT NULL,਍ഀ
    goles_visita smallint NOT NULL,਍ഀ
    minutos_extra smallint NOT NULL,਍ഀ
    motivo_cancelacion character varying(255),਍ഀ
    creado_en timestamp with time zone DEFAULT now() NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.partidos_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.partidos_id_seq OWNED BY public.partidos.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.postulaciones_arbitro (਍ഀ
    id integer NOT NULL,਍ഀ
    arbitro_id integer NOT NULL,਍ഀ
    torneo_id integer,਍ഀ
    equipo_id integer,਍ഀ
    estado character varying(20) NOT NULL,਍ഀ
    fecha_postulacion timestamp with time zone DEFAULT now() NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.postulaciones_arbitro_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.postulaciones_arbitro_id_seq OWNED BY public.postulaciones_arbitro.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.roles (਍ഀ
    id smallint NOT NULL,਍ഀ
    nombre character varying(50) NOT NULL,਍ഀ
    descripcion character varying(150)਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.roles_id_seq਍ഀ
    AS smallint਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.sanciones (਍ഀ
    id integer NOT NULL,਍ഀ
    jugador_id integer,਍ഀ
    equipo_id integer,਍ഀ
    partido_id integer,਍ഀ
    tipo character varying(30) NOT NULL,਍ഀ
    motivo character varying(255),਍ഀ
    partidos_suspension smallint NOT NULL,਍ഀ
    fecha_inicio date DEFAULT CURRENT_DATE NOT NULL,਍ഀ
    fecha_fin date,਍ഀ
    estado character varying(20) NOT NULL,਍ഀ
    creado_en timestamp with time zone DEFAULT now() NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.sanciones_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.sanciones_id_seq OWNED BY public.sanciones.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.sedes (਍ഀ
    id integer NOT NULL,਍ഀ
    admin_id integer NOT NULL,਍ഀ
    nombre character varying(100) NOT NULL,਍ഀ
    direccion character varying(255) NOT NULL,਍ഀ
    activa boolean NOT NULL,਍ഀ
    creado_en timestamp with time zone DEFAULT now() NOT NULL,਍ഀ
    telefono character varying(20),਍ഀ
    ciudad character varying(100),਍ഀ
    cantidad_canchas integer DEFAULT 1,਍ഀ
    horario_apertura time without time zone,਍ഀ
    horario_cierre time without time zone,਍ഀ
    foto_url character varying(255),਍ഀ
    amenidades character varying(500)਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.sedes_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.sedes_id_seq OWNED BY public.sedes.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.solicitudes_equipo (਍ഀ
    id integer NOT NULL,਍ഀ
    jugador_id integer NOT NULL,਍ഀ
    equipo_id integer NOT NULL,਍ഀ
    estado character varying(20) NOT NULL,਍ഀ
    fecha_solicitud timestamp with time zone DEFAULT now() NOT NULL,਍ഀ
    fecha_respuesta timestamp with time zone਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.solicitudes_equipo_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.solicitudes_equipo_id_seq OWNED BY public.solicitudes_equipo.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.tabla_posiciones (਍ഀ
    id integer NOT NULL,਍ഀ
    torneo_id integer NOT NULL,਍ഀ
    equipo_id integer NOT NULL,਍ഀ
    partidos_jugados smallint NOT NULL,਍ഀ
    ganados smallint NOT NULL,਍ഀ
    empatados smallint NOT NULL,਍ഀ
    perdidos smallint NOT NULL,਍ഀ
    goles_favor smallint NOT NULL,਍ഀ
    goles_contra smallint NOT NULL,਍ഀ
    puntos smallint NOT NULL,਍ഀ
    actualizado_en timestamp with time zone DEFAULT now() NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.tabla_posiciones_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.tabla_posiciones_id_seq OWNED BY public.tabla_posiciones.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.torneo_equipos (਍ഀ
    id integer NOT NULL,਍ഀ
    torneo_id integer NOT NULL,਍ഀ
    equipo_id integer NOT NULL,਍ഀ
    fecha_inscripcion timestamp with time zone DEFAULT now() NOT NULL,਍ഀ
    estado character varying(20) NOT NULL,਍ഀ
    grupo character varying(10)਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.torneo_equipos_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.torneo_equipos_id_seq OWNED BY public.torneo_equipos.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.torneos (਍ഀ
    id integer NOT NULL,਍ഀ
    sede_id integer NOT NULL,਍ഀ
    admin_id integer NOT NULL,਍ഀ
    categoria_id integer,਍ഀ
    nombre character varying(100) NOT NULL,਍ഀ
    cupo_equipos smallint NOT NULL,਍ഀ
    estado character varying(20) NOT NULL,਍ഀ
    fecha_inicio date NOT NULL,਍ഀ
    fecha_fin date NOT NULL,਍ഀ
    creado_en timestamp with time zone DEFAULT now() NOT NULL,਍ഀ
    formato character varying(50),਍ഀ
    costo_inscripcion numeric(10,2) DEFAULT 0,਍ഀ
    reglamento_url character varying(255)਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.torneos_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.torneos_id_seq OWNED BY public.torneos.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE TABLE public.usuarios (਍ഀ
    id integer NOT NULL,਍ഀ
    rol_id smallint NOT NULL,਍ഀ
    nombre character varying(100) NOT NULL,਍ഀ
    correo character varying(150) NOT NULL,਍ഀ
    contrasena_hash character varying(255) NOT NULL,਍ഀ
    telefono character varying(20),਍ഀ
    foto_url character varying(255),਍ഀ
    activo boolean NOT NULL,਍ഀ
    creado_en timestamp with time zone DEFAULT now() NOT NULL,਍ഀ
    actualizado_en timestamp with time zone DEFAULT now() NOT NULL਍ഀ
);਍ഀ
਍ഀ
਍ഀ
਍ഀ
CREATE SEQUENCE public.usuarios_id_seq਍ഀ
    AS integer਍ഀ
    START WITH 1਍ഀ
    INCREMENT BY 1਍ഀ
    NO MINVALUE਍ഀ
    NO MAXVALUE਍ഀ
    CACHE 1;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.alineacion_jugadores ALTER COLUMN id SET DEFAULT nextval('public.alineacion_jugadores_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.alineaciones ALTER COLUMN id SET DEFAULT nextval('public.alineaciones_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.canchas ALTER COLUMN id SET DEFAULT nextval('public.canchas_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.equipo_jugadores ALTER COLUMN id SET DEFAULT nextval('public.equipo_jugadores_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.equipos ALTER COLUMN id SET DEFAULT nextval('public.equipos_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.eventos_partido ALTER COLUMN id SET DEFAULT nextval('public.eventos_partido_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.horarios_cancha ALTER COLUMN id SET DEFAULT nextval('public.horarios_cancha_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.pagos_arbitraje ALTER COLUMN id SET DEFAULT nextval('public.pagos_arbitraje_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.pagos_inscripcion ALTER COLUMN id SET DEFAULT nextval('public.pagos_inscripcion_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.partidos ALTER COLUMN id SET DEFAULT nextval('public.partidos_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.postulaciones_arbitro ALTER COLUMN id SET DEFAULT nextval('public.postulaciones_arbitro_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.sanciones ALTER COLUMN id SET DEFAULT nextval('public.sanciones_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.sedes ALTER COLUMN id SET DEFAULT nextval('public.sedes_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.solicitudes_equipo ALTER COLUMN id SET DEFAULT nextval('public.solicitudes_equipo_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.tabla_posiciones ALTER COLUMN id SET DEFAULT nextval('public.tabla_posiciones_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.torneo_equipos ALTER COLUMN id SET DEFAULT nextval('public.torneo_equipos_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.torneos ALTER COLUMN id SET DEFAULT nextval('public.torneos_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);਍ഀ
਍ഀ
਍ഀ
਍ഀ
COPY public.alineacion_jugadores (id, alineacion_id, jugador_id, posicion, es_titular, numero_dorsal) FROM stdin;਍ഀ
\.਍ഀ
਍ഀ
਍ഀ
਍ഀ
COPY public.alineaciones (id, partido_id, equipo_id, entrenador_id, formacion, creado_en) FROM stdin;਍ഀ
\.਍ഀ
਍ഀ
਍ഀ
਍ഀ
COPY public.arbitros (usuario_id, categoria_id, anios_experiencia, calificacion_promedio, certificado_url) FROM stdin;਍ഀ
2	\N	\N	\N	\N਍ഀ
3	\N	\N	\N	\N਍ഀ
4	\N	\N	\N	\N਍ഀ
5	\N	\N	\N	\N਍ഀ
6	\N	\N	\N	\N਍ഀ
7	\N	\N	\N	\N਍ഀ
\.਍ഀ
਍ഀ
਍ഀ
਍ഀ
COPY public.canchas (id, sede_id, nombre, tipo_superficie, techada, activa) FROM stdin;਍ഀ
\.਍ഀ
਍ഀ
਍ഀ
਍ഀ
COPY public.categorias (id, nombre, descripcion) FROM stdin;਍ഀ
1	Masculina	Categor├愀 瀀愀爀愀 栀漀洀戀爀攀猀ഀ
਍㈀ऀ䘀攀洀攀渀椀渀愀ऀ䌀愀琀攀最漀爀ᰀ%a para mujeres਍ഀ
\.਍ഀ
਍ഀ
਍ഀ
਍ഀ
COPY public.entrenadores (usuario_id, anios_experiencia) FROM stdin;਍ഀ
28	\N਍ഀ
29	\N਍ഀ
30	\N਍ഀ
31	\N਍ഀ
32	\N਍ഀ
33	5਍ഀ
34	5਍ഀ
35	5਍ഀ
\.਍ഀ
਍ഀ
਍ഀ
਍ഀ
COPY public.equipo_jugadores (id, equipo_id, jugador_id, numero_dorsal, fecha_ingreso, fecha_baja, estado) FROM stdin;਍ഀ
1	15	8	1	2026-07-31	\N	activo਍ഀ
2	15	9	2	2026-07-31	\N	activo਍ഀ
3	15	10	3	2026-07-31	\N	activo਍ഀ
4	15	11	4	2026-07-31	\N	activo਍ഀ
5	15	12	5	2026-07-31	\N	activo਍ഀ
6	15	13	6	2026-07-31	\N	activo਍ഀ
7	15	14	7	2026-07-31	\N	activo਍ഀ
8	15	15	8	2026-07-31	\N	activo਍ഀ
9	15	16	9	2026-07-31	\N	activo਍ഀ
10	15	17	10	2026-07-31	\N	activo਍ഀ
11	15	18	11	2026-07-31	\N	activo਍ഀ
12	16	19	1	2026-07-31	\N	activo਍ഀ
13	16	20	2	2026-07-31	\N	activo਍ഀ
14	16	21	3	2026-07-31	\N	activo਍ഀ
15	16	22	4	2026-07-31	\N	activo਍ഀ
16	16	23	5	2026-07-31	\N	activo਍ഀ
17	16	24	6	2026-07-31	\N	activo਍ഀ
18	16	25	7	2026-07-31	\N	activo਍ഀ
19	16	26	8	2026-07-31	\N	activo਍ഀ
20	16	27	9	2026-07-31	\N	activo਍ഀ
21	16	36	10	2026-07-31	\N	activo਍ഀ
22	16	37	11	2026-07-31	\N	activo਍ഀ
23	17	38	1	2026-07-31	\N	activo਍ഀ
24	17	39	2	2026-07-31	\N	activo਍ഀ
25	17	40	3	2026-07-31	\N	activo਍ഀ
26	17	41	4	2026-07-31	\N	activo਍ഀ
27	17	42	5	2026-07-31	\N	activo਍ഀ
28	17	43	6	2026-07-31	\N	activo਍ഀ
29	17	44	7	2026-07-31	\N	activo਍ഀ
30	17	45	8	2026-07-31	\N	activo਍ഀ
31	17	46	9	2026-07-31	\N	activo਍ഀ
32	17	47	10	2026-07-31	\N	activo਍ഀ
33	17	48	11	2026-07-31	\N	activo਍ഀ
34	18	49	1	2026-07-31	\N	activo਍ഀ
35	18	50	2	2026-07-31	\N	activo਍ഀ
36	18	51	3	2026-07-31	\N	activo਍ഀ
37	18	52	4	2026-07-31	\N	activo਍ഀ
38	18	53	5	2026-07-31	\N	activo਍ഀ
39	18	54	6	2026-07-31	\N	activo਍ഀ
40	18	55	7	2026-07-31	\N	activo਍ഀ
41	18	56	8	2026-07-31	\N	activo਍ഀ
42	18	57	9	2026-07-31	\N	activo਍ഀ
43	18	58	10	2026-07-31	\N	activo਍ഀ
44	18	59	11	2026-07-31	\N	activo਍ഀ
45	19	60	1	2026-07-31	\N	activo਍ഀ
46	19	61	2	2026-07-31	\N	activo਍ഀ
47	19	62	3	2026-07-31	\N	activo਍ഀ
48	19	63	4	2026-07-31	\N	activo਍ഀ
49	19	64	5	2026-07-31	\N	activo਍ഀ
50	19	65	6	2026-07-31	\N	activo਍ഀ
51	19	66	7	2026-07-31	\N	activo਍ഀ
52	19	67	8	2026-07-31	\N	activo਍ഀ
53	19	68	9	2026-07-31	\N	activo਍ഀ
54	19	69	10	2026-07-31	\N	activo਍ഀ
55	19	70	11	2026-07-31	\N	activo਍ഀ
56	20	71	1	2026-07-31	\N	activo਍ഀ
57	20	72	2	2026-07-31	\N	activo਍ഀ
58	20	73	3	2026-07-31	\N	activo਍ഀ
59	20	74	4	2026-07-31	\N	activo਍ഀ
60	20	75	5	2026-07-31	\N	activo਍ഀ
61	20	76	6	2026-07-31	\N	activo਍ഀ
62	20	77	7	2026-07-31	\N	activo਍ഀ
63	20	78	8	2026-07-31	\N	activo਍ഀ
64	20	79	9	2026-07-31	\N	activo਍ഀ
65	20	80	10	2026-07-31	\N	activo਍ഀ
66	20	81	11	2026-07-31	\N	activo਍ഀ
67	21	82	1	2026-07-31	\N	activo਍ഀ
68	21	83	2	2026-07-31	\N	activo਍ഀ
69	21	84	3	2026-07-31	\N	activo਍ഀ
70	21	85	4	2026-07-31	\N	activo਍ഀ
71	21	86	5	2026-07-31	\N	activo਍ഀ
72	21	87	6	2026-07-31	\N	activo਍ഀ
73	21	88	7	2026-07-31	\N	activo਍ഀ
74	21	89	8	2026-07-31	\N	activo਍ഀ
75	21	90	9	2026-07-31	\N	activo਍ഀ
76	21	91	10	2026-07-31	\N	activo਍ഀ
77	21	92	11	2026-07-31	\N	activo਍ഀ
78	22	93	1	2026-07-31	\N	activo਍ഀ
79	22	94	2	2026-07-31	\N	activo਍ഀ
80	22	95	3	2026-07-31	\N	activo਍ഀ
81	22	96	4	2026-07-31	\N	activo਍ഀ
82	22	97	5	2026-07-31	\N	activo਍ഀ
83	22	98	6	2026-07-31	\N	activo਍ഀ
84	22	99	7	2026-07-31	\N	activo਍ഀ
85	22	100	8	2026-07-31	\N	activo਍ഀ
86	22	101	9	2026-07-31	\N	activo਍ഀ
87	22	102	10	2026-07-31	\N	activo਍ഀ
88	22	103	11	2026-07-31	\N	activo਍ഀ
\.਍ഀ
਍ഀ
਍ഀ
਍ഀ
COPY public.equipos (id, entrenador_id, categoria_id, nombre, escudo_url, limite_jugadores, creado_en) FROM stdin;਍ഀ
15	28	1	UPQ	/uploads/equipos/UPQ.png	20	2026-07-31 07:27:58.059913+00਍ഀ
16	29	\N	UAQ	/uploads/equipos/UAQ.png	20	2026-07-31 15:54:03.937411+00਍ഀ
17	30	\N	ITQ	/uploads/equipos/ITQ.png	20	2026-07-31 15:54:03.937411+00਍ഀ
18	31	\N	UTEQ	/uploads/equipos/UTEQ.png	20	2026-07-31 15:54:03.937411+00਍ഀ
19	32	\N	UNAQ	/uploads/equipos/UNAQ.png	20	2026-07-31 15:54:03.937411+00਍ഀ
20	33	\N	An├栀甀愀挀ऀ⼀甀瀀氀漀愀搀猀⼀攀焀甀椀瀀漀猀⼀䄀一䄀䠀唀䄀䌀⸀瀀渀最ऀ㈀　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㐀㨀　㌀⸀㤀㌀㜀㐀㄀㄀⬀　　ഀ
਍㈀㄀ऀ㌀㐀ऀ尀一ऀ唀嘀䴀ऀ⼀甀瀀氀漀愀搀猀⼀攀焀甀椀瀀漀猀⼀唀嘀䴀⸀瀀渀最ऀ㈀　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㐀㨀　㌀⸀㤀㌀㜀㐀㄀㄀⬀　　ഀ
਍㈀㈀ऀ㌀㔀ऀ尀一ऀ吀攀挀洀椀氀攀渀椀漀ऀ⼀甀瀀氀漀愀搀猀⼀攀焀甀椀瀀漀猀⼀吀䔀䌀䴀䤀䰀䔀一䤀伀⸀瀀渀最ऀ㈀　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㐀㨀　㌀⸀㤀㌀㜀㐀㄀㄀⬀　　ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀 ⠀椀搀Ⰰ 瀀愀爀琀椀搀漀开椀搀Ⰰ 攀焀甀椀瀀漀开椀搀Ⰰ 樀甀最愀搀漀爀开椀搀Ⰰ 樀甀最愀搀漀爀开攀渀琀爀愀开椀搀Ⰰ 琀椀瀀漀开攀瘀攀渀琀漀Ⰰ 洀椀渀甀琀漀Ⰰ 搀攀琀愀氀氀攀Ⰰ 挀爀攀愀搀漀开攀渀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍㈀㐀ऀ㠀㤀ऀ㄀㠀ऀ㔀㐀ऀ尀一ऀ䜀漀氀ऀ㈀ऀ尀一ऀ㈀　㈀㘀ⴀ　㠀ⴀ　㈀ 　㈀㨀㈀㐀㨀㐀㐀⸀㌀㠀㔀㐀㠀㘀⬀　　ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀栀漀爀愀爀椀漀猀开挀愀渀挀栀愀 ⠀椀搀Ⰰ 挀愀渀挀栀愀开椀搀Ⰰ 搀椀愀开猀攀洀愀渀愀Ⰰ 栀漀爀愀开椀渀椀挀椀漀Ⰰ 栀漀爀愀开昀椀渀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀樀甀最愀搀漀爀攀猀 ⠀甀猀甀愀爀椀漀开椀搀Ⰰ 挀愀琀攀最漀爀椀愀开椀搀Ⰰ 搀漀爀猀愀氀开瀀爀攀昀攀爀椀搀漀Ⰰ 瀀漀猀椀挀椀漀渀Ⰰ 攀猀瀀攀挀椀愀氀椀搀愀搀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍㌀㘀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㐀㄀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㐀㘀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㐀㤀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㔀　ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㔀㌀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㔀㜀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㔀㠀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㘀㐀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㘀㜀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㜀㈀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㜀㐀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㜀㘀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㜀㤀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㠀㔀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㠀㘀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㠀㤀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㤀㈀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㤀㌀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㤀㤀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㄀　㄀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㄀　㈀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ倀愀猀攀ഀ
਍㠀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ尀一ഀ
਍㤀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ尀一ഀ
਍㄀　ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ尀一ഀ
਍㄀㄀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ尀一ഀ
਍㄀㈀ऀ尀一ऀ尀一ऀ倀漀爀琀攀爀漀ऀ尀一ഀ
਍㄀㌀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ尀一ഀ
਍㄀㐀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ尀一ഀ
਍㄀㔀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ尀一ഀ
਍㄀㘀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ尀一ഀ
਍㄀㜀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ尀一ഀ
਍㄀㠀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ尀一ഀ
਍㄀㤀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ尀一ഀ
਍㈀　ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ尀一ഀ
਍㈀㄀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ尀一ഀ
਍㈀㈀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ尀一ഀ
਍㈀㌀ऀ尀一ऀ尀一ऀ䴀攀搀椀漀ऀ尀一ഀ
਍㈀㐀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ尀一ഀ
਍㈀㔀ऀ尀一ऀ尀一ऀ倀漀爀琀攀爀漀ऀ尀一ഀ
਍㈀㘀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ尀一ഀ
਍㈀㜀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ尀一ഀ
਍㌀㜀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㌀㠀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㌀㤀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㐀　ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㐀㈀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㐀㌀ऀ尀一ऀ尀一ऀ倀漀爀琀攀爀漀ऀ倀愀猀攀ഀ
਍㐀㐀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㐀㔀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㐀㜀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㐀㠀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㔀㄀ऀ尀一ऀ尀一ऀ倀漀爀琀攀爀漀ऀ倀愀猀攀ഀ
਍㔀㈀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㔀㐀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㔀㔀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㔀㘀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㔀㤀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㘀　ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㘀㄀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㘀㈀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㘀㌀ऀ尀一ऀ尀一ऀ倀漀爀琀攀爀漀ऀ倀愀猀攀ഀ
਍㘀㔀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㘀㘀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㘀㠀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㘀㤀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㜀　ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㜀㄀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㜀㌀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㜀㔀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㜀㜀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㜀㠀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㠀　ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㠀㄀ऀ尀一ऀ尀一ऀ倀漀爀琀攀爀漀ऀ倀愀猀攀ഀ
਍㠀㈀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㠀㌀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㠀㐀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㠀㜀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㠀㠀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㤀　ऀ尀一ऀ尀一ऀ倀漀爀琀攀爀漀ऀ倀愀猀攀ഀ
਍㤀㄀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㤀㐀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㤀㔀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㤀㘀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㤀㜀ऀ尀一ऀ尀一ऀ䐀攀昀攀渀猀愀ऀ倀愀猀攀ഀ
਍㤀㠀ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㄀　　ऀ尀一ऀ尀一ऀ䐀攀氀愀渀琀攀爀漀ऀ倀愀猀攀ഀ
਍㄀　㌀ऀ尀一ऀ尀一ऀ倀漀爀琀攀爀漀ऀ倀愀猀攀ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀瀀愀最漀猀开愀爀戀椀琀爀愀樀攀 ⠀椀搀Ⰰ 瀀愀爀琀椀搀漀开椀搀Ⰰ 愀爀戀椀琀爀漀开椀搀Ⰰ 洀漀渀琀漀Ⰰ 洀攀琀漀搀漀Ⰰ 攀猀琀愀搀漀Ⰰ 瀀愀最愀搀漀开攀渀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍㄀ऀ㠀㠀ऀ㔀ऀ㈀㔀　⸀　　ऀ吀愀爀樀攀琀愀ऀ瀀愀最愀搀漀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㈀　㨀㄀㐀㨀㔀㌀⸀㈀㠀㤀㄀㈀㈀⬀　　ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀瀀愀最漀猀开椀渀猀挀爀椀瀀挀椀漀渀 ⠀椀搀Ⰰ 琀漀爀渀攀漀开椀搀Ⰰ 攀焀甀椀瀀漀开椀搀Ⰰ 洀漀渀琀漀Ⰰ 洀攀琀漀搀漀Ⰰ 攀猀琀愀搀漀Ⰰ 瀀愀最愀搀漀开攀渀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀 ⠀椀搀Ⰰ 琀漀爀渀攀漀开椀搀Ⰰ 攀焀甀椀瀀漀开氀漀挀愀氀开椀搀Ⰰ 攀焀甀椀瀀漀开瘀椀猀椀琀愀开椀搀Ⰰ 愀爀戀椀琀爀漀开椀搀Ⰰ 挀愀渀挀栀愀开椀搀Ⰰ 昀攀挀栀愀开栀漀爀愀Ⰰ 攀猀琀愀搀漀Ⰰ 攀猀琀愀搀漀开愀爀戀椀琀爀漀Ⰰ 最漀氀攀猀开氀漀挀愀氀Ⰰ 最漀氀攀猀开瘀椀猀椀琀愀Ⰰ 洀椀渀甀琀漀猀开攀砀琀爀愀Ⰰ 洀漀琀椀瘀漀开挀愀渀挀攀氀愀挀椀漀渀Ⰰ 挀爀攀愀搀漀开攀渀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍㤀㈀ऀ㜀ऀ尀一ऀ尀一ऀ㈀ऀ尀一ऀ㈀　㈀㘀ⴀ　㠀ⴀ㄀㌀ ㄀㐀㨀㄀㔀㨀　　⬀　　ऀ昀椀渀愀氀椀稀愀搀漀ऀ瀀攀渀搀椀攀渀琀攀ऀ　ऀ　ऀ　ऀ尀一ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㤀㨀㌀㘀㨀㈀㈀⸀㘀㤀㄀㔀㔀㈀⬀　　ഀ
਍㤀㌀ऀ㜀ऀ尀一ऀ尀一ऀ㈀ऀ尀一ऀ㈀　㈀㘀ⴀ　㠀ⴀ　㤀 ㄀㤀㨀㌀　㨀　　⬀　　ऀ昀椀渀愀氀椀稀愀搀漀ऀ瀀攀渀搀椀攀渀琀攀ऀ　ऀ　ऀ　ऀ尀一ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㤀㨀㌀㘀㨀㈀㈀⸀㘀㤀㄀㔀㔀㈀⬀　　ഀ
਍㠀㤀ऀ㜀ऀ㄀㜀ऀ㄀㠀ऀ㐀ऀ尀一ऀ㈀　㈀㘀ⴀ　㠀ⴀ㈀㄀ ㄀㠀㨀㄀㔀㨀　　⬀　　ऀ昀椀渀愀氀椀稀愀搀漀ऀ瀀攀渀搀椀攀渀琀攀ऀ　ऀ㄀ऀ　ऀ尀一ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㤀㨀㌀㘀㨀㈀㈀⸀㘀㤀㄀㔀㔀㈀⬀　　ഀ
਍㠀㠀ऀ㜀ऀ㄀㔀ऀ㄀㘀ऀ㐀ऀ尀一ऀ㈀　㈀㘀ⴀ　㠀ⴀ㈀㌀ ㄀㘀㨀㐀㔀㨀　　⬀　　ऀ瀀爀漀最爀愀洀愀搀漀ऀ瀀攀渀搀椀攀渀琀攀ऀ　ऀ　ऀ　ऀ尀一ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㤀㨀㌀㘀㨀㈀㈀⸀㘀㤀㄀㔀㔀㈀⬀　　ഀ
਍㤀　ऀ㜀ऀ㄀㤀ऀ㈀　ऀ㘀ऀ尀一ऀ㈀　㈀㘀ⴀ　㠀ⴀ㄀㔀 ㄀㄀㨀　　㨀　　⬀　　ऀ瀀爀漀最爀愀洀愀搀漀ऀ瀀攀渀搀椀攀渀琀攀ऀ　ऀ　ऀ　ऀ尀一ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㤀㨀㌀㘀㨀㈀㈀⸀㘀㤀㄀㔀㔀㈀⬀　　ഀ
਍㤀㄀ऀ㜀ऀ㈀㄀ऀ㈀㈀ऀ㔀ऀ尀一ऀ㈀　㈀㘀ⴀ　㠀ⴀ㄀㤀 ㄀㈀㨀㐀㔀㨀　　⬀　　ऀ瀀爀漀最爀愀洀愀搀漀ऀ瀀攀渀搀椀攀渀琀攀ऀ　ऀ　ऀ　ऀ尀一ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㤀㨀㌀㘀㨀㈀㈀⸀㘀㤀㄀㔀㔀㈀⬀　　ഀ
਍㤀㐀ऀ㜀ऀ尀一ऀ尀一ऀ㈀ऀ尀一ऀ㈀　㈀㘀ⴀ　㠀ⴀ㄀㠀 ㄀㄀㨀㐀㔀㨀　　⬀　　ऀ瀀爀漀最爀愀洀愀搀漀ऀ瀀攀渀搀椀攀渀琀攀ऀ　ऀ　ऀ　ऀ尀一ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㤀㨀㌀㘀㨀㈀㈀⸀㘀㤀㄀㔀㔀㈀⬀　　ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀 ⠀椀搀Ⰰ 愀爀戀椀琀爀漀开椀搀Ⰰ 琀漀爀渀攀漀开椀搀Ⰰ 攀焀甀椀瀀漀开椀搀Ⰰ 攀猀琀愀搀漀Ⰰ 昀攀挀栀愀开瀀漀猀琀甀氀愀挀椀漀渀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍㄀ऀ㈀ऀ㜀ऀ尀一ऀ愀挀攀瀀琀愀搀漀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㜀㨀㔀㐀㨀㔀　⸀㄀　㜀㄀㘀㔀⬀　　ഀ
਍㈀ऀ㌀ऀ㜀ऀ尀一ऀ愀挀攀瀀琀愀搀漀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㜀㨀㔀㐀㨀㔀　⸀㄀　㜀㄀㘀㔀⬀　　ഀ
਍㌀ऀ㐀ऀ㜀ऀ尀一ऀ愀挀攀瀀琀愀搀漀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㜀㨀㔀㐀㨀㔀　⸀㄀　㜀㄀㘀㔀⬀　　ഀ
਍㐀ऀ㔀ऀ㜀ऀ尀一ऀ愀挀攀瀀琀愀搀漀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㜀㨀㔀㐀㨀㔀　⸀㄀　㜀㄀㘀㔀⬀　　ഀ
਍㔀ऀ㘀ऀ㜀ऀ尀一ऀ愀挀攀瀀琀愀搀漀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㜀㨀㔀㐀㨀㔀　⸀㄀　㜀㄀㘀㔀⬀　　ഀ
਍㘀ऀ㜀ऀ㜀ऀ尀一ऀ愀挀攀瀀琀愀搀漀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㜀㨀㔀㐀㨀㔀　⸀㄀　㜀㄀㘀㔀⬀　　ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀爀漀氀攀猀 ⠀椀搀Ⰰ 渀漀洀戀爀攀Ⰰ 搀攀猀挀爀椀瀀挀椀漀渀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍㄀ऀ愀搀洀椀渀ऀ䄀搀洀椀渀椀猀琀爀愀搀漀爀ഀ
਍㈀ऀ愀爀戀椀琀爀漀ऀᰀ%rbitro਍ഀ
3	jugador	Jugador਍ഀ
4	entrenador	Entrenador਍ഀ
\.਍ഀ
਍ഀ
਍ഀ
਍ഀ
COPY public.sanciones (id, jugador_id, equipo_id, partido_id, tipo, motivo, partidos_suspension, fecha_inicio, fecha_fin, estado, creado_en) FROM stdin;਍ഀ
\.਍ഀ
਍ഀ
਍ഀ
਍ഀ
COPY public.sedes (id, admin_id, nombre, direccion, activa, creado_en, telefono, ciudad, cantidad_canchas, horario_apertura, horario_cierre, foto_url, amenidades) FROM stdin;਍ഀ
3	1	Prueba foto	Instituto Nacional Indigenista 127	t	2026-08-02 20:16:22.955067+00	4427102581	SANTIAGO DE QUERETARO	1	14:16:00	14:16:00	\N	Ejemplo਍ഀ
4	1	Miguel Mart├渀攀稀ऀ䤀渀猀琀椀琀甀琀漀 一愀挀椀漀渀愀氀 䤀渀搀椀最攀渀椀猀琀愀 ㄀㈀㜀ऀ琀ऀ㈀　㈀㘀ⴀ　㠀ⴀ　㈀ ㈀　㨀㌀㄀㨀　㈀⸀㐀　㜀㤀㄀⬀　　ऀ㐀㐀㈀　　　　　　　ऀ匀䄀一吀䤀䄀䜀伀 䐀䔀 儀唀䔀刀䔀吀䄀刀伀ऀ㄀ऀ㄀㐀㨀㌀　㨀　　ऀ㄀㐀㨀㌀　㨀　　ऀ尀一ऀ栀漀氀愀ഀ
਍㔀ऀ㄀ऀ䨀甀愀渀 倀攀爀攀稀ऀ䤀渀猀琀椀琀甀琀漀 一愀挀椀漀渀愀氀 䤀渀搀椀最攀渀椀猀琀愀 ㄀㈀㜀ऀ琀ऀ㈀　㈀㘀ⴀ　㠀ⴀ　㈀ ㈀　㨀㌀㌀㨀㔀㜀⸀㜀㄀㜀㘀㐀㔀⬀　　ऀ　　　　　　　　ऀ匀䄀一吀䤀䄀䜀伀 䐀䔀 儀唀䔀刀䔀吀䄀刀伀ऀ㄀ऀ㄀㐀㨀㌀㌀㨀　　ऀ㄀㐀㨀㌀㌀㨀　　ऀ尀一ऀ瀀爀甀攀戀愀 甀氀琀椀洀愀ഀ
਍㘀ऀ㄀ऀ䌀唀刀䰀开吀䔀匀吀ऀ䤀渀猀琀椀琀甀琀漀 一愀挀椀漀渀愀氀 䤀渀搀椀最攀渀椀猀琀愀 ㄀㈀㜀ऀ琀ऀ㈀　㈀㘀ⴀ　㠀ⴀ　㈀ ㈀　㨀㔀㐀㨀㌀㐀⸀㄀㐀㘀㔀㐀㠀⬀　　ऀ㐀㐀㈀㄀㤀㐀㌀㤀㘀㐀ऀ匀䄀一吀䤀䄀䜀伀 䐀䔀 儀唀䔀刀䔀吀䄀刀伀ऀ㄀ऀ㄀㐀㨀㔀㤀㨀　　ऀ㄀㐀㨀㔀㤀㨀　　ऀ⼀甀瀀氀漀愀搀猀⼀㜀　㄀㤀㤀㠀㜀戀ⴀ㜀搀㘀㈀ⴀ㐀㄀昀㐀ⴀ愀㈀㐀㜀ⴀ㈀攀　㐀㘀㤀㤀　昀㠀　㈀⸀樀瀀最ऀ琀攀猀琀ഀ
਍㠀ऀ㄀ऀ䴀椀最甀攀氀 䴀愀爀琀ᰀ%nez	Instituto Nacional Indigenista 127	t	2026-08-02 21:16:05.88816+00	4421943964	SANTIAGO DE QUERETARO	1	23:59:00	01:59:00	/uploads/bec83fa8-6855-4fc9-b9ea-edfc91d05fb0.jpg	Holaaaaaaaaaaa਍ഀ
7	1	Flask Proxy Test	Desde Admin Web	t	2026-08-02 21:04:11.516772+00	5559876543	Queretaro	1	09:00:00	18:00:00	/uploads/bf347c54-279c-43bc-a3b7-78dc12799567.jpg	Test਍ഀ
1	1	DOOM	Instituto Nacional Indigenista 127	t	2026-07-30 20:59:04.495973+00	4421943964	SANTIAGO DE QUERETARO	1	08:00:00	22:00:00	\N	Ba├漥猀ഀ
਍㈀ऀ㄀ऀ匀攀搀攀 吀攀猀琀 䘀甀氀氀ऀ䐀椀爀攀挀挀椀漀渀 ㄀㈀㌀ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀　 ㈀㄀㨀㄀㈀㨀㌀㌀⸀㜀㌀㤀㌀㠀㈀⬀　　ऀ㔀㔀㔀㄀㈀㌀㐀㔀㘀㜀ऀ䌀䐀䴀堀ऀ㐀ऀ㄀　㨀　　㨀　　ऀ㈀　㨀　　㨀　　ऀ尀一ऀ圀椀昀椀Ⰰ 攀猀琀愀挀椀漀渀愀洀椀攀渀琀漀ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀猀漀氀椀挀椀琀甀搀攀猀开攀焀甀椀瀀漀 ⠀椀搀Ⰰ 樀甀最愀搀漀爀开椀搀Ⰰ 攀焀甀椀瀀漀开椀搀Ⰰ 攀猀琀愀搀漀Ⰰ 昀攀挀栀愀开猀漀氀椀挀椀琀甀搀Ⰰ 昀攀挀栀愀开爀攀猀瀀甀攀猀琀愀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍㄀ऀ㠀ऀ㄀㔀ऀ愀挀攀瀀琀愀搀漀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㜀㨀㌀㐀㨀㄀㈀⸀　㜀㜀㐀㔀㈀⬀　　ऀ尀一ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀琀愀戀氀愀开瀀漀猀椀挀椀漀渀攀猀 ⠀椀搀Ⰰ 琀漀爀渀攀漀开椀搀Ⰰ 攀焀甀椀瀀漀开椀搀Ⰰ 瀀愀爀琀椀搀漀猀开樀甀最愀搀漀猀Ⰰ 最愀渀愀搀漀猀Ⰰ 攀洀瀀愀琀愀搀漀猀Ⰰ 瀀攀爀搀椀搀漀猀Ⰰ 最漀氀攀猀开昀愀瘀漀爀Ⰰ 最漀氀攀猀开挀漀渀琀爀愀Ⰰ 瀀甀渀琀漀猀Ⰰ 愀挀琀甀愀氀椀稀愀搀漀开攀渀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀开攀焀甀椀瀀漀猀 ⠀椀搀Ⰰ 琀漀爀渀攀漀开椀搀Ⰰ 攀焀甀椀瀀漀开椀搀Ⰰ 昀攀挀栀愀开椀渀猀挀爀椀瀀挀椀漀渀Ⰰ 攀猀琀愀搀漀Ⰰ 最爀甀瀀漀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍㄀ऀ㜀ऀ㄀㔀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㌀㤀㨀㔀㘀⸀㐀㈀㐀㈀㐀㈀⬀　　ऀ愀挀攀瀀琀愀搀漀ऀ尀一ഀ
਍㈀ऀ㜀ऀ㄀㘀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㔀㨀㔀　⸀㈀㘀㠀㘀㌀㈀⬀　　ऀ愀挀攀瀀琀愀搀漀ऀ尀一ഀ
਍㌀ऀ㜀ऀ㄀㜀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㘀㨀㌀㄀⸀㄀㈀㜀㔀　㌀⬀　　ऀ愀挀攀瀀琀愀搀漀ऀ尀一ഀ
਍㐀ऀ㜀ऀ㄀㠀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㜀㨀　㜀⸀㤀㤀㌀㔀㜀㌀⬀　　ऀ愀挀攀瀀琀愀搀漀ऀ尀一ഀ
਍㔀ऀ㜀ऀ㄀㤀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㜀㨀㌀　⸀㠀㌀㐀㜀㔀㜀⬀　　ऀ愀挀攀瀀琀愀搀漀ऀ尀一ഀ
਍㘀ऀ㜀ऀ㈀　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㘀㨀　㈀㨀㔀㈀⸀㤀㈀㘀㐀㈀㄀⬀　　ऀ愀挀攀瀀琀愀搀漀ऀ尀一ഀ
਍㜀ऀ㜀ऀ㈀㄀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㘀㨀　㌀㨀㄀㤀⸀㠀㜀㄀㌀㤀㄀⬀　　ऀ愀挀攀瀀琀愀搀漀ऀ尀一ഀ
਍㠀ऀ㜀ऀ㈀㈀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㘀㨀　㌀㨀㔀㠀⸀㌀㄀㤀㜀㤀㐀⬀　　ऀ愀挀攀瀀琀愀搀漀ऀ尀一ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀 ⠀椀搀Ⰰ 猀攀搀攀开椀搀Ⰰ 愀搀洀椀渀开椀搀Ⰰ 挀愀琀攀最漀爀椀愀开椀搀Ⰰ 渀漀洀戀爀攀Ⰰ 挀甀瀀漀开攀焀甀椀瀀漀猀Ⰰ 攀猀琀愀搀漀Ⰰ 昀攀挀栀愀开椀渀椀挀椀漀Ⰰ 昀攀挀栀愀开昀椀渀Ⰰ 挀爀攀愀搀漀开攀渀Ⰰ 昀漀爀洀愀琀漀Ⰰ 挀漀猀琀漀开椀渀猀挀爀椀瀀挀椀漀渀Ⰰ 爀攀最氀愀洀攀渀琀漀开甀爀氀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍㜀ऀ㄀ऀ㄀ऀ㄀ऀ倀爀甀攀戀愀 ㄀ऀ㠀ऀ瀀氀愀渀攀愀搀漀ऀ㈀　㈀㘀ⴀ　㠀ⴀ　㄀ऀ㈀　㈀㘀ⴀ　㠀ⴀ㌀㄀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㄀㜀㨀㐀㘀⸀㠀　㠀㠀㐀㈀⬀　　ऀ氀椀最愀ऀ㄀　　⸀　　ऀ⼀甀瀀氀漀愀搀猀⼀爀攀最氀愀洀攀渀琀漀猀⼀㘀㐀搀攀㤀㔀㠀　ⴀ戀愀㜀昀ⴀ㐀㔀㤀挀ⴀ㤀戀㄀昀ⴀ㤀㤀㌀㌀挀㜀㔀㜀愀㌀搀㈀⸀樀瀀最ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀伀倀夀 瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀 ⠀椀搀Ⰰ 爀漀氀开椀搀Ⰰ 渀漀洀戀爀攀Ⰰ 挀漀爀爀攀漀Ⰰ 挀漀渀琀爀愀猀攀渀愀开栀愀猀栀Ⰰ 琀攀氀攀昀漀渀漀Ⰰ 昀漀琀漀开甀爀氀Ⰰ 愀挀琀椀瘀漀Ⰰ 挀爀攀愀搀漀开攀渀Ⰰ 愀挀琀甀愀氀椀稀愀搀漀开攀渀⤀ 䘀刀伀䴀 猀琀搀椀渀㬀ഀ
਍㄀ऀ㄀ऀ䄀搀洀椀渀ऀ愀搀洀椀渀䀀氀椀最愀瀀爀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀⼀㌀礀儀　夀稀⸀氀䴀刀圀䨀䤀挀䬀唀堀㌀椀䬀甀愀瀀匀搀一礀堀⼀䠀㐀瘀夀娀㠀瘀㐀匀昀夀䰀洀㐀䜀㄀　甀匀　㤀㐀焀ऀ㄀㈀㌀㐀㔀㘀㜀㠀㤀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀　 ㈀　㨀㔀㐀㨀㌀㠀⸀㜀㠀㔀㜀　㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀　 ㈀　㨀㔀㐀㨀㌀㠀⸀㜀㠀㔀㜀　㤀⬀　　ഀ
਍㈀ऀ㈀ऀ愀爀戀椀琀爀漀㄀ऀ愀爀戀椀琀爀漀㄀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀砀砀樀䔀瘀⼀椀堀䤀倀儀愀㈀吀爀吀䘀刀儀⼀琀甀琀娀樀圀挀䔀猀匀漀甀䐀挀䰀氀匀一㔀爀䬀琀瘀礀挀搀戀氀䤀稀㔀昀䌀ऀ㔀㔀㔀　　　　　　㄀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㜀⸀㜀㌀㤀㘀㐀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㜀⸀㜀㌀㤀㘀㐀㤀⬀　　ഀ
਍㌀ऀ㈀ऀ愀爀戀椀琀爀漀㈀ऀ愀爀戀椀琀爀漀㈀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䤀戀䈀䜀刀㤀倀氀儀焀礀挀㠀⸀焀搀最猀㐀堀焀⸀洀瀀猀㠀砀夀猀氀倀瀀猀㤀堀甀⸀琀　䜀䌀䠀㌀氀礀昀眀䐀洀最欀㔀䌀ऀ㔀㔀㔀　　　　　　㈀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㠀⸀㄀㠀　　　㜀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㠀⸀㄀㠀　　　㜀⬀　　ഀ
਍㐀ऀ㈀ऀ愀爀戀椀琀爀漀㌀ऀ愀爀戀椀琀爀漀㌀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀匀⸀氀挀爀䬀㜀䜀㌀瘀爀挀䌀瀀吀䔀圀㌀䨀嘀䤀伀昀伀琀䤀漀漀瀀挀娀挀礀㈀砀㤀夀䜀娀琀唀倀挀匀䌀爀㌀娀攀䨀瘀夀䌀ऀ㔀㔀㔀　　　　　　㌀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㠀⸀㌀㠀㠀　㜀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㠀⸀㌀㠀㠀　㜀⬀　　ഀ
਍㔀ऀ㈀ऀ愀爀戀椀琀爀漀㐀ऀ愀爀戀椀琀爀漀㐀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀夀洀䰀㄀䴀氀嘀㄀堀䘀吀㤀䘀焀⸀漀嘀戀瘀砀倀⸀㜀爀䄀琀栀搀䠀昀䈀⸀儀䘀搀礀䨀礀吀䬀嘀䴀䴀⼀堀㌀砀樀䴀夀匀䠀䜀ऀ㔀㔀㔀　　　　　　㐀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㠀⸀㘀　㔀㌀　㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㠀⸀㘀　㔀㌀　㤀⬀　　ഀ
਍㘀ऀ㈀ऀ愀爀戀椀琀爀漀㔀ऀ愀爀戀椀琀爀漀㔀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀唀䘀挀吀夀㐀堀䌀猀⼀䤀焀䰀夀一稀䄀搀䄀洀挀甀攀栀唀一㔀堀䐀㜀攀　吀攀挀欀圀堀唀䌀氀甀㄀樀㘀砀夀娀㘀䄀㘀娀甀ऀ㔀㔀㔀　　　　　　㔀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㠀⸀㠀㄀㐀㐀㄀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㠀⸀㠀㄀㐀㐀㄀㤀⬀　　ഀ
਍㜀ऀ㈀ऀ愀爀戀椀琀爀漀㘀ऀ愀爀戀椀琀爀漀㘀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀甀䐀焀礀渀　愀堀㈀欀挀栀㔀夀㐀唀昀堀吀栀䄀甀䬀䐀甀儀䴀㘀㘀稀夀昀攀最甀夀戀倀夀㘀㈀㐀夀搀最欀樀䌀娀甀砀愀愀ऀ㔀㔀㔀　　　　　　㘀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㤀⸀　㌀㌀㔀㄀㔀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㤀⸀　㌀㌀㔀㄀㔀⬀　　ഀ
਍㈀㠀ऀ㐀ऀ攀渀琀爀攀渀愀搀漀爀㄀ऀ攀渀琀爀攀渀愀搀漀爀㄀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀匀䐀漀䨀氀䈀甀刀刀㌀㄀猀䨀㠀昀夀圀稀搀䄀㤀攀漀䴀㘀渀䌀䨀洀䠀焀眀⸀㐀㤀渀愀䄀砀䈀攀䴀挀焀搀嘀昀䬀倀琀挀堀愀ऀ㔀㔀㔀　　　　　　㄀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㌀⸀㜀㄀㔀㜀㈀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㌀⸀㜀㄀㔀㜀㈀⬀　　ഀ
਍㈀㤀ऀ㐀ऀ攀渀琀爀攀渀愀搀漀爀㈀ऀ攀渀琀爀攀渀愀搀漀爀㈀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀一䔀栀琀娀氀椀琀䠀䈀娀匀䌀愀挀䈀匀嘀愀夀䴀甀眀攀伀倀䄀渀瘀娀㐀⼀儀甀猀⸀㌀琀渀䠀㈀䴀漀稀樀爀娀礀挀㄀䌀圀䌀ऀ㔀㔀㔀　　　　　　㈀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㌀⸀㤀㤀㤀　㈀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㌀⸀㤀㤀㤀　㈀⬀　　ഀ
਍㌀　ऀ㐀ऀ攀渀琀爀攀渀愀搀漀爀㌀ऀ攀渀琀爀攀渀愀搀漀爀㌀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀一昀甀圀㌀焀䬀㌀瀀漀倀夀㠀吀䌀㈀爀嘀夀夀猀⸀㔀稀䈀栀瘀栀最爀⼀䌀㈀愀挀㐀䨀圀欀搀䬀眀儀㐀爀嘀倀一㔀圀䌀琀圀ऀ㔀㔀㔀　　　　　　㌀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㐀⸀㈀㄀㤀㜀㜀㈀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㐀⸀㈀㄀㤀㜀㜀㈀⬀　　ഀ
਍㌀㄀ऀ㐀ऀ攀渀琀爀攀渀愀搀漀爀㐀ऀ攀渀琀爀攀渀愀搀漀爀㐀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀猀刀眀　䔀攀唀㜀琀眀㤀樀䨀䠀唀伀㘀一渀㈀瀀甀洀攀䜀䬀㘀瀀㜀甀氀伀刀䤀⸀䰀礀樀㄀昀瀀䔀昀⼀㘀儀䴀伀䨀砀砀䄀愀ऀ㔀㔀㔀　　　　　　㐀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㐀⸀㐀㌀㜀㐀㠀㘀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㐀⸀㐀㌀㜀㐀㠀㘀⬀　　ഀ
਍㌀㈀ऀ㐀ऀ攀渀琀爀攀渀愀搀漀爀㔀ऀ攀渀琀爀攀渀愀搀漀爀㔀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀夀䐀吀䔀愀欀娀䠀唀最焀椀伀㜀礀焀琀㐀䐀漀夀伀吀䜀琀䄀砀最㠀唀最搀瘀琀一圀㠀㠀䜀䰀椀眀戀䜀娀䈀眀堀琀挀㄀㘀椀ऀ㔀㔀㔀　　　　　　㔀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㐀⸀㘀㐀㤀㔀㄀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㐀⸀㘀㐀㤀㔀㄀⬀　　ഀ
਍㠀ऀ㌀ऀ樀甀最愀搀漀爀㄀ऀ樀甀最愀搀漀爀㄀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䈀堀䜀⸀㜀唀䌀堀䬀䄀琀最䌀㌀䌀㌀堀嘀刀㤀䐀甀䈀䠀䨀堀䬀堀礀䰀挀眀㘀儀焀渀娀䜀戀眀唀圀栀䴀氀漀攀䰀欀猀匀䰀洀ऀ㐀㐀㈀㄀　㤀㈀㌀㠀㐀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㤀⸀㈀㔀㄀　㐀㈀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㤀⸀㈀㔀㄀　㐀㈀⬀　　ഀ
਍㤀ऀ㌀ऀ樀甀最愀搀漀爀㈀ऀ樀甀最愀搀漀爀㈀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀搀倀䰀稀儀倀㈀堀䄀䤀䬀昀㜀昀漀琀吀㠀⼀一欀攀夀⼀㄀圀䐀嘀䌀瘀䠀䠀䨀䌀嘀⸀䔀吀伀㐀礀唀吀一㐀䌀刀倀⸀㔀栀䘀攀ऀ㐀㐀㈀㔀㤀㈀㄀　㐀㠀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㤀⸀㐀㘀㠀㌀㌀㜀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㤀⸀㐀㘀㠀㌀㌀㜀⬀　　ഀ
਍㄀　ऀ㌀ऀ樀甀最愀搀漀爀㌀ऀ樀甀最愀搀漀爀㌀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀漀㜀㈀㜀䨀搀吀㜀䬀搀氀瀀琀猀堀　䌀吀搀焀砀甀㜀吀䬀唀琀圀娀甀䈀堀瀀夀刀䌀搀䴀夀刀夀甀最欀甀䰀一栀夀堀倀伀䌀ऀ㐀㐀㈀㠀㐀㤀㔀　㄀㈀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㤀⸀㘀㠀㤀㠀㄀㈀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㤀⸀㘀㠀㤀㠀㄀㈀⬀　　ഀ
਍㌀㌀ऀ㐀ऀ䔀渀琀爀攀渀愀搀漀爀 䔀砀琀爀愀 ㄀ऀ攀渀琀爀攀渀愀搀漀爀㘀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀圀欀㌀焀䠀甀圀瘀倀㜀㔀㌀䠀吀焀昀漀礀䘀䴀最攀䌀匀刀洀戀漀圀一昀䴀娀䘀㄀䴀儀䜀爀㔀䔀㠀䤀⸀爀㘀戀夀堀嘀栀匀甀ऀ㄀㈀㌀㐀㔀㘀㜀㠀㤀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㜀⸀㤀㌀㜀㘀㘀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㘀㨀　㄀㨀㈀㘀⸀㌀㐀㜀㄀　㔀⬀　　ഀ
਍㌀㐀ऀ㐀ऀ䔀渀琀爀攀渀愀搀漀爀 䔀砀琀爀愀 ㈀ऀ攀渀琀爀攀渀愀搀漀爀㜀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀圀欀㌀焀䠀甀圀瘀倀㜀㔀㌀䠀吀焀昀漀礀䘀䴀最攀䌀匀刀洀戀漀圀一昀䴀娀䘀㄀䴀儀䜀爀㔀䔀㠀䤀⸀爀㘀戀夀堀嘀栀匀甀ऀ㄀㈀㌀㐀㔀㘀㜀㠀㤀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㜀⸀㤀㌀㜀㘀㘀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㘀㨀　㄀㨀㈀㘀⸀㌀㐀㜀㄀　㔀⬀　　ഀ
਍㌀㔀ऀ㐀ऀ䔀渀琀爀攀渀愀搀漀爀 䔀砀琀爀愀 ㌀ऀ攀渀琀爀攀渀愀搀漀爀㠀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀圀欀㌀焀䠀甀圀瘀倀㜀㔀㌀䠀吀焀昀漀礀䘀䴀最攀䌀匀刀洀戀漀圀一昀䴀娀䘀㄀䴀儀䜀爀㔀䔀㠀䤀⸀爀㘀戀夀堀嘀栀匀甀ऀ㄀㈀㌀㐀㔀㘀㜀㠀㤀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㜀⸀㤀㌀㜀㘀㘀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㘀㨀　㄀㨀㈀㘀⸀㌀㐀㜀㄀　㔀⬀　　ഀ
਍㄀㄀ऀ㌀ऀ樀甀最愀搀漀爀㐀ऀ樀甀最愀搀漀爀㐀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀倀䠀䐀堀瘀猀焀瀀渀眀琀欀砀爀䬀䤀倀　㤀䰀欀甀礀一爀最䄀漀吀㔀儀栀䬀欀挀儀䬀唀眀㔀琀渀一礀㜀䴀䔀氀儀焀䌀砀㈀ऀ㐀㐀㈀㌀㤀㄀㠀㐀㜀㈀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㤀⸀㤀　㜀㘀㌀㄀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㈀㤀⸀㤀　㜀㘀㌀㄀⬀　　ഀ
਍㄀㈀ऀ㌀ऀ樀甀最愀搀漀爀㔀ऀ樀甀最愀搀漀爀㔀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀樀栀倀栀　堀䌀爀㜀氀眀堀樀嘀䨀㈀樀瀀䤀䘀䔀伀㄀　䈀愀欀愀伀⼀　㤀夀㐀㄀㘀焀栀䨀礀夀洀㌀最氀椀猀樀匀堀爀䰀⸀ऀ㐀㐀㈀㜀㔀　㈀㤀㌀㠀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀　⸀㄀㄀㤀　㌀㘀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀　⸀㄀㄀㤀　㌀㘀⬀　　ഀ
਍㄀㌀ऀ㌀ऀ樀甀最愀搀漀爀㘀ऀ樀甀最愀搀漀爀㘀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀樀圀夀⼀㠀䄀⼀嘀欀稀眀最栀㐀㠀嘀瀀昀嘀匀戀⸀漀氀焀䤀䄀挀栀䌀⸀樀㄀倀䔀挀䄀椀愀愀戀倀欀礀琀礀⼀㈀　䌀䠀眀匀ऀ㐀㐀㈀㤀㄀㠀㌀㜀㐀㘀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀　⸀㌀㌀㘀㄀㐀㈀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀　⸀㌀㌀㘀㄀㐀㈀⬀　　ഀ
਍㄀㐀ऀ㌀ऀ樀甀最愀搀漀爀㜀ऀ樀甀最愀搀漀爀㜀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀搀匀圀欀匀倀欀洀㜀最㜀攀栀砀䔀洀猀洀㘀儀甀甀䐀樀夀䐀䤀戀䰀㌀瀀眀匀最⼀伀䤀㈀㌀　㜀欀㈀刀㜀氀唀唀　稀䬀搀⸀ऀ㐀㐀㈀㈀　㐀㤀㔀㠀㄀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀　⸀㔀㔀㠀㔀㜀㈀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀　⸀㔀㔀㠀㔀㜀㈀⬀　　ഀ
਍㄀㔀ऀ㌀ऀ樀甀最愀搀漀爀㠀ऀ樀甀最愀搀漀爀㠀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀唀䔀漀栀匀嘀樀䐀㘀伀䘀昀琀㘀焀刀欀䤀礀䈀樀伀欀䈀搀䈀戀唀䨀攀㌀䨀⸀䘀儀㠀䌀漀䄀倀䬀搀唀瀀夀樀吀䄀攀栀㤀伀礀ऀ㐀㐀㈀㘀㌀㜀㄀㤀㈀㠀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀　⸀㜀㜀㠀　㠀㄀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀　⸀㜀㜀㠀　㠀㄀⬀　　ഀ
਍㄀㘀ऀ㌀ऀ樀甀最愀搀漀爀㤀ऀ樀甀最愀搀漀爀㤀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀　挀㄀倀堀䈀䤀㔀挀挀㠀匀猀䤀眀氀圀娀䬀　稀甀儀爀㔀堀礀挀儀娀䬀唀䬀䰀㐀爀戀昀渀椀䨀氀䨀夀　㠀䈀䬀最吀欀㤀洀ऀ㐀㐀㈀㠀㄀㔀㌀　㐀㤀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀　⸀㤀㤀㤀㄀㘀㌀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀　⸀㤀㤀㤀㄀㘀㌀⬀　　ഀ
਍㄀㜀ऀ㌀ऀ樀甀最愀搀漀爀㄀　ऀ樀甀最愀搀漀爀㄀　䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㤀搀䔀欀⸀圀瀀匀㔀最䬀吀欀漀最㠀圀䴀㈀吀刀伀樀漀⸀䬀刀瀀圀稀伀一砀䔀眀倀䰀䰀䔀㤀㘀䔀䐀漀唀㄀倀琀甀渀圀瘀匀ऀ㐀㐀㈀㐀㜀㈀㠀㔀㤀㌀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㄀⸀㈀㄀㘀㠀㜀㜀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㄀⸀㈀㄀㘀㠀㜀㜀⬀　　ഀ
਍㄀㠀ऀ㌀ऀ樀甀最愀搀漀爀㄀㄀ऀ樀甀最愀搀漀爀㄀㄀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀昀瘀搀㤀最䤀瘀䘀嘀䬀最一㈀㈀漀䤀渀堀砀　伀攀搀琀㜀戀䄀一䴀眀䠀砀昀猀猀焀㄀㜀嘀倀䨀礀稀㔀猀㈀挀搀稀吀眀伀䜀ऀ㐀㐀㈀㔀㌀㠀㄀　㐀㤀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㄀⸀㐀㘀㘀㘀㔀㐀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㄀⸀㐀㘀㘀㘀㔀㐀⬀　　ഀ
਍㄀㤀ऀ㌀ऀ樀甀最愀搀漀爀㄀㈀ऀ樀甀最愀搀漀爀㄀㈀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀匀㐀䠀圀䰀　㔀眀䜀䰀焀琀㔀戀㤀最䴀氀　　㈀攀䬀吀䰀樀爀甀嘀昀刀嘀娀礀搀㄀䠀㐀䘀㈀搀欀儀夀稀䐀琀樀䠀椀䔀瀀⸀ऀ㐀㐀㈀㈀㤀㄀㔀㠀㌀㜀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㄀⸀㜀　㠀㄀㌀㈀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㄀⸀㜀　㠀㄀㌀㈀⬀　　ഀ
਍㈀　ऀ㌀ऀ樀甀最愀搀漀爀㄀㌀ऀ樀甀最愀搀漀爀㄀㌀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㘀㐀䄀䴀洀㈀䠀稀氀㈀渀唀⸀㈀儀㜀礀猀昀洀䴀攀　攀䄀䈀堀瘀洀圀氀⸀眀圀㘀　嘀䴀搀戀㜀㌀倀䌀堀氀儀挀焀㘀夀㔀䬀ऀ㐀㐀㈀㜀㐀㠀㈀　㄀㤀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㄀⸀㤀㈀㠀　㌀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㄀⸀㤀㈀㠀　㌀⬀　　ഀ
਍㈀㄀ऀ㌀ऀ樀甀最愀搀漀爀㄀㐀ऀ樀甀最愀搀漀爀㄀㐀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䘀眀⼀吀䔀䬀攀瀀䜀稀㌀夀夀㠀愀刀䐀䈀匀䤀⼀甀㤀攀䘀䘀圀䘀琀一刀猀圀搀䌀䐀䘀唀焀礀礀娀䔀栀㠀䄀愀搀　　㤀㄀圀ऀ㐀㐀㈀㘀㄀　㌀㤀㐀㠀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㈀⸀㄀㔀　㄀㘀㜀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㈀⸀㄀㔀　㄀㘀㜀⬀　　ഀ
਍㈀㈀ऀ㌀ऀ樀甀最愀搀漀爀㄀㔀ऀ樀甀最愀搀漀爀㄀㔀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㔀眀㤀㜀猀䴀䔀⼀搀倀䈀渀䔀匀倀昀氀䤀㈀刀砀甀樀椀儀圀㘀洀䬀漀娀㘀稀攀⸀堀搀渀甀洀㈀㈀唀瘀㌀攀稀愀㔀椀瀀攀䌀ऀ㐀㐀㈀㠀㌀㤀㔀㄀　㈀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㈀⸀㌀㜀㄀㤀㠀㔀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㈀⸀㌀㜀㄀㤀㠀㔀⬀　　ഀ
਍㈀㌀ऀ㌀ऀ樀甀最愀搀漀爀㄀㘀ऀ樀甀最愀搀漀爀㄀㘀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㌀㌀䠀挀嘀娀⸀爀夀䨀䐀焀堀⸀䰀刀猀焀砀攀搀伀渀䜀爀戀栀䤀稀刀愀夀甀伀䈀䜀儀洀㔀䄀䠀㈀㈀椀㠀一挀砀儀瘀䴀爀㈀ऀ㐀㐀㈀㄀㔀㐀㤀㈀㠀㌀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㈀⸀㔀㠀㠀㤀㈀㠀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㈀⸀㔀㠀㠀㤀㈀㠀⬀　　ഀ
਍㈀㐀ऀ㌀ऀ樀甀最愀搀漀爀㄀㜀ऀ樀甀最愀搀漀爀㄀㜀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀栀礀嘀夀欀㈀愀吀唀娀䤀刀㘀　　䔀䌀昀䘀䔀眀甀㜀䜀氀瘀攀眀㄀愀䜀䰀挀渀唀䐀　䄀䌀刀洀漀　爀㌀䨀䤀焀猀䐀㤀樀洀ऀ㐀㐀㈀㤀㈀㜀㐀㠀㄀　ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㈀⸀㠀　㘀㔀㜀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㈀⸀㠀　㘀㔀㜀㤀⬀　　ഀ
਍㈀㔀ऀ㌀ऀ樀甀最愀搀漀爀㄀㠀ऀ樀甀最愀搀漀爀㄀㠀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㐀堀㜀䬀搀娀琀儀䤀䠀琀㈀漀匀匀䬀唀一䌀䌀挀攀儀吀䨀搀㈀䨀㈀㐀堀⼀氀椀㤀䐀娀㤀⸀㤀堀一㈀㄀挀㐀嘀㠀㈀䴀吀猀䌀ऀ㐀㐀㈀㌀㠀㔀㄀　㈀㤀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㌀⸀　㈀㠀㌀㠀㘀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㌀⸀　㈀㠀㌀㠀㘀⬀　　ഀ
਍㈀㘀ऀ㌀ऀ樀甀最愀搀漀爀㄀㤀ऀ樀甀最愀搀漀爀㄀㤀䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䌀㈀吀堀焀㤀䜀䌀漀䴀圀稀砀㘀搀洀氀戀嘀渀最甀攀礀㘀娀䌀⼀氀䠀洀戀樀唀䜀㜀娀氀䘀猀戀眀䰀䤀㤀䴀䤀渀㐀㔀猀砀㈀ऀ㐀㐀㈀㐀　㤀㈀㠀㌀㜀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㌀⸀㈀㐀㔀㈀㈀㄀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㌀⸀㈀㐀㔀㈀㈀㄀⬀　　ഀ
਍㈀㜀ऀ㌀ऀ樀甀最愀搀漀爀㈀　ऀ樀甀最愀搀漀爀㈀　䀀攀樀攀洀瀀氀漀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀漀渀　䄀欀䴀爀䜀洀昀㤀瀀⼀㌀瀀䐀椀䌀圀㠀娀攀戀䤀倀焀䄀樀伀娀猀㘀樀䄀䨀瀀夀䜀砀猀　戀㘀眀琀䈀唀㈀䴀焀伀瀀⸀ऀ㐀㐀㈀㘀㜀㄀㠀㌀㤀㈀ऀ愀猀猀攀琀猀⼀昀漀琀漀最愀琀漀⸀瀀渀最ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㌀⸀㐀㘀㤀㐀㜀㐀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ 　㘀㨀㌀㠀㨀㌀㌀⸀㐀㘀㤀㐀㜀㐀⬀　　ഀ
਍㌀㘀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䜀儀䈀渀戀最戀䨀焀䰀挀堀戀琀䔀嘀㐀一愀昀猀攀砀甀爀焀稀圀一瀀䌀甀㌀㈀戀倀䌀䰀漀瀀䘀焀㈀堀搀漀甀䤀挀㄀堀瀀攀ऀ㐀㐀㈀㠀㈀　㐀㤀㄀㌀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㌀㜀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀搀圀欀一㤀倀砀樀䘀砀嘀㠀椀猀㐀昀礀㤀㤀攀礀伀洀䤀䤀伀唀瀀䘀吀㤀儀漀礀㔀搀匀圀洀㠀欀㘀䨀㈀倀瘀嘀㔀倀㠀䈀夀㘀ऀ㐀㐀㈀㔀㤀㌀㄀㠀㈀㜀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㌀㠀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀娀䤀渀倀伀䬀䨀搀圀䐀⸀瀀渀栀䐀樀砀䔀猀洀䄀伀䜀椀倀㤀攀䘀䬀䨀爀椀䰀稀㄀㠀爀⼀礀䔀瀀漀瘀㘀渀刀攀夀吀娀圀䐀圀ऀ㐀㐀㈀㄀㠀㐀㜀㔀㤀㈀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㌀㤀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㠀䰀䴀栀攀㘀㜀昀伀　刀䌀匀圀䰀㌀㔀焀昀渀㄀⸀伀㠀㈀刀渀氀匀漀䔀㠀瘀䐀䠀漀焀䰀㐀戀甀爀欀渀⸀䠀洀㠀甀一㘀䬀䜀ऀ㐀㐀㈀㜀㌀㤀㈀　㐀㠀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㐀　ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䄀礀最瀀圀甀䜀儀漀　㔀䨀挀㠀挀圀　䠀㈀吀䔀⸀一䔀䔀唀䐀㤀唀㔀䌀欀搀伀⼀䈀䌀䬀焀⸀琀氀㄀嘀䬀䐀甀焀㔀一樀堀攀ऀ㐀㐀㈀㐀㄀㔀㠀㈀㤀㌀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㐀㄀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㘀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㘀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㜀㄀㜀䔀娀㌀攀⸀一䈀昀㘀氀昀⸀㔀㜀娀㌀㤀堀攀琀䬀䘀堀儀瀀瀀伀䄀䐀砀渀䐀倀栀昀娀娀⼀⸀愀砀㘀攀伀稀焀攀砀瘀甀ऀ㐀㐀㈀㘀　㈀㤀㌀㠀㄀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㐀㈀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㜀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㜀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀唀昀椀䠀䘀娀樀挀堀䤀㜀圀㘀瀀⼀㌀琀䜀㤀㔀䠀攀⸀㘀焀儀戀䔀　樀漀倀䨀伀吀刀砀刀爀嘀䬀漀倀吀甀瘀夀稀夀椀瘀稀甀ऀ㐀㐀㈀㌀㜀㠀㄀㤀㐀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㐀㌀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㠀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㠀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䄀砀戀稀氀䠀焀䈀㠀倀瘀瀀䈀䘀㌀眀焀䤀䘀焀䐀甀㘀伀䔀倀䰀䄀儀漀䬀匀　攀䔀氀氀椀瀀伀挀嘀吀瘀倀愀䈀⼀䠀儀䘀㜀愀ऀ㐀㐀㈀㤀㐀㄀㔀　㈀㠀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㐀㐀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㤀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㤀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀儀欀倀爀䬀渀伀洀㌀欀昀倀琀䤀一⸀倀䴀㌀挀䰀攀䴀攀䐀愀瀀　昀伀堀洀爀洀儀砀㠀䰀㠀唀伀欀䨀䴀䐀瀀猀愀戀䰀漀礀㈀ऀ㐀㐀㈀㈀㔀㘀㌀㠀㄀㤀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㐀㔀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀　ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀　䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀椀愀唀䬀㜀㜀愀娀㔀䌀欀氀䨀䄀戀焀䤀堀㔀昀椀攀䴀㔀䠀嘀眀爀䄀瘀倀伀䴀⸀攀㄀漀樀　㔀樀堀氀堀䈀嘀樀㌀昀㌀焀倀伀ऀ㐀㐀㈀㠀㤀㌀㐀㜀㔀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㐀㘀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀㄀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀㄀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀最昀䌀䐀琀猀㈀瘀一儀夀　渀渀娀漀圀㄀夀甀䬀攀一䄀甀眀戀娀瀀䔀焀㌀㄀琀㔀樀琀䘀渀䐀䈀䨀㜀最吀洀眀焀儀㈀䬀嘀焀ऀ㐀㐀㈀㄀　㔀㠀㈀㤀㐀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㐀㜀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀㈀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀㈀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䴀洀䜀倀䰀爀唀稀儀伀吀䰀㠀漀瀀倀䈀挀稀倀䨀⸀㜀倀攀樀焀⸀㤀椀䌀礀䘀䔀唀⼀㐀眀挀䘀攀䴀挀夀稀㔀夀㘀栀䜀⼀刀愀ऀ㐀㐀㈀㘀㠀㈀㤀㄀　㌀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㐀㠀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀㌀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀㌀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀⼀猀匀㔀䈀䠀攀稀䜀㠀洀䔀㈀䘀㤀䜀㤀圀眀猀夀伀稀挀䈀刀夀唀娀堀攀䘀㜀䌀瀀䰀瘀㄀㘀䐀渀挀䠀瀀娀瀀欀　䬀渀欀䔀匀ऀ㐀㐀㈀㐀㌀㤀㔀㜀㄀㠀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㐀㤀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀㐀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀㐀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀　甀㠀㤀甀礀㌀㌀⼀䬀⼀漀攀最䴀瘀伀㈀䬀⸀稀甀倀㤀圀儀䄀眀嘀䔀洀䠀眀倀最樀娀吀爀伀焀䜀最琀䘀栀⸀稀䈀氀吀圀⸀ऀ㐀㐀㈀㜀㄀㠀㌀㤀㈀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㔀　ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀㔀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀㔀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㌀⼀䄀欀唀搀栀瘀䰀⼀渀椀⼀䠀昀㌀甀夀䌀焀栀伀焀搀䤀挀搀稀最⸀䌀⼀匀儀瘀䬀㐀渀一䴀䐀洀㄀㔀椀圀甀䔀㔀䰀氀洀匀ऀ㐀㐀㈀㔀㤀　㄀㠀㐀㈀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㔀㄀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀㘀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀㘀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀⼀㄀最⼀氀砀渀栀猀昀䄀愀琀䄀䐀眀椀娀夀昀最⸀琀䈀　稀㤀娀匀砀渀唀攀挀搀䐀㄀漀㄀攀㔀倀䄀䤀爀礀攀欀搀伀䘀匀䜀ऀ㐀㐀㈀㈀㐀㜀㤀㔀　㄀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㔀㈀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀㜀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀㜀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䜀㤀渀倀儀　㘀眀眀猀猀挀栀㘀礀㠀渀伀戀㐀礀攀㈀洀唀䘀最娀一砀䜀挀戀䔀昀䴀戀㤀㌀㠀倀猀一樀㄀䈀䜀䠀昀唀爀㜀䜀ऀ㐀㐀㈀㠀㌀㘀㈀　㄀㤀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㔀㌀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀㠀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀㠀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀眀爀樀㤀砀䰀㜀洀樀䔀㈀儀㌀䄀栀最礀䘀椀渀堀⸀攀瘀礀㜀洀㈀堀䈀⼀爀㌀夀㤀　瘀䠀甀欀䬀夀䰀䰀瘀椀眀刀㔀䠀匀洀焀ऀ㐀㐀㈀㤀㔀㄀㐀㠀㌀㜀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㔀㐀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㄀㤀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㄀㤀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䌀㌀甀匀匀欀㄀䌀稀⼀伀欀嘀砀㌀㤀瀀欀⼀㐀䔀⸀瀀樀倀渀㤀䈀儀焀稀氀䔀匀瘀瀀琀㜀圀㠀堀漀䔀一焀伀䤀儀挀⸀䤀戀圀ऀ㐀㐀㈀㌀　㐀㜀㔀㤀㈀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㔀㔀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀　ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀　䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀瀀䘀㄀刀㐀昀琀稀㌀㈀焀愀䄀䘀昀㠀刀䰀䠀椀䜀⸀渀挀渀樀渀⸀洀焀㜀䄀䠀儀⼀⼀攀圀栀爀䰀倀夀䈀眀䰀最㘀䈀最㘀㜀圀ऀ㐀㐀㈀㘀㈀㤀㄀㠀㐀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㔀㘀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀㄀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀㄀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䨀吀㐀伀眀爀欀爀夀椀焀䤀樀椀䈀㠀椀瘀伀㐀倀伀䨀䌀匀㘀㠀䘀䬀䔀渀䘀愀䠀⼀㤀椀琀稀氀渀䠀儀㠀堀稀搀䬀㐀渀儀欀㈀ऀ㐀㐀㈀㐀㄀㠀㔀㤀㈀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㔀㜀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀㈀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀㈀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䐀㠀䈀挀嘀圀㈀樀娀圀㠀⼀夀䜀夀㜀嘀欀䔀㜀⼀甀樀爀䄀洀砀㤀夀瀀䨀⼀樀琀圀礀䴀儀栀儀栀洀㈀洀砀䘀㜀栀䌀猀䌀挀焀ऀ㐀㐀㈀㠀㜀㔀㌀　㄀㤀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㔀㠀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀㌀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀㌀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㐀戀猀愀䤀瘀儀稀䘀椀戀䔀吀渀䤀椀㘀㠀儀氀挀甀堀䠀琀吀䰀焀渀甀挀爀䄀㄀䄀䜀眀稀儀㘀䄀䔀㌀挀搀㘀䤀唀愀䄀琀㔀㈀ऀ㐀㐀㈀㄀㤀㈀㠀㐀㜀㔀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㔀㤀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀㐀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀㐀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䐀㘀匀䔀椀渀㈀㜀嘀㤀唀甀倀爀愀㈀戀⸀⼀昀漀伀㠀伀伀㄀䘀吀嘀椀䌀䜀㐀圀堀唀刀唀攀䤀嘀戀樀栀儀焀䴀䐀䄀䐀甀夀㘀ऀ㐀㐀㈀㔀　㌀㤀㄀㠀㈀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㘀　ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀㔀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀㔀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀匀䌀樀㌀攀稀㐀稀䜀挀樀䨀礀匀氀渀䜀戀挀嘀猀甀倀㔀娀唀唀甀嘀最搀䈀堀夀椀㠀攀圀甀伀漀㄀樀䰀儀堀㐀䨀焀䨀眀戀㈀ऀ㐀㐀㈀㜀㘀㐀㈀　㤀㌀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㘀㄀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀㘀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀㘀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀椀吀䔀䔀䨀吀稀䘀䜀焀瀀樀䰀洀一唀㜀䬀礀唀攀甀昀伀眀㜀䐀匀䄀䈀儀伀㤀⼀堀渀眀㤀䄀渀䜀唀䠀刀匀㐀䄀氀昀爀伀最椀ऀ㐀㐀㈀㌀㠀㄀㔀㜀㐀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㘀㈀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀㜀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀㜀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㄀娀䌀砀猀儀⼀瘀䔀㄀琀⼀娀砀漀漀砀倀嘀䐀匀攀㘀刀氀爀猀瀀匀礀　欀攀䨀最最椀䰀焀䄀夀眀䴀䜀䨀琀眀䠀渀唀嘀䌀䌀ऀ㐀㐀㈀㤀㈀　㐀㠀㄀㔀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㘀㌀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀㠀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀㠀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀昀圀堀瘀娀䄀砀㄀䤀䔀一㠀䄀㌀欀䄀䬀一䈀礀䴀伀眀䜀㔀䌀最㐀瀀堀焀伀伀匀娀䠀圀吀㤀伀娀㔀欀䄀攀戀㄀䤀爀䐀㠀洀圀ऀ㐀㐀㈀㘀㔀㜀㄀㤀㌀㠀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㘀㐀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㈀㤀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㈀㤀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀圀焀一椀嘀戀䘀䤀䄀吀䘀㐀䰀㐀焀娀圀夀栀䨀挀甀挀稀刀渀㜀洀甀䐀䴀匀吀䔀刀琀㌀最㔀䠀㠀䰀稀㤀㈀戀⼀氀㘀一㈀刀礀ऀ㐀㐀㈀㈀㌀㤀㠀㔀　㄀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㘀㔀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀　ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀　䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀嘀眀䤀刀嘀㐀儀唀猀渀焀挀眀愀夀䠀娀爀猀礀伀⸀㠀琀䔀䜀一䬀嘀挀戀一吀圀吀䬀㤀砀最瀀砀氀　䔀娀夀㈀漀欀匀瘀戀攀ऀ㐀㐀㈀㠀㄀㐀㌀㤀㈀㜀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㘀㘀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀㄀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀㄀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㔀渀㤀䘀刀栀瀀瀀吀爀䬀儀圀䌀攀戀䐀一眀㄀栀攀夀挀㜀儀䔀㠀氀漀⸀⸀氀圀䄀挀一堀猀礀樀漀栀搀椀瀀漀⸀堀眀攀渀䜀ऀ㐀㐀㈀㔀㤀㄀㈀㠀㐀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㘀㜀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀㈀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀㈀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㐀　堀挀渀戀䔀夀䨀戀堀㐀礀愀儀夀欀刀㜀䨀爀⸀　愀䨀⼀䐀樀砀　焀渀　儀䐀㠀漀圀眀圀昀䘀爀嘀礀儀昀娀娀甀洀㤀甀ऀ㐀㐀㈀㜀　㠀㄀㤀㌀㈀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㘀㠀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀㌀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀㌀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀儀攀䘀䔀甀⼀稀圀瘀䈀漀䘀䘀㈀樀䌀䈀㄀㠀礀儀伀伀倀氀砀挀䜀⸀吀䘀挀㠀礀漀夀瀀洀䌀㤀㌀愀䴀焀爀最娀欀焀攀㈀瘀椀ऀ㐀㐀㈀㌀㔀㈀㤀㐀㠀㄀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㘀㤀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀㐀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀㐀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀匀甀挀㐀㔀攀焀椀稀　刀爀夀㜀氀礀㐀⸀䤀䄀瀀攀渀戀䨀圀樀䜀唀爀㘀䌀戀椀䨀䬀㘀挀䐀㌀䜀匀一⼀㤀䔀倀䔀砀䈀伀㜀圀ऀ㐀㐀㈀㄀㐀㤀㔀㜀㈀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㜀　ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀㔀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀㔀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀刀礀㌀焀䜀㔀䜀㌀䠀挀一琀刀㈀刀欀洀瀀刀㐀樀攀最䴀㜀愀甀䄀㔀椀樀椀䌀渀瘀䐀䈀砀稀椀䈀䌀氀瘀倀一挀圀圀嘀匀䨀䬀ऀ㐀㐀㈀㤀㌀㘀㠀　㄀㔀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㜀㄀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀㘀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀㘀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀猀甀琀⸀一⼀琀䬀渀䐀猀最挀䤀挀䤀吀儀䈀氀䠀甀㤀㐀挀䨀礀渀漀㤀䘀㐀㄀刀䌀焀䈀䤀㐀欀刀娀㄀䌀儀㔀愀攀儀⼀匀砀䜀ऀ㐀㐀㈀㠀㈀㔀㄀㤀㐀㌀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㜀㈀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀㜀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀㜀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀爀漀昀愀㔀䴀搀攀䈀㄀洀焀娀瀀眀䤀唀礀渀椀⸀甀嘀䤀欀㠀䈀最渀漀夀㔀愀洀儀栀漀眀㔀愀氀㐀砀氀㤀䠀匀夀眀倀礀樀匀ऀ㐀㐀㈀㐀㜀　㌀㠀㈀㤀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㜀㌀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀㠀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀㠀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀渀娀㄀㌀㜀琀嘀㤀圀㄀瘀椀㜀㠀爀洀焀㔀砀椀搀攀最挀䴀㜀愀䌀焀䐀圀搀䔀㄀渀䤀一㘀甀䤀䰀夀䘀㔀夀愀嘀瀀椀一稀㘀㈀ऀ㐀㐀㈀㘀㄀㌀㔀　㤀㈀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㜀㐀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 ㌀㤀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㌀㤀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀攀一㈀甀䐀最栀⸀㜀椀砀愀䄀䜀瘀昀圀䄀搀甀圀⸀焀猀㤀䠀圀㌀嘀⸀㐀　爀⼀倀伀㠀甀䌀㌀䠀一夀䨀樀㠀椀䌀瘀刀䨀爀㘀ऀ㐀㐀㈀㈀㠀㐀㜀㄀㔀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㜀㔀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀　ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀　䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䔀䐀⸀甀戀愀䬀㈀⸀儀䤀昀最䄀漀儀吀㠀刀爀㠀甀爀眀䠀㜀伀伀䤀愀䰀堀攀　漀儀攀䈀焀堀一䔀䔀眀䠀刀㜀㘀圀䠀栀椀愀ऀ㐀㐀㈀㔀　㤀㈀㠀㌀㄀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㜀㘀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀㄀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀㄀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀爀䈀洀䨀戀㤀⸀欀爀㐀夀夀䠀刀⸀㌀䨀䤀漀儀最攀最䤀䘀刀昀䠀堀焀㌀樀砀礀猀㈀伀漀搀䴀椀匀䤀刀䨀⸀䤀礀䄀㌀爀䠀㈀ऀ㐀㐀㈀㤀㜀㄀㐀　㔀㠀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㜀㜀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀㈀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀㈀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㤀䔀昀漀䌀㤀圀儀唀䄀倀猀吀娀稀瀀挀猀攀砀㈀甀琀㜀㠀䜀氀渀夀　⼀甀堀氀䐀䠀　栀䘀椀焀䤀欀圀最昀稀䘀䨀一樀䴀礀ऀ㐀㐀㈀㌀㈀㠀㄀㤀　㐀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㜀㠀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀㌀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀㌀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䜀䨀䘀一挀一㔀昀一最最䘀䐀䔀䔀夀㔀瀀儀㔀樀⸀䈀堀欀攀伀⸀礀猀儀吀漀礀夀瘀娀夀䤀㐀匀䌀砀㈀最㐀瀀椀夀吀䄀⸀䜀ऀ㐀㐀㈀㠀㐀㔀㘀㄀㜀㈀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㜀㤀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀㐀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀㐀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀樀瀀䠀砀漀㄀愀琀一匀㐀欀伀㜀䰀礀搀䜀䤀愀䜀甀瘀䄀稀娀渀琀倀氀焀䬀⼀礀䨀伀⸀䬀攀堀搀嘀㠀伀挀椀砀攀爀礀倀䄀⸀ऀ㐀㐀㈀㄀㘀㌀㤀㈀㠀㔀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㠀　ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀㔀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀㔀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀伀栀愀樀倀焀攀一焀圀砀儀匀刀一搀娀焀娀匀㐀⸀戀愀猀一㔀攀椀匀欀吀伀⸀䜀⸀䐀椀甀匀䄀嘀瘀稀㐀夀㘀䤀倀挀⼀⸀㈀ऀ㐀㐀㈀㜀㤀　㌀㠀㄀㐀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㠀㄀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀㘀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀㘀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀一䨀䐀渀一眀㌀嘀爀䜀搀㜀唀䘀猀䘀欀唀渀礀甀甀稀倀㔀⼀㐀眀瘀㜀瀀䨀漀㘀嘀䜀㤀焀刀䠀唀㐀㜀一氀䜀䌀挀㄀樀戀⼀伀ऀ㐀㐀㈀㔀㄀㐀㈀　㤀㜀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㠀㈀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀㜀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀㜀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀礀䰀搀最匀䐀最搀欀⸀伀夀䰀䘀琀焀渀昀嘀夀㠀⸀䨀瘀砀匀㌀䈀搀㈀眀圀㄀䜀䘀欀砀椀䄀娀䨀爀䈀䔀砀⸀䤀搀䴀堀最㘀圀ऀ㐀㐀㈀㘀㠀㈀㔀㜀㄀㌀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㠀㌀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀㠀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀㠀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䈀吀栀夀䠀甀礀最䴀⼀瘀瘀樀愀戀渀挀䄀倀氀瀀⸀渀䴀㠀㌀㠀瀀㠀爀匀㜀吀匀㜀㈀䔀伀㄀一䌀攀㄀䨀甀一㈀䬀最儀㌀漀䌀ऀ㐀㐀㈀㐀㌀㤀㠀　㈀㔀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㠀㐀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㐀㤀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㐀㤀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀欀⼀䰀戀栀瘀吀㈀琀琀栀䐀焀砀渀䌀圀䐀漀⼀砀攀　䔀渀　㠀瀀眀渀嘀䔀娀　樀爀㄀⸀㔀䜀挀㌀爀椀䌀儀眀䬀瀀瘀刀刀礀ऀ㐀㐀㈀㈀　㜀㄀㔀㤀㠀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㠀㔀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀　ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀　䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀　稀琀䴀樀儀栀⸀漀倀唀洀瀀椀瀀㄀㄀䄀⸀䌀　攀㠀䤀砀琀⼀圀⼀樀瘀刀㤀䨀樀䴀儀眀㔀焀欀瘀吀昀渀㌀㠀欀爀㔀爀眀⸀ऀ㐀㐀㈀㠀㔀㘀㌀㤀㐀㄀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㠀㘀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀㄀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀㄀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀匀一瘀㘀㐀琀䌀吀爀㐀最唀挀䨀倀䔀刀儀倀䈀刀攀栀⼀㤀爀樀䐀䤀搀夀瀀　⼀娀㜀瘀伀嘀䰀䰀䌀　吀砀匀儀㠀挀䄀㄀䄀焀ऀ㐀㐀㈀㄀㤀㐀㠀㈀㔀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㠀㜀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀㈀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀㈀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀渀㌀砀㜀焀㘀㄀倀欀䴀䬀甀愀娀㤀一㔀琀瘀稀⼀⸀䰀䔀娀䴀猀挀搀昀㔀䌀瘀樀䘀娀匀唀䐀渀洀䬀㄀琀瘀䬀漀䘀娀砀䰀䈀䜀ऀ㐀㐀㈀㌀㜀㔀㄀　㤀㐀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㠀㠀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀㌀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀㌀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀椀昀㘀砀吀搀　儀儀挀愀䠀砀䤀愀猀琀倀䈀唀一甀㜀眀砀爀樀瘀䘀眀倀猀　倀䘀愀儀䤀䬀吀椀猀甀㤀爀䄀䜀圀稀搀䈀㐀洀ऀ㐀㐀㈀㤀　㈀㐀㠀㄀㘀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㠀㤀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀㐀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀㐀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀　一㌀㄀䰀瀀㐀唀㈀㜀焀一砀䴀挀砀洀䴀刀稀唀甀眀儀嘀搀礀娀䠀戀㌀砀䌀㤀圀椀㔀吀㐀㔀最⸀䌀瘀䈀一㌀攀䨀䐀樀㌀㘀ऀ㐀㐀㈀㔀㠀㄀㌀㤀㈀㜀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㤀　ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀㔀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀㔀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀倀夀稀眀氀䘀㘀㤀　椀焀夀爀椀瘀䌀䄀夀䬀愀䈀伀䈀䄀氀稀琀㐀䨀攀渀嘀　稀戀⼀䨀㌀䄀䴀⼀䰀䐀樀⼀昀䜀娀攀吀㠀嘀匀ऀ㐀㐀㈀㜀㈀㘀㔀　㐀㤀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㤀㄀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀㘀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀㘀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀稀夀⼀愀㈀倀䰀䔀䴀嘀瘀倀䐀⼀礀䔀䔀挀砀渀昀甀匀䴀瘀唀䌀吀漀䐀㠀椀猀匀琀氀䜀䘀唀儀⼀堀㠀⸀洀攀愀洀礀伀圀䄀㈀ऀ㐀㐀㈀㘀㐀㤀㄀㠀㌀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㤀㈀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀㜀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀㜀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䄀㐀䌀渀樀匀搀栀最夀礀稀渀洀焀稀㠀唀攀愀㔀攀洀䐀稀渀夀瘀䰀䘀⼀瀀伀䬀䔀戀䴀焀最椀欀一氀琀椀欀栀渀琀䘀洀堀匀ऀ㐀㐀㈀㈀㄀㠀㔀㜀㤀㌀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㤀㌀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀㠀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀㠀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㘀䠀匀䴀䨀搀㈀礀䴀䴀礀倀最䘀䬀匀㜀㜀琀䈀刀攀琀䔀吀欀㠀漀䤀㠀䘀猀娀礀戀　㜀最儀欀琀瘀洀椀䌀琀䬀栀儀倀挀㈀伀ऀ㐀㐀㈀㠀㌀　㤀㐀㄀㈀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㤀㐀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㔀㤀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㔀㤀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀⼀儀氀㄀昀䐀䠀䰀愀猀⼀䔀䔀㤀儀樀㌀戀䘀㤀樀甀伀眀䄀愀㈀挀琀䄀⼀㄀䔀猀搀栀栀挀栀夀最樀眀伀椀㌀䨀猀挀戀嘀堀匀ऀ㐀㐀㈀㐀㔀㜀㈀　㘀㠀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㤀㔀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㘀　ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㘀　䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀漀㤀一娀䠀甀　最愀礀伀一爀　猀猀㘀戀猀琀眀攀刀礀搀戀㈀吀䨀渀匀䘀刀⼀愀圀儀刀琀琀焀䴀⸀䠀洀礀㘀洀搀䄀爀樀匀ऀ㐀㐀㈀㄀㈀㤀㠀㌀㔀㐀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㤀㘀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㘀㄀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㘀㄀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀㜀⸀⼀䬀㜀䔀瘀愀戀㜀儀焀䴀䴀㐀瀀伀䔀瀀䴀䐀甀娀洀㔀　渀㠀愀㠀㌀漀刀猀嘀猀䨀甀䨀䔀㠀瘀倀䨀稀㈀栀䠀爀欀㐀䈀圀ऀ㐀㐀㈀㜀㠀㌀㄀㤀㐀　ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㤀㜀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㘀㈀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㘀㈀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀儀琀⸀䐀⼀㜀焀夀䨀䠀䘀倀堀攀椀䈀㠀䘀䜀最㔀伀眀砀㠀堀最焀㄀　伀焀䴀最栀眀⼀㔀瀀䔀刀堀爀甀䠀洀砀䨀　吀椀樀礀ऀ㐀㐀㈀㔀　㘀㠀㈀㜀㄀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㤀㠀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㘀㌀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㘀㌀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䔀䠀䠀搀⸀搀夀夀攀椀夀甀娀䜀嘀礀夀⸀漀椀吀⸀漀瘀圀氀一椀瀀嘀䤀爀儀戀嘀　㤀堀㘀䬀⸀䐀甀攀⼀䬀氀㌀䘀䘀䈀圀洀ऀ㐀㐀㈀㤀㐀㄀㌀㔀　㠀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㤀㤀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㘀㐀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㘀㐀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀欀愀䈀㘀䜀⸀㜀䔀㜀甀爀唀　砀䈀䈀㠀昀琀䜀⸀⸀㤀欀渀洀焀㤀㜀㤀倀吀琀夀椀䜀㠀戀瀀戀眀䴀栀䔀琀愀瀀砀昀㜀渀䬀䜀ऀ㐀㐀㈀㌀㄀㠀㜀　㤀㈀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㄀　　ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㘀㔀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㘀㔀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䠀㤀㌀椀猀唀甀㄀一䤀甀琀猀砀䐀䈀一昀焀⼀㘀⸀眀㠀㠀㔀䈀㄀㌀㄀氀䨀圀䰀砀夀䨀䔀吀䨀欀猀㘀瀀瘀匀㔀㜀欀⼀砀堀䌀ऀ㐀㐀㈀㘀㤀㈀㐀㔀㄀㌀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㄀　㄀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㘀㘀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㘀㘀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䠀爀眀⸀渀唀䨀圀䄀䰀最䄀一瘀爀圀儀甀䈀㠀䐀⸀焀堀㌀㤀吀漀伀䰀㈀甀㄀圀㜀　夀　砀甀夀氀䌀儀攀瘀䘀琀愀甀㔀攀甀ऀ㐀㐀㈀㈀㜀㔀㠀㄀㤀㐀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㄀　㈀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㘀㜀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㘀㜀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀䤀㐀搀眀爀㜀　猀吀娀䨀䌀㤀䔀砀伀猀甀吀愀䔀伀䌀娀爀最砀嘀䐀䈀琀䈀琀圀昀愀⸀㠀瘀最嘀夀挀㄀栀欀洀洀㠀愀昀椀䬀ऀ㐀㐀㈀㠀㔀　㌀㘀㈀㜀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍㄀　㌀ऀ㌀ऀ䨀甀最愀搀漀爀 䔀砀琀爀愀 㘀㠀ऀ樀甀最愀搀漀爀开攀砀琀爀愀开㘀㠀䀀琀攀猀琀⸀挀漀洀ऀ␀㈀戀␀㄀㈀␀稀⼀欀欀䠀⼀搀搀䤀樀䴀攀渀眀椀䄀䬀匀吀刀眀伀一䌀漀⸀爀眀䈀䜀攀栀一娀䜀眀娀唀䰀䔀愀㐀攀䌀琀㘀琀攀䤀昀甀㤀洀ऀ㐀㐀㈀㐀㌀㄀㤀　㠀㔀ऀ尀一ऀ琀ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㌀㨀㐀㠀⸀㘀　㘀㠀㤀⬀　　ഀ
਍尀⸀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀开樀甀最愀搀漀爀攀猀开椀搀开猀攀焀✀Ⰰ ㄀Ⰰ 昀愀氀猀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀攀猀开椀搀开猀攀焀✀Ⰰ ㌀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀挀愀渀挀栀愀猀开椀搀开猀攀焀✀Ⰰ ㄀Ⰰ 昀愀氀猀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀挀愀琀攀最漀爀椀愀猀开椀搀开猀攀焀✀Ⰰ ㄀Ⰰ 昀愀氀猀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀攀焀甀椀瀀漀开樀甀最愀搀漀爀攀猀开椀搀开猀攀焀✀Ⰰ 㠀㠀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀开椀搀开猀攀焀✀Ⰰ ㈀㈀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀开椀搀开猀攀焀✀Ⰰ ㈀㐀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀栀漀爀愀爀椀漀猀开挀愀渀挀栀愀开椀搀开猀攀焀✀Ⰰ ㄀Ⰰ 昀愀氀猀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀瀀愀最漀猀开愀爀戀椀琀爀愀樀攀开椀搀开猀攀焀✀Ⰰ ㄀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀瀀愀最漀猀开椀渀猀挀爀椀瀀挀椀漀渀开椀搀开猀攀焀✀Ⰰ ㄀Ⰰ 昀愀氀猀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀开椀搀开猀攀焀✀Ⰰ 㤀㐀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀开椀搀开猀攀焀✀Ⰰ 㘀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀爀漀氀攀猀开椀搀开猀攀焀✀Ⰰ 㜀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀猀愀渀挀椀漀渀攀猀开椀搀开猀攀焀✀Ⰰ ㄀Ⰰ 昀愀氀猀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀猀攀搀攀猀开椀搀开猀攀焀✀Ⰰ 㠀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀猀漀氀椀挀椀琀甀搀攀猀开攀焀甀椀瀀漀开椀搀开猀攀焀✀Ⰰ ㄀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀琀愀戀氀愀开瀀漀猀椀挀椀漀渀攀猀开椀搀开猀攀焀✀Ⰰ ㄀Ⰰ 昀愀氀猀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀琀漀爀渀攀漀开攀焀甀椀瀀漀猀开椀搀开猀攀焀✀Ⰰ 㠀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀开椀搀开猀攀焀✀Ⰰ 㠀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍匀䔀䰀䔀䌀吀 瀀最开挀愀琀愀氀漀最⸀猀攀琀瘀愀氀⠀✀瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀开椀搀开猀攀焀✀Ⰰ ㄀　㌀Ⰰ 琀爀甀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀开樀甀最愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 愀氀椀渀攀愀挀椀漀渀开樀甀最愀搀漀爀攀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 愀氀椀渀攀愀挀椀漀渀攀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀愀爀戀椀琀爀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 愀爀戀椀琀爀漀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀挀愀渀挀栀愀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 挀愀渀挀栀愀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀挀愀琀攀最漀爀椀愀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 挀愀琀攀最漀爀椀愀猀开渀漀洀戀爀攀开欀攀礀 唀一䤀儀唀䔀 ⠀渀漀洀戀爀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀挀愀琀攀最漀爀椀愀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 挀愀琀攀最漀爀椀愀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀渀琀爀攀渀愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀渀琀爀攀渀愀搀漀爀攀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀开樀甀最愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀焀甀椀瀀漀开樀甀最愀搀漀爀攀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀焀甀椀瀀漀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀栀漀爀愀爀椀漀猀开挀愀渀挀栀愀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 栀漀爀愀爀椀漀猀开挀愀渀挀栀愀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀樀甀最愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 樀甀最愀搀漀爀攀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀最漀猀开愀爀戀椀琀爀愀樀攀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀最漀猀开愀爀戀椀琀爀愀樀攀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀最漀猀开椀渀猀挀爀椀瀀挀椀漀渀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀最漀猀开椀渀猀挀爀椀瀀挀椀漀渀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀爀琀椀搀漀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀爀漀氀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 爀漀氀攀猀开渀漀洀戀爀攀开欀攀礀 唀一䤀儀唀䔀 ⠀渀漀洀戀爀攀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀爀漀氀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 爀漀氀攀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀猀愀渀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 猀愀渀挀椀漀渀攀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀猀攀搀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 猀攀搀攀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀猀漀氀椀挀椀琀甀搀攀猀开攀焀甀椀瀀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 猀漀氀椀挀椀琀甀搀攀猀开攀焀甀椀瀀漀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀琀愀戀氀愀开瀀漀猀椀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 琀愀戀氀愀开瀀漀猀椀挀椀漀渀攀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀开攀焀甀椀瀀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 琀漀爀渀攀漀开攀焀甀椀瀀漀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 琀漀爀渀攀漀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 甀猀甀愀爀椀漀猀开挀漀爀爀攀漀开欀攀礀 唀一䤀儀唀䔀 ⠀挀漀爀爀攀漀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 甀猀甀愀爀椀漀猀开瀀欀攀礀 倀刀䤀䴀䄀刀夀 䬀䔀夀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开愀氀椀渀攀愀挀椀漀渀开樀甀最愀搀漀爀攀猀开椀搀 伀一 瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀开樀甀最愀搀漀爀攀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开愀氀椀渀攀愀挀椀漀渀攀猀开椀搀 伀一 瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀攀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开挀愀渀挀栀愀猀开椀搀 伀一 瀀甀戀氀椀挀⸀挀愀渀挀栀愀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开挀愀琀攀最漀爀椀愀猀开椀搀 伀一 瀀甀戀氀椀挀⸀挀愀琀攀最漀爀椀愀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开攀焀甀椀瀀漀开樀甀最愀搀漀爀攀猀开椀搀 伀一 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀开樀甀最愀搀漀爀攀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开攀焀甀椀瀀漀猀开椀搀 伀一 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀开椀搀 伀一 瀀甀戀氀椀挀⸀攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开栀漀爀愀爀椀漀猀开挀愀渀挀栀愀开椀搀 伀一 瀀甀戀氀椀挀⸀栀漀爀愀爀椀漀猀开挀愀渀挀栀愀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开瀀愀最漀猀开愀爀戀椀琀爀愀樀攀开椀搀 伀一 瀀甀戀氀椀挀⸀瀀愀最漀猀开愀爀戀椀琀爀愀樀攀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开瀀愀最漀猀开椀渀猀挀爀椀瀀挀椀漀渀开椀搀 伀一 瀀甀戀氀椀挀⸀瀀愀最漀猀开椀渀猀挀爀椀瀀挀椀漀渀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开瀀愀爀琀椀搀漀猀开椀搀 伀一 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀开椀搀 伀一 瀀甀戀氀椀挀⸀瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开猀愀渀挀椀漀渀攀猀开椀搀 伀一 瀀甀戀氀椀挀⸀猀愀渀挀椀漀渀攀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开猀攀搀攀猀开椀搀 伀一 瀀甀戀氀椀挀⸀猀攀搀攀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开猀漀氀椀挀椀琀甀搀攀猀开攀焀甀椀瀀漀开椀搀 伀一 瀀甀戀氀椀挀⸀猀漀氀椀挀椀琀甀搀攀猀开攀焀甀椀瀀漀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开琀愀戀氀愀开瀀漀猀椀挀椀漀渀攀猀开椀搀 伀一 瀀甀戀氀椀挀⸀琀愀戀氀愀开瀀漀猀椀挀椀漀渀攀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开琀漀爀渀攀漀开攀焀甀椀瀀漀猀开椀搀 伀一 瀀甀戀氀椀挀⸀琀漀爀渀攀漀开攀焀甀椀瀀漀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开琀漀爀渀攀漀猀开椀搀 伀一 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䌀刀䔀䄀吀䔀 䤀一䐀䔀堀 椀砀开甀猀甀愀爀椀漀猀开椀搀 伀一 瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀 唀匀䤀一䜀 戀琀爀攀攀 ⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀开樀甀最愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 愀氀椀渀攀愀挀椀漀渀开樀甀最愀搀漀爀攀猀开愀氀椀渀攀愀挀椀漀渀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀愀氀椀渀攀愀挀椀漀渀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀攀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀开樀甀最愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 愀氀椀渀攀愀挀椀漀渀开樀甀最愀搀漀爀攀猀开樀甀最愀搀漀爀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀樀甀最愀搀漀爀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀樀甀最愀搀漀爀攀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 愀氀椀渀攀愀挀椀漀渀攀猀开攀渀琀爀攀渀愀搀漀爀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀渀琀爀攀渀愀搀漀爀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀渀琀爀攀渀愀搀漀爀攀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 愀氀椀渀攀愀挀椀漀渀攀猀开攀焀甀椀瀀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀愀氀椀渀攀愀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 愀氀椀渀攀愀挀椀漀渀攀猀开瀀愀爀琀椀搀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀瀀愀爀琀椀搀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀愀爀戀椀琀爀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 愀爀戀椀琀爀漀猀开挀愀琀攀最漀爀椀愀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀挀愀琀攀最漀爀椀愀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀挀愀琀攀最漀爀椀愀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀愀爀戀椀琀爀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 愀爀戀椀琀爀漀猀开甀猀甀愀爀椀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀甀猀甀愀爀椀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀挀愀渀挀栀愀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 挀愀渀挀栀愀猀开猀攀搀攀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀猀攀搀攀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀猀攀搀攀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀渀琀爀攀渀愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀渀琀爀攀渀愀搀漀爀攀猀开甀猀甀愀爀椀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀甀猀甀愀爀椀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀开樀甀最愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀焀甀椀瀀漀开樀甀最愀搀漀爀攀猀开攀焀甀椀瀀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀开樀甀最愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀焀甀椀瀀漀开樀甀最愀搀漀爀攀猀开樀甀最愀搀漀爀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀樀甀最愀搀漀爀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀樀甀最愀搀漀爀攀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀焀甀椀瀀漀猀开挀愀琀攀最漀爀椀愀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀挀愀琀攀最漀爀椀愀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀挀愀琀攀最漀爀椀愀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀焀甀椀瀀漀猀开攀渀琀爀攀渀愀搀漀爀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀渀琀爀攀渀愀搀漀爀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀渀琀爀攀渀愀搀漀爀攀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀开攀焀甀椀瀀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀开樀甀最愀搀漀爀开攀渀琀爀愀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀樀甀最愀搀漀爀开攀渀琀爀愀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀樀甀最愀搀漀爀攀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀开樀甀最愀搀漀爀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀樀甀最愀搀漀爀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀樀甀最愀搀漀爀攀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 攀瘀攀渀琀漀猀开瀀愀爀琀椀搀漀开瀀愀爀琀椀搀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀瀀愀爀琀椀搀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀栀漀爀愀爀椀漀猀开挀愀渀挀栀愀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 栀漀爀愀爀椀漀猀开挀愀渀挀栀愀开挀愀渀挀栀愀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀挀愀渀挀栀愀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀挀愀渀挀栀愀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀樀甀最愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 樀甀最愀搀漀爀攀猀开挀愀琀攀最漀爀椀愀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀挀愀琀攀最漀爀椀愀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀挀愀琀攀最漀爀椀愀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀樀甀最愀搀漀爀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 樀甀最愀搀漀爀攀猀开甀猀甀愀爀椀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀甀猀甀愀爀椀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀最漀猀开愀爀戀椀琀爀愀樀攀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀最漀猀开愀爀戀椀琀爀愀樀攀开愀爀戀椀琀爀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀愀爀戀椀琀爀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀愀爀戀椀琀爀漀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀最漀猀开愀爀戀椀琀爀愀樀攀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀最漀猀开愀爀戀椀琀爀愀樀攀开瀀愀爀琀椀搀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀瀀愀爀琀椀搀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀最漀猀开椀渀猀挀爀椀瀀挀椀漀渀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀最漀猀开椀渀猀挀爀椀瀀挀椀漀渀开攀焀甀椀瀀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀最漀猀开椀渀猀挀爀椀瀀挀椀漀渀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀最漀猀开椀渀猀挀爀椀瀀挀椀漀渀开琀漀爀渀攀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀琀漀爀渀攀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀爀琀椀搀漀猀开愀爀戀椀琀爀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀愀爀戀椀琀爀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀愀爀戀椀琀爀漀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀爀琀椀搀漀猀开挀愀渀挀栀愀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀挀愀渀挀栀愀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀挀愀渀挀栀愀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀爀琀椀搀漀猀开攀焀甀椀瀀漀开氀漀挀愀氀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开氀漀挀愀氀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀爀琀椀搀漀猀开攀焀甀椀瀀漀开瘀椀猀椀琀愀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开瘀椀猀椀琀愀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀愀爀琀椀搀漀猀开琀漀爀渀攀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀琀漀爀渀攀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀开愀爀戀椀琀爀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀愀爀戀椀琀爀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀愀爀戀椀琀爀漀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀开攀焀甀椀瀀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 瀀漀猀琀甀氀愀挀椀漀渀攀猀开愀爀戀椀琀爀漀开琀漀爀渀攀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀琀漀爀渀攀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀猀愀渀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 猀愀渀挀椀漀渀攀猀开攀焀甀椀瀀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀猀愀渀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 猀愀渀挀椀漀渀攀猀开樀甀最愀搀漀爀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀樀甀最愀搀漀爀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀樀甀最愀搀漀爀攀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀猀愀渀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 猀愀渀挀椀漀渀攀猀开瀀愀爀琀椀搀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀瀀愀爀琀椀搀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀瀀愀爀琀椀搀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀猀攀搀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 猀攀搀攀猀开愀搀洀椀渀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀愀搀洀椀渀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀猀漀氀椀挀椀琀甀搀攀猀开攀焀甀椀瀀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 猀漀氀椀挀椀琀甀搀攀猀开攀焀甀椀瀀漀开攀焀甀椀瀀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀猀漀氀椀挀椀琀甀搀攀猀开攀焀甀椀瀀漀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 猀漀氀椀挀椀琀甀搀攀猀开攀焀甀椀瀀漀开樀甀最愀搀漀爀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀樀甀最愀搀漀爀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀樀甀最愀搀漀爀攀猀⠀甀猀甀愀爀椀漀开椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀琀愀戀氀愀开瀀漀猀椀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 琀愀戀氀愀开瀀漀猀椀挀椀漀渀攀猀开攀焀甀椀瀀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀琀愀戀氀愀开瀀漀猀椀挀椀漀渀攀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 琀愀戀氀愀开瀀漀猀椀挀椀漀渀攀猀开琀漀爀渀攀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀琀漀爀渀攀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀开攀焀甀椀瀀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 琀漀爀渀攀漀开攀焀甀椀瀀漀猀开攀焀甀椀瀀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀攀焀甀椀瀀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀攀焀甀椀瀀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀开攀焀甀椀瀀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 琀漀爀渀攀漀开攀焀甀椀瀀漀猀开琀漀爀渀攀漀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀琀漀爀渀攀漀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀⠀椀搀⤀ 伀一 䐀䔀䰀䔀吀䔀 䌀䄀匀䌀䄀䐀䔀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 琀漀爀渀攀漀猀开愀搀洀椀渀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀愀搀洀椀渀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 琀漀爀渀攀漀猀开挀愀琀攀最漀爀椀愀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀挀愀琀攀最漀爀椀愀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀挀愀琀攀最漀爀椀愀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀琀漀爀渀攀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 琀漀爀渀攀漀猀开猀攀搀攀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀猀攀搀攀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀猀攀搀攀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍䄀䰀吀䔀刀 吀䄀䈀䰀䔀 伀一䰀夀 瀀甀戀氀椀挀⸀甀猀甀愀爀椀漀猀ഀ
਍    䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 甀猀甀愀爀椀漀猀开爀漀氀开椀搀开昀欀攀礀 䘀伀刀䔀䤀䜀一 䬀䔀夀 ⠀爀漀氀开椀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 瀀甀戀氀椀挀⸀爀漀氀攀猀⠀椀搀⤀㬀ഀ
਍ഀ
਍ഀ
਍ഀ
਍尀甀渀爀攀猀琀爀椀挀琀 渀洀䤀倀樀眀瘀㠀猀匀䔀㐀倀攀渀䰀㔀瘀眀倀礀䤀攀欀甀昀愀䐀挀琀㜀欀琀欀倀䴀一最䠀㠀挀㄀嘀欀㄀樀䔀欀猀㄀戀㌀夀欀䜀䐀　昀猀䈀㘀最䈀ഀ
਍ഀ
਍