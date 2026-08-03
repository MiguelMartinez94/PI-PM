SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_rol_id_fkey;
ALTER TABLE ONLY public.torneos DROP CONSTRAINT torneos_sede_id_fkey;
ALTER TABLE ONLY public.torneos DROP CONSTRAINT torneos_categoria_id_fkey;
ALTER TABLE ONLY public.torneos DROP CONSTRAINT torneos_admin_id_fkey;
ALTER TABLE ONLY public.torneo_equipos DROP CONSTRAINT torneo_equipos_torneo_id_fkey;
ALTER TABLE ONLY public.torneo_equipos DROP CONSTRAINT torneo_equipos_equipo_id_fkey;
ALTER TABLE ONLY public.tabla_posiciones DROP CONSTRAINT tabla_posiciones_torneo_id_fkey;
ALTER TABLE ONLY public.tabla_posiciones DROP CONSTRAINT tabla_posiciones_equipo_id_fkey;
ALTER TABLE ONLY public.solicitudes_equipo DROP CONSTRAINT solicitudes_equipo_jugador_id_fkey;
ALTER TABLE ONLY public.solicitudes_equipo DROP CONSTRAINT solicitudes_equipo_equipo_id_fkey;
ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_admin_id_fkey;
ALTER TABLE ONLY public.sanciones DROP CONSTRAINT sanciones_partido_id_fkey;
ALTER TABLE ONLY public.sanciones DROP CONSTRAINT sanciones_jugador_id_fkey;
ALTER TABLE ONLY public.sanciones DROP CONSTRAINT sanciones_equipo_id_fkey;
ALTER TABLE ONLY public.postulaciones_arbitro DROP CONSTRAINT postulaciones_arbitro_torneo_id_fkey;
ALTER TABLE ONLY public.postulaciones_arbitro DROP CONSTRAINT postulaciones_arbitro_equipo_id_fkey;
ALTER TABLE ONLY public.postulaciones_arbitro DROP CONSTRAINT postulaciones_arbitro_arbitro_id_fkey;
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_torneo_id_fkey;
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_equipo_visita_id_fkey;
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_equipo_local_id_fkey;
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_cancha_id_fkey;
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_arbitro_id_fkey;
ALTER TABLE ONLY public.pagos_inscripcion DROP CONSTRAINT pagos_inscripcion_torneo_id_fkey;
ALTER TABLE ONLY public.pagos_inscripcion DROP CONSTRAINT pagos_inscripcion_equipo_id_fkey;
ALTER TABLE ONLY public.pagos_arbitraje DROP CONSTRAINT pagos_arbitraje_partido_id_fkey;
ALTER TABLE ONLY public.pagos_arbitraje DROP CONSTRAINT pagos_arbitraje_arbitro_id_fkey;
ALTER TABLE ONLY public.jugadores DROP CONSTRAINT jugadores_usuario_id_fkey;
ALTER TABLE ONLY public.jugadores DROP CONSTRAINT jugadores_categoria_id_fkey;
ALTER TABLE ONLY public.horarios_cancha DROP CONSTRAINT horarios_cancha_cancha_id_fkey;
ALTER TABLE ONLY public.eventos_partido DROP CONSTRAINT eventos_partido_partido_id_fkey;
ALTER TABLE ONLY public.eventos_partido DROP CONSTRAINT eventos_partido_jugador_id_fkey;
ALTER TABLE ONLY public.eventos_partido DROP CONSTRAINT eventos_partido_jugador_entra_id_fkey;
ALTER TABLE ONLY public.eventos_partido DROP CONSTRAINT eventos_partido_equipo_id_fkey;
ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_entrenador_id_fkey;
ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_categoria_id_fkey;
ALTER TABLE ONLY public.equipo_jugadores DROP CONSTRAINT equipo_jugadores_jugador_id_fkey;
ALTER TABLE ONLY public.equipo_jugadores DROP CONSTRAINT equipo_jugadores_equipo_id_fkey;
ALTER TABLE ONLY public.entrenadores DROP CONSTRAINT entrenadores_usuario_id_fkey;
ALTER TABLE ONLY public.canchas DROP CONSTRAINT canchas_sede_id_fkey;
ALTER TABLE ONLY public.arbitros DROP CONSTRAINT arbitros_usuario_id_fkey;
ALTER TABLE ONLY public.arbitros DROP CONSTRAINT arbitros_categoria_id_fkey;
ALTER TABLE ONLY public.alineaciones DROP CONSTRAINT alineaciones_partido_id_fkey;
ALTER TABLE ONLY public.alineaciones DROP CONSTRAINT alineaciones_equipo_id_fkey;
ALTER TABLE ONLY public.alineaciones DROP CONSTRAINT alineaciones_entrenador_id_fkey;
ALTER TABLE ONLY public.alineacion_jugadores DROP CONSTRAINT alineacion_jugadores_jugador_id_fkey;
ALTER TABLE ONLY public.alineacion_jugadores DROP CONSTRAINT alineacion_jugadores_alineacion_id_fkey;
DROP INDEX public.ix_usuarios_id;
DROP INDEX public.ix_torneos_id;
DROP INDEX public.ix_torneo_equipos_id;
DROP INDEX public.ix_tabla_posiciones_id;
DROP INDEX public.ix_solicitudes_equipo_id;
DROP INDEX public.ix_sedes_id;
DROP INDEX public.ix_sanciones_id;
DROP INDEX public.ix_postulaciones_arbitro_id;
DROP INDEX public.ix_partidos_id;
DROP INDEX public.ix_pagos_inscripcion_id;
DROP INDEX public.ix_pagos_arbitraje_id;
DROP INDEX public.ix_horarios_cancha_id;
DROP INDEX public.ix_eventos_partido_id;
DROP INDEX public.ix_equipos_id;
DROP INDEX public.ix_equipo_jugadores_id;
DROP INDEX public.ix_categorias_id;
DROP INDEX public.ix_canchas_id;
DROP INDEX public.ix_alineaciones_id;
DROP INDEX public.ix_alineacion_jugadores_id;
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_correo_key;
ALTER TABLE ONLY public.torneos DROP CONSTRAINT torneos_pkey;
ALTER TABLE ONLY public.torneo_equipos DROP CONSTRAINT torneo_equipos_pkey;
ALTER TABLE ONLY public.tabla_posiciones DROP CONSTRAINT tabla_posiciones_pkey;
ALTER TABLE ONLY public.solicitudes_equipo DROP CONSTRAINT solicitudes_equipo_pkey;
ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_pkey;
ALTER TABLE ONLY public.sanciones DROP CONSTRAINT sanciones_pkey;
ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_nombre_key;
ALTER TABLE ONLY public.postulaciones_arbitro DROP CONSTRAINT postulaciones_arbitro_pkey;
ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_pkey;
ALTER TABLE ONLY public.pagos_inscripcion DROP CONSTRAINT pagos_inscripcion_pkey;
ALTER TABLE ONLY public.pagos_arbitraje DROP CONSTRAINT pagos_arbitraje_pkey;
ALTER TABLE ONLY public.jugadores DROP CONSTRAINT jugadores_pkey;
ALTER TABLE ONLY public.horarios_cancha DROP CONSTRAINT horarios_cancha_pkey;
ALTER TABLE ONLY public.eventos_partido DROP CONSTRAINT eventos_partido_pkey;
ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_pkey;
ALTER TABLE ONLY public.equipo_jugadores DROP CONSTRAINT equipo_jugadores_pkey;
ALTER TABLE ONLY public.entrenadores DROP CONSTRAINT entrenadores_pkey;
ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_nombre_key;
ALTER TABLE ONLY public.canchas DROP CONSTRAINT canchas_pkey;
ALTER TABLE ONLY public.arbitros DROP CONSTRAINT arbitros_pkey;
ALTER TABLE ONLY public.alineaciones DROP CONSTRAINT alineaciones_pkey;
ALTER TABLE ONLY public.alineacion_jugadores DROP CONSTRAINT alineacion_jugadores_pkey;
ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.torneos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.torneo_equipos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.tabla_posiciones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.solicitudes_equipo ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sedes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sanciones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.postulaciones_arbitro ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.partidos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.pagos_inscripcion ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.pagos_arbitraje ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.horarios_cancha ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.eventos_partido ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.equipos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.equipo_jugadores ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.categorias ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.canchas ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.alineaciones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.alineacion_jugadores ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.usuarios_id_seq;
DROP TABLE public.usuarios;
DROP SEQUENCE public.torneos_id_seq;
DROP TABLE public.torneos;
DROP SEQUENCE public.torneo_equipos_id_seq;
DROP TABLE public.torneo_equipos;
DROP SEQUENCE public.tabla_posiciones_id_seq;
DROP TABLE public.tabla_posiciones;
DROP SEQUENCE public.solicitudes_equipo_id_seq;
DROP TABLE public.solicitudes_equipo;
DROP SEQUENCE public.sedes_id_seq;
DROP TABLE public.sedes;
DROP SEQUENCE public.sanciones_id_seq;
DROP TABLE public.sanciones;
DROP SEQUENCE public.roles_id_seq;
DROP TABLE public.roles;
DROP SEQUENCE public.postulaciones_arbitro_id_seq;
DROP TABLE public.postulaciones_arbitro;
DROP SEQUENCE public.partidos_id_seq;
DROP TABLE public.partidos;
DROP SEQUENCE public.pagos_inscripcion_id_seq;
DROP TABLE public.pagos_inscripcion;
DROP SEQUENCE public.pagos_arbitraje_id_seq;
DROP TABLE public.pagos_arbitraje;
DROP TABLE public.jugadores;
DROP SEQUENCE public.horarios_cancha_id_seq;
DROP TABLE public.horarios_cancha;
DROP SEQUENCE public.eventos_partido_id_seq;
DROP TABLE public.eventos_partido;
DROP SEQUENCE public.equipos_id_seq;
DROP TABLE public.equipos;
DROP SEQUENCE public.equipo_jugadores_id_seq;
DROP TABLE public.equipo_jugadores;
DROP TABLE public.entrenadores;
DROP SEQUENCE public.categorias_id_seq;
DROP TABLE public.categorias;
DROP SEQUENCE public.canchas_id_seq;
DROP TABLE public.canchas;
DROP TABLE public.arbitros;
DROP SEQUENCE public.alineaciones_id_seq;
DROP TABLE public.alineaciones;
DROP SEQUENCE public.alineacion_jugadores_id_seq;
DROP TABLE public.alineacion_jugadores;
SET default_tablespace = '';
SET default_table_access_method = heap;
CREATE TABLE public.alineacion_jugadores (
    id integer NOT NULL,
    alineacion_id integer NOT NULL,
    jugador_id integer NOT NULL,
    posicion character varying(30) NOT NULL,
    es_titular boolean NOT NULL,
    numero_dorsal smallint
);
CREATE SEQUENCE public.alineacion_jugadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.alineacion_jugadores_id_seq OWNED BY public.alineacion_jugadores.id;
CREATE TABLE public.alineaciones (
    id integer NOT NULL,
    partido_id integer NOT NULL,
    equipo_id integer NOT NULL,
    entrenador_id integer NOT NULL,
    formacion character varying(10),
    creado_en timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.alineaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.alineaciones_id_seq OWNED BY public.alineaciones.id;
CREATE TABLE public.arbitros (
    usuario_id integer NOT NULL,
    categoria_id integer,
    anios_experiencia smallint,
    calificacion_promedio numeric(3,2),
    certificado_url character varying(255)
);
CREATE TABLE public.canchas (
    id integer NOT NULL,
    sede_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo_superficie character varying(30),
    techada boolean NOT NULL,
    activa boolean NOT NULL
);
CREATE SEQUENCE public.canchas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.canchas_id_seq OWNED BY public.canchas.id;
CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    descripcion character varying(200)
);
CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;
CREATE TABLE public.entrenadores (
    usuario_id integer NOT NULL,
    anios_experiencia smallint
);
CREATE TABLE public.equipo_jugadores (
    id integer NOT NULL,
    equipo_id integer NOT NULL,
    jugador_id integer NOT NULL,
    numero_dorsal smallint NOT NULL,
    fecha_ingreso date DEFAULT CURRENT_DATE NOT NULL,
    fecha_baja date,
    estado character varying(20) NOT NULL
);
CREATE SEQUENCE public.equipo_jugadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.equipo_jugadores_id_seq OWNED BY public.equipo_jugadores.id;
CREATE TABLE public.equipos (
    id integer NOT NULL,
    entrenador_id integer NOT NULL,
    categoria_id integer,
    nombre character varying(100) NOT NULL,
    escudo_url character varying(255),
    limite_jugadores smallint NOT NULL,
    creado_en timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.equipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.equipos_id_seq OWNED BY public.equipos.id;
CREATE TABLE public.eventos_partido (
    id integer NOT NULL,
    partido_id integer NOT NULL,
    equipo_id integer NOT NULL,
    jugador_id integer,
    jugador_entra_id integer,
    tipo_evento character varying(30) NOT NULL,
    minuto smallint NOT NULL,
    detalle character varying(255),
    creado_en timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.eventos_partido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.eventos_partido_id_seq OWNED BY public.eventos_partido.id;
CREATE TABLE public.horarios_cancha (
    id integer NOT NULL,
    cancha_id integer NOT NULL,
    dia_semana smallint NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL
);
CREATE SEQUENCE public.horarios_cancha_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.horarios_cancha_id_seq OWNED BY public.horarios_cancha.id;
CREATE TABLE public.jugadores (
    usuario_id integer NOT NULL,
    categoria_id integer,
    dorsal_preferido smallint,
    posicion character varying(30),
    especialidad character varying(60)
);
CREATE TABLE public.pagos_arbitraje (
    id integer NOT NULL,
    partido_id integer NOT NULL,
    arbitro_id integer NOT NULL,
    monto numeric(10,2) NOT NULL,
    metodo character varying(50),
    estado character varying(20) NOT NULL,
    pagado_en timestamp with time zone
);
CREATE SEQUENCE public.pagos_arbitraje_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.pagos_arbitraje_id_seq OWNED BY public.pagos_arbitraje.id;
CREATE TABLE public.pagos_inscripcion (
    id integer NOT NULL,
    torneo_id integer NOT NULL,
    equipo_id integer NOT NULL,
    monto numeric(10,2) NOT NULL,
    metodo character varying(50),
    estado character varying(20) NOT NULL,
    pagado_en timestamp with time zone
);
CREATE SEQUENCE public.pagos_inscripcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.pagos_inscripcion_id_seq OWNED BY public.pagos_inscripcion.id;
CREATE TABLE public.partidos (
    id integer NOT NULL,
    torneo_id integer NOT NULL,
    equipo_local_id integer,
    equipo_visita_id integer,
    arbitro_id integer,
    cancha_id integer,
    fecha_hora timestamp with time zone,
    estado character varying(20) NOT NULL,
    estado_arbitro character varying(20) NOT NULL,
    goles_local smallint NOT NULL,
    goles_visita smallint NOT NULL,
    minutos_extra smallint NOT NULL,
    motivo_cancelacion character varying(255),
    creado_en timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.partidos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.partidos_id_seq OWNED BY public.partidos.id;
CREATE TABLE public.postulaciones_arbitro (
    id integer NOT NULL,
    arbitro_id integer NOT NULL,
    torneo_id integer,
    equipo_id integer,
    estado character varying(20) NOT NULL,
    fecha_postulacion timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.postulaciones_arbitro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.postulaciones_arbitro_id_seq OWNED BY public.postulaciones_arbitro.id;
CREATE TABLE public.roles (
    id smallint NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(150)
);
CREATE SEQUENCE public.roles_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
CREATE TABLE public.sanciones (
    id integer NOT NULL,
    jugador_id integer,
    equipo_id integer,
    partido_id integer,
    tipo character varying(30) NOT NULL,
    motivo character varying(255),
    partidos_suspension smallint NOT NULL,
    fecha_inicio date DEFAULT CURRENT_DATE NOT NULL,
    fecha_fin date,
    estado character varying(20) NOT NULL,
    creado_en timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.sanciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.sanciones_id_seq OWNED BY public.sanciones.id;
CREATE TABLE public.sedes (
    id integer NOT NULL,
    admin_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(255) NOT NULL,
    activa boolean NOT NULL,
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    telefono character varying(20),
    ciudad character varying(100),
    cantidad_canchas integer DEFAULT 1,
    horario_apertura time without time zone,
    horario_cierre time without time zone,
    foto_url character varying(255),
    amenidades character varying(500)
);
CREATE SEQUENCE public.sedes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.sedes_id_seq OWNED BY public.sedes.id;
CREATE TABLE public.solicitudes_equipo (
    id integer NOT NULL,
    jugador_id integer NOT NULL,
    equipo_id integer NOT NULL,
    estado character varying(20) NOT NULL,
    fecha_solicitud timestamp with time zone DEFAULT now() NOT NULL,
    fecha_respuesta timestamp with time zone
);
CREATE SEQUENCE public.solicitudes_equipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.solicitudes_equipo_id_seq OWNED BY public.solicitudes_equipo.id;
CREATE TABLE public.tabla_posiciones (
    id integer NOT NULL,
    torneo_id integer NOT NULL,
    equipo_id integer NOT NULL,
    partidos_jugados smallint NOT NULL,
    ganados smallint NOT NULL,
    empatados smallint NOT NULL,
    perdidos smallint NOT NULL,
    goles_favor smallint NOT NULL,
    goles_contra smallint NOT NULL,
    puntos smallint NOT NULL,
    actualizado_en timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.tabla_posiciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.tabla_posiciones_id_seq OWNED BY public.tabla_posiciones.id;
CREATE TABLE public.torneo_equipos (
    id integer NOT NULL,
    torneo_id integer NOT NULL,
    equipo_id integer NOT NULL,
    fecha_inscripcion timestamp with time zone DEFAULT now() NOT NULL,
    estado character varying(20) NOT NULL,
    grupo character varying(10)
);
CREATE SEQUENCE public.torneo_equipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.torneo_equipos_id_seq OWNED BY public.torneo_equipos.id;
CREATE TABLE public.torneos (
    id integer NOT NULL,
    sede_id integer NOT NULL,
    admin_id integer NOT NULL,
    categoria_id integer,
    nombre character varying(100) NOT NULL,
    cupo_equipos smallint NOT NULL,
    estado character varying(20) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    formato character varying(50),
    costo_inscripcion numeric(10,2) DEFAULT 0,
    reglamento_url character varying(255)
);
CREATE SEQUENCE public.torneos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.torneos_id_seq OWNED BY public.torneos.id;
CREATE TABLE public.usuarios (
    id integer NOT NULL,
    rol_id smallint NOT NULL,
    nombre character varying(100) NOT NULL,
    correo character varying(150) NOT NULL,
    contrasena_hash character varying(255) NOT NULL,
    telefono character varying(20),
    foto_url character varying(255),
    activo boolean NOT NULL,
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    actualizado_en timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
ALTER TABLE ONLY public.alineacion_jugadores ALTER COLUMN id SET DEFAULT nextval('public.alineacion_jugadores_id_seq'::regclass);
ALTER TABLE ONLY public.alineaciones ALTER COLUMN id SET DEFAULT nextval('public.alineaciones_id_seq'::regclass);
ALTER TABLE ONLY public.canchas ALTER COLUMN id SET DEFAULT nextval('public.canchas_id_seq'::regclass);
ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);
ALTER TABLE ONLY public.equipo_jugadores ALTER COLUMN id SET DEFAULT nextval('public.equipo_jugadores_id_seq'::regclass);
ALTER TABLE ONLY public.equipos ALTER COLUMN id SET DEFAULT nextval('public.equipos_id_seq'::regclass);
ALTER TABLE ONLY public.eventos_partido ALTER COLUMN id SET DEFAULT nextval('public.eventos_partido_id_seq'::regclass);
ALTER TABLE ONLY public.horarios_cancha ALTER COLUMN id SET DEFAULT nextval('public.horarios_cancha_id_seq'::regclass);
ALTER TABLE ONLY public.pagos_arbitraje ALTER COLUMN id SET DEFAULT nextval('public.pagos_arbitraje_id_seq'::regclass);
ALTER TABLE ONLY public.pagos_inscripcion ALTER COLUMN id SET DEFAULT nextval('public.pagos_inscripcion_id_seq'::regclass);
ALTER TABLE ONLY public.partidos ALTER COLUMN id SET DEFAULT nextval('public.partidos_id_seq'::regclass);
ALTER TABLE ONLY public.postulaciones_arbitro ALTER COLUMN id SET DEFAULT nextval('public.postulaciones_arbitro_id_seq'::regclass);
ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
ALTER TABLE ONLY public.sanciones ALTER COLUMN id SET DEFAULT nextval('public.sanciones_id_seq'::regclass);
ALTER TABLE ONLY public.sedes ALTER COLUMN id SET DEFAULT nextval('public.sedes_id_seq'::regclass);
ALTER TABLE ONLY public.solicitudes_equipo ALTER COLUMN id SET DEFAULT nextval('public.solicitudes_equipo_id_seq'::regclass);
ALTER TABLE ONLY public.tabla_posiciones ALTER COLUMN id SET DEFAULT nextval('public.tabla_posiciones_id_seq'::regclass);
ALTER TABLE ONLY public.torneo_equipos ALTER COLUMN id SET DEFAULT nextval('public.torneo_equipos_id_seq'::regclass);
ALTER TABLE ONLY public.torneos ALTER COLUMN id SET DEFAULT nextval('public.torneos_id_seq'::regclass);
ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
COPY public.alineacion_jugadores (id, alineacion_id, jugador_id, posicion, es_titular, numero_dorsal) FROM stdin;
\.
COPY public.alineaciones (id, partido_id, equipo_id, entrenador_id, formacion, creado_en) FROM stdin;
\.
COPY public.arbitros (usuario_id, categoria_id, anios_experiencia, calificacion_promedio, certificado_url) FROM stdin;
2	\N	\N	\N	\N
3	\N	\N	\N	\N
4	\N	\N	\N	\N
5	\N	\N	\N	\N
6	\N	\N	\N	\N
7	\N	\N	\N	\N
\.
COPY public.canchas (id, sede_id, nombre, tipo_superficie, techada, activa) FROM stdin;
\.
COPY public.categorias (id, nombre, descripcion) FROM stdin;
1	Masculina	Categor├愀 瀀愀爀愀 栀漀洀戀爀攀猀 
2	Femenina	Categor├愀 瀀愀爀愀 洀甀樀攀爀攀猀 
\.
COPY public.entrenadores (usuario_id, anios_experiencia) FROM stdin;
28	\N
29	\N
30	\N
31	\N
32	\N
33	5
34	5
35	5
\.
COPY public.equipo_jugadores (id, equipo_id, jugador_id, numero_dorsal, fecha_ingreso, fecha_baja, estado) FROM stdin;
1	15	8	1	2026-07-31	\N	activo
2	15	9	2	2026-07-31	\N	activo
3	15	10	3	2026-07-31	\N	activo
4	15	11	4	2026-07-31	\N	activo
5	15	12	5	2026-07-31	\N	activo
6	15	13	6	2026-07-31	\N	activo
7	15	14	7	2026-07-31	\N	activo
8	15	15	8	2026-07-31	\N	activo
9	15	16	9	2026-07-31	\N	activo
10	15	17	10	2026-07-31	\N	activo
11	15	18	11	2026-07-31	\N	activo
12	16	19	1	2026-07-31	\N	activo
13	16	20	2	2026-07-31	\N	activo
14	16	21	3	2026-07-31	\N	activo
15	16	22	4	2026-07-31	\N	activo
16	16	23	5	2026-07-31	\N	activo
17	16	24	6	2026-07-31	\N	activo
18	16	25	7	2026-07-31	\N	activo
19	16	26	8	2026-07-31	\N	activo
20	16	27	9	2026-07-31	\N	activo
21	16	36	10	2026-07-31	\N	activo
22	16	37	11	2026-07-31	\N	activo
23	17	38	1	2026-07-31	\N	activo
24	17	39	2	2026-07-31	\N	activo
25	17	40	3	2026-07-31	\N	activo
26	17	41	4	2026-07-31	\N	activo
27	17	42	5	2026-07-31	\N	activo
28	17	43	6	2026-07-31	\N	activo
29	17	44	7	2026-07-31	\N	activo
30	17	45	8	2026-07-31	\N	activo
31	17	46	9	2026-07-31	\N	activo
32	17	47	10	2026-07-31	\N	activo
33	17	48	11	2026-07-31	\N	activo
34	18	49	1	2026-07-31	\N	activo
35	18	50	2	2026-07-31	\N	activo
36	18	51	3	2026-07-31	\N	activo
37	18	52	4	2026-07-31	\N	activo
38	18	53	5	2026-07-31	\N	activo
39	18	54	6	2026-07-31	\N	activo
40	18	55	7	2026-07-31	\N	activo
41	18	56	8	2026-07-31	\N	activo
42	18	57	9	2026-07-31	\N	activo
43	18	58	10	2026-07-31	\N	activo
44	18	59	11	2026-07-31	\N	activo
45	19	60	1	2026-07-31	\N	activo
46	19	61	2	2026-07-31	\N	activo
47	19	62	3	2026-07-31	\N	activo
48	19	63	4	2026-07-31	\N	activo
49	19	64	5	2026-07-31	\N	activo
50	19	65	6	2026-07-31	\N	activo
51	19	66	7	2026-07-31	\N	activo
52	19	67	8	2026-07-31	\N	activo
53	19	68	9	2026-07-31	\N	activo
54	19	69	10	2026-07-31	\N	activo
55	19	70	11	2026-07-31	\N	activo
56	20	71	1	2026-07-31	\N	activo
57	20	72	2	2026-07-31	\N	activo
58	20	73	3	2026-07-31	\N	activo
59	20	74	4	2026-07-31	\N	activo
60	20	75	5	2026-07-31	\N	activo
61	20	76	6	2026-07-31	\N	activo
62	20	77	7	2026-07-31	\N	activo
63	20	78	8	2026-07-31	\N	activo
64	20	79	9	2026-07-31	\N	activo
65	20	80	10	2026-07-31	\N	activo
66	20	81	11	2026-07-31	\N	activo
67	21	82	1	2026-07-31	\N	activo
68	21	83	2	2026-07-31	\N	activo
69	21	84	3	2026-07-31	\N	activo
70	21	85	4	2026-07-31	\N	activo
71	21	86	5	2026-07-31	\N	activo
72	21	87	6	2026-07-31	\N	activo
73	21	88	7	2026-07-31	\N	activo
74	21	89	8	2026-07-31	\N	activo
75	21	90	9	2026-07-31	\N	activo
76	21	91	10	2026-07-31	\N	activo
77	21	92	11	2026-07-31	\N	activo
78	22	93	1	2026-07-31	\N	activo
79	22	94	2	2026-07-31	\N	activo
80	22	95	3	2026-07-31	\N	activo
81	22	96	4	2026-07-31	\N	activo
82	22	97	5	2026-07-31	\N	activo
83	22	98	6	2026-07-31	\N	activo
84	22	99	7	2026-07-31	\N	activo
85	22	100	8	2026-07-31	\N	activo
86	22	101	9	2026-07-31	\N	activo
87	22	102	10	2026-07-31	\N	activo
88	22	103	11	2026-07-31	\N	activo
\.
COPY public.equipos (id, entrenador_id, categoria_id, nombre, escudo_url, limite_jugadores, creado_en) FROM stdin;
15	28	1	UPQ	/uploads/equipos/UPQ.png	20	2026-07-31 07:27:58.059913+00
16	29	\N	UAQ	/uploads/equipos/UAQ.png	20	2026-07-31 15:54:03.937411+00
17	30	\N	ITQ	/uploads/equipos/ITQ.png	20	2026-07-31 15:54:03.937411+00
18	31	\N	UTEQ	/uploads/equipos/UTEQ.png	20	2026-07-31 15:54:03.937411+00
19	32	\N	UNAQ	/uploads/equipos/UNAQ.png	20	2026-07-31 15:54:03.937411+00
20	33	\N	An├栀甀愀挀ऀ⼀甀瀀氀漀愀搀猀⼀攀焀甀椀瀀漀猀⼀䄀一䄀䠀唀䄀䌀⸀瀀渀最ऀ㈀　ऀ㈀　㈀㘀ⴀ　㜀ⴀ㌀㄀ ㄀㔀㨀㔀㐀㨀　㌀⸀㤀㌀㜀㐀㄀㄀⬀　　 
21	34	\N	UVM	/uploads/equipos/UVM.png	20	2026-07-31 15:54:03.937411+00
22	35	\N	Tecmilenio	/uploads/equipos/TECMILENIO.png	20	2026-07-31 15:54:03.937411+00
\.
COPY public.eventos_partido (id, partido_id, equipo_id, jugador_id, jugador_entra_id, tipo_evento, minuto, detalle, creado_en) FROM stdin;
24	89	18	54	\N	Gol	2	\N	2026-08-02 02:24:44.385486+00
\.
COPY public.horarios_cancha (id, cancha_id, dia_semana, hora_inicio, hora_fin) FROM stdin;
\.
COPY public.jugadores (usuario_id, categoria_id, dorsal_preferido, posicion, especialidad) FROM stdin;
36	\N	\N	Medio	Pase
41	\N	\N	Medio	Pase
46	\N	\N	Medio	Pase
49	\N	\N	Medio	Pase
50	\N	\N	Medio	Pase
53	\N	\N	Medio	Pase
57	\N	\N	Medio	Pase
58	\N	\N	Medio	Pase
64	\N	\N	Medio	Pase
67	\N	\N	Medio	Pase
72	\N	\N	Medio	Pase
74	\N	\N	Medio	Pase
76	\N	\N	Medio	Pase
79	\N	\N	Medio	Pase
85	\N	\N	Medio	Pase
86	\N	\N	Medio	Pase
89	\N	\N	Medio	Pase
92	\N	\N	Medio	Pase
93	\N	\N	Medio	Pase
99	\N	\N	Medio	Pase
101	\N	\N	Medio	Pase
102	\N	\N	Medio	Pase
8	\N	\N	Defensa	\N
9	\N	\N	Delantero	\N
10	\N	\N	Medio	\N
11	\N	\N	Defensa	\N
12	\N	\N	Portero	\N
13	\N	\N	Medio	\N
14	\N	\N	Medio	\N
15	\N	\N	Defensa	\N
16	\N	\N	Defensa	\N
17	\N	\N	Defensa	\N
18	\N	\N	Medio	\N
19	\N	\N	Medio	\N
20	\N	\N	Medio	\N
21	\N	\N	Medio	\N
22	\N	\N	Delantero	\N
23	\N	\N	Medio	\N
24	\N	\N	Defensa	\N
25	\N	\N	Portero	\N
26	\N	\N	Delantero	\N
27	\N	\N	Defensa	\N
37	\N	\N	Delantero	Pase
38	\N	\N	Defensa	Pase
39	\N	\N	Delantero	Pase
40	\N	\N	Delantero	Pase
42	\N	\N	Delantero	Pase
43	\N	\N	Portero	Pase
44	\N	\N	Defensa	Pase
45	\N	\N	Defensa	Pase
47	\N	\N	Delantero	Pase
48	\N	\N	Defensa	Pase
51	\N	\N	Portero	Pase
52	\N	\N	Defensa	Pase
54	\N	\N	Defensa	Pase
55	\N	\N	Delantero	Pase
56	\N	\N	Delantero	Pase
59	\N	\N	Delantero	Pase
60	\N	\N	Delantero	Pase
61	\N	\N	Defensa	Pase
62	\N	\N	Defensa	Pase
63	\N	\N	Portero	Pase
65	\N	\N	Delantero	Pase
66	\N	\N	Delantero	Pase
68	\N	\N	Defensa	Pase
69	\N	\N	Delantero	Pase
70	\N	\N	Delantero	Pase
71	\N	\N	Delantero	Pase
73	\N	\N	Delantero	Pase
75	\N	\N	Delantero	Pase
77	\N	\N	Delantero	Pase
78	\N	\N	Delantero	Pase
80	\N	\N	Defensa	Pase
81	\N	\N	Portero	Pase
82	\N	\N	Defensa	Pase
83	\N	\N	Defensa	Pase
84	\N	\N	Defensa	Pase
87	\N	\N	Defensa	Pase
88	\N	\N	Delantero	Pase
90	\N	\N	Portero	Pase
91	\N	\N	Delantero	Pase
94	\N	\N	Delantero	Pase
95	\N	\N	Defensa	Pase
96	\N	\N	Defensa	Pase
97	\N	\N	Defensa	Pase
98	\N	\N	Delantero	Pase
100	\N	\N	Delantero	Pase
103	\N	\N	Portero	Pase
\.
COPY public.pagos_arbitraje (id, partido_id, arbitro_id, monto, metodo, estado, pagado_en) FROM stdin;
1	88	5	250.00	Tarjeta	pagado	2026-07-31 20:14:53.289122+00
\.
COPY public.pagos_inscripcion (id, torneo_id, equipo_id, monto, metodo, estado, pagado_en) FROM stdin;
\.
COPY public.partidos (id, torneo_id, equipo_local_id, equipo_visita_id, arbitro_id, cancha_id, fecha_hora, estado, estado_arbitro, goles_local, goles_visita, minutos_extra, motivo_cancelacion, creado_en) FROM stdin;
92	7	\N	\N	2	\N	2026-08-13 14:15:00+00	finalizado	pendiente	0	0	0	\N	2026-07-31 19:36:22.691552+00
93	7	\N	\N	2	\N	2026-08-09 19:30:00+00	finalizado	pendiente	0	0	0	\N	2026-07-31 19:36:22.691552+00
89	7	17	18	4	\N	2026-08-21 18:15:00+00	finalizado	pendiente	0	1	0	\N	2026-07-31 19:36:22.691552+00
88	7	15	16	4	\N	2026-08-23 16:45:00+00	programado	pendiente	0	0	0	\N	2026-07-31 19:36:22.691552+00
90	7	19	20	6	\N	2026-08-15 11:00:00+00	programado	pendiente	0	0	0	\N	2026-07-31 19:36:22.691552+00
91	7	21	22	5	\N	2026-08-19 12:45:00+00	programado	pendiente	0	0	0	\N	2026-07-31 19:36:22.691552+00
94	7	\N	\N	2	\N	2026-08-18 11:45:00+00	programado	pendiente	0	0	0	\N	2026-07-31 19:36:22.691552+00
\.
COPY public.postulaciones_arbitro (id, arbitro_id, torneo_id, equipo_id, estado, fecha_postulacion) FROM stdin;
1	2	7	\N	aceptado	2026-07-31 17:54:50.107165+00
2	3	7	\N	aceptado	2026-07-31 17:54:50.107165+00
3	4	7	\N	aceptado	2026-07-31 17:54:50.107165+00
4	5	7	\N	aceptado	2026-07-31 17:54:50.107165+00
5	6	7	\N	aceptado	2026-07-31 17:54:50.107165+00
6	7	7	\N	aceptado	2026-07-31 17:54:50.107165+00
\.
COPY public.roles (id, nombre, descripcion) FROM stdin;
1	admin	Administrador
2	arbitro	├爀戀椀琀爀漀 
3	jugador	Jugador
4	entrenador	Entrenador
\.
COPY public.sanciones (id, jugador_id, equipo_id, partido_id, tipo, motivo, partidos_suspension, fecha_inicio, fecha_fin, estado, creado_en) FROM stdin;
\.
COPY public.sedes (id, admin_id, nombre, direccion, activa, creado_en, telefono, ciudad, cantidad_canchas, horario_apertura, horario_cierre, foto_url, amenidades) FROM stdin;
3	1	Prueba foto	Instituto Nacional Indigenista 127	t	2026-08-02 20:16:22.955067+00	4427102581	SANTIAGO DE QUERETARO	1	14:16:00	14:16:00	\N	Ejemplo
4	1	Miguel Mart├渀攀稀ऀ䤀渀猀琀椀琀甀琀漀 一愀挀椀漀渀愀氀 䤀渀搀椀最攀渀椀猀琀愀 ㄀㈀㜀ऀ琀ऀ㈀　㈀㘀ⴀ　㠀ⴀ　㈀ ㈀　㨀㌀㄀㨀　㈀⸀㐀　㜀㤀㄀⬀　　ऀ㐀㐀㈀　　　　　　　ऀ匀䄀一吀䤀䄀䜀伀 䐀䔀 儀唀䔀刀䔀吀䄀刀伀ऀ㄀ऀ㄀㐀㨀㌀　㨀　　ऀ㄀㐀㨀㌀　㨀　　ऀ尀一ऀ栀漀氀愀 
5	1	Juan Perez	Instituto Nacional Indigenista 127	t	2026-08-02 20:33:57.717645+00	00000000	SANTIAGO DE QUERETARO	1	14:33:00	14:33:00	\N	prueba ultima
6	1	CURL_TEST	Instituto Nacional Indigenista 127	t	2026-08-02 20:54:34.146548+00	4421943964	SANTIAGO DE QUERETARO	1	14:59:00	14:59:00	/uploads/7019987b-7d62-41f4-a247-2e046990f802.jpg	test
8	1	Miguel Mart├渀攀稀ऀ䤀渀猀琀椀琀甀琀漀 一愀挀椀漀渀愀氀 䤀渀搀椀最攀渀椀猀琀愀 ㄀㈀㜀ऀ琀ऀ㈀　㈀㘀ⴀ　㠀ⴀ　㈀ ㈀㄀㨀㄀㘀㨀　㔀⸀㠀㠀㠀㄀㘀⬀　　ऀ㐀㐀㈀㄀㤀㐀㌀㤀㘀㐀ऀ匀䄀一吀䤀䄀䜀伀 䐀䔀 儀唀䔀刀䔀吀䄀刀伀ऀ㄀ऀ㈀㌀㨀㔀㤀㨀　　ऀ　㄀㨀㔀㤀㨀　　ऀ⼀甀瀀氀漀愀搀猀⼀戀攀挀㠀㌀昀愀㠀ⴀ㘀㠀㔀㔀ⴀ㐀昀挀㤀ⴀ戀㤀攀愀ⴀ攀搀昀挀㤀㄀搀　㔀昀戀　⸀樀瀀最ऀ䠀漀氀愀愀愀愀愀愀愀愀愀愀愀 
7	1	Flask Proxy Test	Desde Admin Web	t	2026-08-02 21:04:11.516772+00	5559876543	Queretaro	1	09:00:00	18:00:00	/uploads/bf347c54-279c-43bc-a3b7-78dc12799567.jpg	Test
1	1	DOOM	Instituto Nacional Indigenista 127	t	2026-07-30 20:59:04.495973+00	4421943964	SANTIAGO DE QUERETARO	1	08:00:00	22:00:00	\N	Ba├漥猀 
2	1	Sede Test Full	Direccion 123	t	2026-07-30 21:12:33.739382+00	5551234567	CDMX	4	10:00:00	20:00:00	\N	Wifi, estacionamiento
\.
COPY public.solicitudes_equipo (id, jugador_id, equipo_id, estado, fecha_solicitud, fecha_respuesta) FROM stdin;
1	8	15	aceptado	2026-07-31 07:34:12.077452+00	\N
\.
COPY public.tabla_posiciones (id, torneo_id, equipo_id, partidos_jugados, ganados, empatados, perdidos, goles_favor, goles_contra, puntos, actualizado_en) FROM stdin;
\.
COPY public.torneo_equipos (id, torneo_id, equipo_id, fecha_inscripcion, estado, grupo) FROM stdin;
1	7	15	2026-07-31 15:39:56.424242+00	aceptado	\N
2	7	16	2026-07-31 15:55:50.268632+00	aceptado	\N
3	7	17	2026-07-31 15:56:31.127503+00	aceptado	\N
4	7	18	2026-07-31 15:57:07.993573+00	aceptado	\N
5	7	19	2026-07-31 15:57:30.834757+00	aceptado	\N
6	7	20	2026-07-31 16:02:52.926421+00	aceptado	\N
7	7	21	2026-07-31 16:03:19.871391+00	aceptado	\N
8	7	22	2026-07-31 16:03:58.319794+00	aceptado	\N
\.
COPY public.torneos (id, sede_id, admin_id, categoria_id, nombre, cupo_equipos, estado, fecha_inicio, fecha_fin, creado_en, formato, costo_inscripcion, reglamento_url) FROM stdin;
7	1	1	1	Prueba 1	8	planeado	2026-08-01	2026-08-31	2026-07-31 15:17:46.808842+00	liga	100.00	/uploads/reglamentos/64de9580-ba7f-459c-9b1f-9933c757a3d2.jpg
\.
COPY public.usuarios (id, rol_id, nombre, correo, contrasena_hash, telefono, foto_url, activo, creado_en, actualizado_en) FROM stdin;
1	1	Admin	admin@ligapro.com	$2b$12$/3yQ0Yz.lMRWJIcKUX3iKuapSdNyX/H4vYZ8v4SfYLm4G10uS094q	1234567890	\N	t	2026-07-30 20:54:38.785709+00	2026-07-30 20:54:38.785709+00
2	2	arbitro1	arbitro1@ejemplo.com	$2b$12$xxjEv/iXIPQa2TrTFRQ/tutZjWcEsSouDcLlSN5rKtvycdblIz5fC	5550000001	assets/fotogato.png	t	2026-07-31 06:38:27.739649+00	2026-07-31 06:38:27.739649+00
3	2	arbitro2	arbitro2@ejemplo.com	$2b$12$IbBGR9PlQqyc8.qdgs4Xq.mps8xYslPps9Xu.t0GCH3lyfwDmgk5C	5550000002	assets/fotogato.png	t	2026-07-31 06:38:28.180007+00	2026-07-31 06:38:28.180007+00
4	2	arbitro3	arbitro3@ejemplo.com	$2b$12$S.lcrK7G3vrcCpTEW3JVIOfOtIoopcZcy2x9YGZtUPcSCr3ZeJvYC	5550000003	assets/fotogato.png	t	2026-07-31 06:38:28.38807+00	2026-07-31 06:38:28.38807+00
5	2	arbitro4	arbitro4@ejemplo.com	$2b$12$YmL1MlV1XFT9Fq.oVbvxP.7rAthdHfB.QFdyJyTKVMM/X3xjMYSHG	5550000004	assets/fotogato.png	t	2026-07-31 06:38:28.605309+00	2026-07-31 06:38:28.605309+00
6	2	arbitro5	arbitro5@ejemplo.com	$2b$12$UFcTY4XCs/IqLYNzAdAmcuehUN5XD7e0TeckWXUClu1j6xYZ6A6Zu	5550000005	assets/fotogato.png	t	2026-07-31 06:38:28.814419+00	2026-07-31 06:38:28.814419+00
7	2	arbitro6	arbitro6@ejemplo.com	$2b$12$uDqyn0aX2kch5Y4UfXThAuKDuQM66zYfeguYbPY624YdgkjCZuxaa	5550000006	assets/fotogato.png	t	2026-07-31 06:38:29.033515+00	2026-07-31 06:38:29.033515+00
28	4	entrenador1	entrenador1@ejemplo.com	$2b$12$SDoJlBuRR31sJ8fYWzdA9eoM6nCJmHqw.49naAxBeMcqdVfKPtcXa	5550000001	assets/fotogato.png	t	2026-07-31 06:38:33.71572+00	2026-07-31 06:38:33.71572+00
29	4	entrenador2	entrenador2@ejemplo.com	$2b$12$NEhtZlitHBZSCacBSVaYMuweOPAnvZ4/Qus.3tnH2MozjrZyc1CWC	5550000002	assets/fotogato.png	t	2026-07-31 06:38:33.99902+00	2026-07-31 06:38:33.99902+00
30	4	entrenador3	entrenador3@ejemplo.com	$2b$12$NfuW3qK3poPY8TC2rVYYs.5zBhvhgr/C2ac4JWkdKwQ4rVPN5WCtW	5550000003	assets/fotogato.png	t	2026-07-31 06:38:34.219772+00	2026-07-31 06:38:34.219772+00
31	4	entrenador4	entrenador4@ejemplo.com	$2b$12$sRw0EeU7tw9jJHUO6Nn2pumeGK6p7ulORI.Lyj1fpEf/6QMOJxxAa	5550000004	assets/fotogato.png	t	2026-07-31 06:38:34.437486+00	2026-07-31 06:38:34.437486+00
32	4	entrenador5	entrenador5@ejemplo.com	$2b$12$YDTEakZHUgqiO7yqt4DoYOTGtAxg8UgdvtNW88GLiwbGZBwXtc16i	5550000005	assets/fotogato.png	t	2026-07-31 06:38:34.64951+00	2026-07-31 06:38:34.64951+00
8	3	jugador1	jugador1@ejemplo.com	$2b$12$BXG.7UCXKAtgC3C3XVR9DuBHJXKXyLcw6QqnZGbwUWhMloeLksSLm	4421092384	assets/fotogato.png	t	2026-07-31 06:38:29.251042+00	2026-07-31 06:38:29.251042+00
9	3	jugador2	jugador2@ejemplo.com	$2b$12$dPLzQP2XAIKf7fotT8/NkeY/1WDVCvHHJCV.ETO4yUTN4CRP.5hFe	4425921048	assets/fotogato.png	t	2026-07-31 06:38:29.468337+00	2026-07-31 06:38:29.468337+00
10	3	jugador3	jugador3@ejemplo.com	$2b$12$o727JdT7KdlptsX0CTdqxu7TKUtWZuBXpYRCdMYRYugkuLNhYXPOC	4428495012	assets/fotogato.png	t	2026-07-31 06:38:29.689812+00	2026-07-31 06:38:29.689812+00
33	4	Entrenador Extra 1	entrenador6@ejemplo.com	$2b$12$Wk3qHuWvP753HTqfoyFMgeCSRmboWNfMZF1MQGr5E8I.r6bYXVhSu	1234567890	\N	t	2026-07-31 15:53:47.937669+00	2026-07-31 16:01:26.347105+00
34	4	Entrenador Extra 2	entrenador7@ejemplo.com	$2b$12$Wk3qHuWvP753HTqfoyFMgeCSRmboWNfMZF1MQGr5E8I.r6bYXVhSu	1234567890	\N	t	2026-07-31 15:53:47.937669+00	2026-07-31 16:01:26.347105+00
35	4	Entrenador Extra 3	entrenador8@ejemplo.com	$2b$12$Wk3qHuWvP753HTqfoyFMgeCSRmboWNfMZF1MQGr5E8I.r6bYXVhSu	1234567890	\N	t	2026-07-31 15:53:47.937669+00	2026-07-31 16:01:26.347105+00
11	3	jugador4	jugador4@ejemplo.com	$2b$12$PHDXvsqpnwtkxrKIP09LkuyNrgAoT5QhKkcQKUw5tnNy7MElQqCx2	4423918472	assets/fotogato.png	t	2026-07-31 06:38:29.907631+00	2026-07-31 06:38:29.907631+00
12	3	jugador5	jugador5@ejemplo.com	$2b$12$jhPh0XCr7lwXjVJ2jpIFEO10BakaO/09Y416qhJyYm3glisjSXrL.	4427502938	assets/fotogato.png	t	2026-07-31 06:38:30.119036+00	2026-07-31 06:38:30.119036+00
13	3	jugador6	jugador6@ejemplo.com	$2b$12$jWY/8A/Vkzwgh48VpfVSb.olqIAchC.j1PEcAiaabPkyty/20CHwS	4429183746	assets/fotogato.png	t	2026-07-31 06:38:30.336142+00	2026-07-31 06:38:30.336142+00
14	3	jugador7	jugador7@ejemplo.com	$2b$12$dSWkSPkm7g7ehxEmsm6QuuDjYDIbL3pwSg/OI2307k2R7lUU0zKd.	4422049581	assets/fotogato.png	t	2026-07-31 06:38:30.558572+00	2026-07-31 06:38:30.558572+00
15	3	jugador8	jugador8@ejemplo.com	$2b$12$UEohSVjD6OFft6qRkIyBjOkBdBbUJe3J.FQ8CoAPKdUpYjTAeh9Oy	4426371928	assets/fotogato.png	t	2026-07-31 06:38:30.778081+00	2026-07-31 06:38:30.778081+00
16	3	jugador9	jugador9@ejemplo.com	$2b$12$0c1PXBI5cc8SsIwlWZK0zuQr5XycQZKUKL4rbfniJlJY08BKgTk9m	4428153049	assets/fotogato.png	t	2026-07-31 06:38:30.999163+00	2026-07-31 06:38:30.999163+00
17	3	jugador10	jugador10@ejemplo.com	$2b$12$9dEk.WpS5gKTkog8WM2TROjo.KRpWzONxEwPLLE96EDoU1PtunWvS	4424728593	assets/fotogato.png	t	2026-07-31 06:38:31.216877+00	2026-07-31 06:38:31.216877+00
18	3	jugador11	jugador11@ejemplo.com	$2b$12$fvd9gIvFVKgN22oInXx0Oedt7bANMwHxfssq17VPJyz5s2cdzTwOG	4425381049	assets/fotogato.png	t	2026-07-31 06:38:31.466654+00	2026-07-31 06:38:31.466654+00
19	3	jugador12	jugador12@ejemplo.com	$2b$12$S4HWL05wGLqt5b9gMl002eKTLjruVfRVZyd1H4F2dkQYzDtjHiEp.	4422915837	assets/fotogato.png	t	2026-07-31 06:38:31.708132+00	2026-07-31 06:38:31.708132+00
20	3	jugador13	jugador13@ejemplo.com	$2b$12$64AMm2Hzl2nU.2Q7ysfmMe0eABXvmWl.wW60VMdb73PCXlQcq6Y5K	4427482019	assets/fotogato.png	t	2026-07-31 06:38:31.92803+00	2026-07-31 06:38:31.92803+00
21	3	jugador14	jugador14@ejemplo.com	$2b$12$Fw/TEKepGz3YY8aRDBSI/u9eFFWFtNRsWdCDFUqyyZEh8Aad0091W	4426103948	assets/fotogato.png	t	2026-07-31 06:38:32.150167+00	2026-07-31 06:38:32.150167+00
22	3	jugador15	jugador15@ejemplo.com	$2b$12$5w97sME/dPBnESPflI2RxujiQW6mKoZ6ze.Xdnum22Uv3eza5ipeC	4428395102	assets/fotogato.png	t	2026-07-31 06:38:32.371985+00	2026-07-31 06:38:32.371985+00
23	3	jugador16	jugador16@ejemplo.com	$2b$12$33HcVZ.rYJDqX.LRsqxedOnGrbhIzRaYuOBGQm5AH22i8NcxQvMr2	4421549283	assets/fotogato.png	t	2026-07-31 06:38:32.588928+00	2026-07-31 06:38:32.588928+00
24	3	jugador17	jugador17@ejemplo.com	$2b$12$hyVYk2aTUZIR600ECfFEwu7Glvew1aGLcnUD0ACRmo0r3JIqsD9jm	4429274810	assets/fotogato.png	t	2026-07-31 06:38:32.806579+00	2026-07-31 06:38:32.806579+00
25	3	jugador18	jugador18@ejemplo.com	$2b$12$4X7KdZtQIHt2oSSKUNCCceQTJd2J24X/li9DZ9.9XN21c4V82MTsC	4423851029	assets/fotogato.png	t	2026-07-31 06:38:33.028386+00	2026-07-31 06:38:33.028386+00
26	3	jugador19	jugador19@ejemplo.com	$2b$12$C2TXq9GCoMWzx6dmlbVnguey6ZC/lHmbjUG7ZlFsbwLI9MIn45sx2	4424092837	assets/fotogato.png	t	2026-07-31 06:38:33.245221+00	2026-07-31 06:38:33.245221+00
27	3	jugador20	jugador20@ejemplo.com	$2b$12$on0AkMrGmf9p/3pDiCW8ZebIPqAjOZs6jAJpYGxs0b6wtBU2MqOp.	4426718392	assets/fotogato.png	t	2026-07-31 06:38:33.469474+00	2026-07-31 06:38:33.469474+00
36	3	Jugador Extra 1	jugador_extra_1@test.com	$2b$12$GQBnbgbJqLcXbtEV4NafsexurqzWNpCu32bPCLopFq2XdouIc1Xpe	4428204913	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
37	3	Jugador Extra 2	jugador_extra_2@test.com	$2b$12$dWkN9PxjFxV8is4fy99eyOmIIOUpFT9Qoy5dSWm8k6J2PvV5P8BY6	4425931827	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
38	3	Jugador Extra 3	jugador_extra_3@test.com	$2b$12$ZInPOKJdWD.pnhDjxEsmAOGiP9eFKJriLz18r/yEpov6nReYTZWDW	4421847592	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
39	3	Jugador Extra 4	jugador_extra_4@test.com	$2b$12$8LMhe67fO0RCSWL35qfn1.O82RnlSoE8vDHoqL4burkn.Hm8uN6KG	4427392048	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
40	3	Jugador Extra 5	jugador_extra_5@test.com	$2b$12$AygpWuGQo05Jc8cW0H2TE.NEEUD9U5CkdO/BCKq.tl1VKDuq5NjXe	4424158293	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
41	3	Jugador Extra 6	jugador_extra_6@test.com	$2b$12$717EZ3e.NBf6lf.57Z39XetKFXQppOADxnDPhfZZ/.ax6eOzqexvu	4426029381	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
42	3	Jugador Extra 7	jugador_extra_7@test.com	$2b$12$UfiHFZjcXI7W6p/3tG95He.6qQbE0joPJOTRxRrVKoPTuvYzYivzu	4423781940	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
43	3	Jugador Extra 8	jugador_extra_8@test.com	$2b$12$AxbzlHqB8PvpBF3wqIFqDu6OEPLAQoKS0eEllipOcVTvPaB/HQF7a	4429415028	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
44	3	Jugador Extra 9	jugador_extra_9@test.com	$2b$12$QkPrKnOm3kfPtIN.PM3cLeMeDap0fOXmrmQx8L8UOkJMDpsabLoy2	4422563819	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
45	3	Jugador Extra 10	jugador_extra_10@test.com	$2b$12$iaUK77aZ5CklJAbqIX5fieM5HVwrAvPOM.e1oj05jXlXBVj3f3qPO	4428934750	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
46	3	Jugador Extra 11	jugador_extra_11@test.com	$2b$12$gfCDts2vNQY0nnZoW1YuKeNAuwbZpEq31t5jtFnDBJ7gTmwqQ2KVq	4421058294	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
47	3	Jugador Extra 12	jugador_extra_12@test.com	$2b$12$MmGPLrUzQOTL8opPBczPJ.7Pejq.9iCyFEU/4wcFeMcYz5Y6hG/Ra	4426829103	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
48	3	Jugador Extra 13	jugador_extra_13@test.com	$2b$12$/sS5BHezG8mE2F9G9WwsYOzcBRYUZXeF7CpLv16DncHpZpk0KnkES	4424395718	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
49	3	Jugador Extra 14	jugador_extra_14@test.com	$2b$12$0u89uy33/K/oegMvO2K.zuP9WQAwVEmHwPgjZTrOqGgtFh.zBlTW.	4427183920	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
50	3	Jugador Extra 15	jugador_extra_15@test.com	$2b$12$3/AkUdhvL/ni/Hf3uYCqhOqdIcdzg.C/SQvK4nNMDm15iWuE5LlmS	4425901842	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
51	3	Jugador Extra 16	jugador_extra_16@test.com	$2b$12$/1g/lxnhsfAatADwiZYfg.tB0z9ZSxnUecdD1o1e5PAIryekdOFSG	4422479501	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
52	3	Jugador Extra 17	jugador_extra_17@test.com	$2b$12$G9nPQ06wwssch6y8nOb4ye2mUFgZNxGcbEfMb938PsNj1BGHfUr7G	4428362019	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
53	3	Jugador Extra 18	jugador_extra_18@test.com	$2b$12$wrj9xL7mjE2Q3AhgyFinX.evy7m2XB/r3Y90vHukKYLLviwR5HSmq	4429514837	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
54	3	Jugador Extra 19	jugador_extra_19@test.com	$2b$12$C3uSSk1Cz/OkVx39pk/4E.pjPn9BQqzlESvpt7W8XoENqOIQc.IbW	4423047592	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
55	3	Jugador Extra 20	jugador_extra_20@test.com	$2b$12$pF1R4ftz32qaAFf8RLHiG.ncnjn.mq7AHQ//eWhrLPYBwLg6Bg67W	4426291840	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
56	3	Jugador Extra 21	jugador_extra_21@test.com	$2b$12$JT4OwrkrYiqIjiB8ivO4POJCS68FKEnFaH/9itzlnHQ8XzdK4nQk2	4424185920	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
57	3	Jugador Extra 22	jugador_extra_22@test.com	$2b$12$D8BcVW2jZW8/YGY7VkE7/ujrAmx9YpJ/jtWyMQhQhm2mxF7hCsCcq	4428753019	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
58	3	Jugador Extra 23	jugador_extra_23@test.com	$2b$12$4bsaIvQzFibETnIi68QlcuXHtTLqnucrA1AGwzQ6AE3cd6IUaAt52	4421928475	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
59	3	Jugador Extra 24	jugador_extra_24@test.com	$2b$12$D6SEin27V9UuPra2b./foO8OO1FTViCG4WXURUeIVbjhQqMDADuY6	4425039182	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
60	3	Jugador Extra 25	jugador_extra_25@test.com	$2b$12$SCj3ez4zGcjJySlnGbcVsuP5ZUUuVgdBXYi8eWuOo1jLQX4JqJwb2	4427642093	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
61	3	Jugador Extra 26	jugador_extra_26@test.com	$2b$12$iTEEJTzFGqpjLmNU7KyUeufOw7DSABQO9/Xnw9AnGUHRS4AlfrOgi	4423815740	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
62	3	Jugador Extra 27	jugador_extra_27@test.com	$2b$12$1ZCxsQ/vE1t/ZxooxPVDSe6RlrspSy0keJggiLqAYwMGJtwHnUVCC	4429204815	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
63	3	Jugador Extra 28	jugador_extra_28@test.com	$2b$12$fWXvZAx1IEN8A3kAKNByMOwG5Cg4pXqOOSZHWT9OZ5kAeb1IrD8mW	4426571938	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
64	3	Jugador Extra 29	jugador_extra_29@test.com	$2b$12$WqNiVbFIATF4L4qZWYhJcuczRn7muDMSTERt3g5H8Lz92b/l6N2Ry	4422398501	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
65	3	Jugador Extra 30	jugador_extra_30@test.com	$2b$12$VwIRV4QUsnqcwaYHZrsyO.8tEGNKVcbNTWTK9xgpxl0EZY2okSvbe	4428143927	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
66	3	Jugador Extra 31	jugador_extra_31@test.com	$2b$12$5n9FRhppTrKQWCebDNw1heYc7QE8lo..lWAcNXsyjohdipo.XwenG	4425912840	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
67	3	Jugador Extra 32	jugador_extra_32@test.com	$2b$12$40XcnbEYJbX4yaQYkR7Jr.0aJ/Djx0qn0QD8oWwWfFrVyQfZZum9u	4427081932	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
68	3	Jugador Extra 33	jugador_extra_33@test.com	$2b$12$QeFEu/zWvBoFF2jCB18yQOOPlxcG.TFc8yoYpmC93aMqrgZkqe2vi	4423529481	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
69	3	Jugador Extra 34	jugador_extra_34@test.com	$2b$12$Suc45eqiz0RrY7ly4.IApenbJWjGUr6CbiJK6cD3GSN/9EPExBO7W	4421495720	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
70	3	Jugador Extra 35	jugador_extra_35@test.com	$2b$12$Ry3qG5G3HcNtR2RkmpR4jegM7auA5ijiCnvDBxziBClvPNcWWVSJK	4429368015	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
71	3	Jugador Extra 36	jugador_extra_36@test.com	$2b$12$sut.N/tKnDsgcIcITQBlHu94cJyno9F41RCqBI4kRZ1CQ5aeQ/SxG	4428251943	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
72	3	Jugador Extra 37	jugador_extra_37@test.com	$2b$12$rofa5MdeB1mqZpwIUyni.uVIk8BgnoY5amQhow5al4xl9HSYwPyjS	4424703829	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
73	3	Jugador Extra 38	jugador_extra_38@test.com	$2b$12$nZ137tV9W1vi78rmq5xidegcM7aCqDWdE1nIN6uILYF5YaVpiNz62	4426135092	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
74	3	Jugador Extra 39	jugador_extra_39@test.com	$2b$12$eN2uDgh.7ixaAGvfWAduW.qs9HW3V.40r/PO8uC3HNYJj8iCvRJr6	4422847150	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
75	3	Jugador Extra 40	jugador_extra_40@test.com	$2b$12$ED.ubaK2.QIfgAoQT8Rr8urwH7OOIaLXe0oQeBqXNEEwHR76WHhia	4425092831	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
76	3	Jugador Extra 41	jugador_extra_41@test.com	$2b$12$rBmJb9.kr4YYHR.3JIoQgegIFRfHXq3jxys2OodMiSIRJ.IyA3rH2	4429714058	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
77	3	Jugador Extra 42	jugador_extra_42@test.com	$2b$12$9EfoC9WQUAPsTZzpcsex2ut78GlnY0/uXlDH0hFiqIkWgfzFJNjMy	4423281904	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
78	3	Jugador Extra 43	jugador_extra_43@test.com	$2b$12$GJFNcN5fNggFDEEY5pQ5j.BXkeO.ysQToyYvZYI4SCx2g4piYTA.G	4428456172	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
79	3	Jugador Extra 44	jugador_extra_44@test.com	$2b$12$jpHxo1atNS4kO7LydGIaGuvAzZntPlqK/yJO.KeXdV8OcixeryPA.	4421639285	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
80	3	Jugador Extra 45	jugador_extra_45@test.com	$2b$12$OhajPqeNqWxQSRNdZqZS4.basN5eiSkTO.G.DiuSAVvz4Y6IPc/.2	4427903814	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
81	3	Jugador Extra 46	jugador_extra_46@test.com	$2b$12$NJDnNw3VrGd7UFsFkUnyuuzP5/4wv7pJo6VG9qRHU47NlGCc1jb/O	4425142097	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
82	3	Jugador Extra 47	jugador_extra_47@test.com	$2b$12$yLdgSDgdk.OYLFtqnfVY8.JvxS3Bd2wW1GFkxiAZJrBEx.IdMXg6W	4426825713	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
83	3	Jugador Extra 48	jugador_extra_48@test.com	$2b$12$BThYHuygM/vvjabncAPlp.nM838p8rS7TS72EO1NCe1JuN2KgQ3oC	4424398025	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
84	3	Jugador Extra 49	jugador_extra_49@test.com	$2b$12$k/LbhvT2tthDqxnCWDo/xe0En08pwnVEZ0jr1.5Gc3riCQwKpvRRy	4422071598	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
85	3	Jugador Extra 50	jugador_extra_50@test.com	$2b$12$0ztMjQh.oPUmpip11A.C0e8Ixt/W/jvR9JjMQw5qkvTfn38kr5rw.	4428563941	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
86	3	Jugador Extra 51	jugador_extra_51@test.com	$2b$12$SNv64tCTr4gUcJPERQPBReh/9rjDIdYp0/Z7vOVLLC0TxSQ8cA1Aq	4421948250	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
87	3	Jugador Extra 52	jugador_extra_52@test.com	$2b$12$n3x7q61PkMKuaZ9N5tvz/.LEZMscdf5CvjFZSUDnmK1tvKoFZxLBG	4423751094	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
88	3	Jugador Extra 53	jugador_extra_53@test.com	$2b$12$if6xTd0QQcaHxIastPBUNu7wxrjvFwPs0PFaQIKTisu9rAGWzdB4m	4429024816	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
89	3	Jugador Extra 54	jugador_extra_54@test.com	$2b$12$0N31Lp4U27qNxMcxmMRzUuwQVdyZHb3xC9Wi5T45g.CvBN3eJDj36	4425813927	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
90	3	Jugador Extra 55	jugador_extra_55@test.com	$2b$12$PYzwlF690iqYrivCAYKaBOBAlzt4JenV0zb/J3AM/LDj/fGZeT8VS	4427265049	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
91	3	Jugador Extra 56	jugador_extra_56@test.com	$2b$12$zY/a2PLEMVvPD/yEEcxnfuSMvUCToD8isStlGFUQ/X8.meamyOWA2	4426491830	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
92	3	Jugador Extra 57	jugador_extra_57@test.com	$2b$12$A4CnjSdhgYyznmqz8Uea5emDznYvLF/pOKEbMqgikNltikhntFmXS	4422185793	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
93	3	Jugador Extra 58	jugador_extra_58@test.com	$2b$12$6HSMJd2yMMyPgFKS77tBRetETk8oI8FsZyb07gQktvmiCtKhQPc2O	4428309412	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
94	3	Jugador Extra 59	jugador_extra_59@test.com	$2b$12$/Ql1fDHLas/EE9Qj3bF9juOwAa2ctA/1EsdhhchYgjwOi3JscbVXS	4424572068	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
95	3	Jugador Extra 60	jugador_extra_60@test.com	$2b$12$o9NZHu0gayONr0ss6bstweRydb2TJnSFR/aWQRttqM.Hmy6mdArjS	4421298354	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
96	3	Jugador Extra 61	jugador_extra_61@test.com	$2b$12$7./K7Evab7QqMM4pOEpMDuZm50n8a83oRsVsJuJE8vPJz2hHrk4BW	4427831940	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
97	3	Jugador Extra 62	jugador_extra_62@test.com	$2b$12$Qt.D/7qYJHFPXeiB8FGg5Owx8Xgq10OqMghw/5pERXruHmxJ0Tijy	4425068271	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
98	3	Jugador Extra 63	jugador_extra_63@test.com	$2b$12$EHHd.dYYeiYuZGVyY.oiT.ovWlNipVIrQbV09X6K.Due/Kl3FFBWm	4429413508	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
99	3	Jugador Extra 64	jugador_extra_64@test.com	$2b$12$kaB6G.7E7urU0xBB8ftG..9knmq979PTtYiG8bpbwMhEtapxf7nKG	4423187092	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
100	3	Jugador Extra 65	jugador_extra_65@test.com	$2b$12$H93isUu1NIutsxDBNfq/6.w885B131lJWLxYJETJks6pvS57k/xXC	4426924513	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
101	3	Jugador Extra 66	jugador_extra_66@test.com	$2b$12$Hrw.nUJWALgANvrWQuB8D.qX39ToOL2u1W70Y0xuYlCQevFtau5eu	4422758194	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
102	3	Jugador Extra 67	jugador_extra_67@test.com	$2b$12$I4dwr70sTZJC9ExOsuTaEOCZrgxVDBtBtWfa.8vgVYc1hkmm8afiK	4428503627	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
103	3	Jugador Extra 68	jugador_extra_68@test.com	$2b$12$z/kkH/ddIjMenwiAKSTRwONCo.rwBGehNZGwZULEa4eCt6teIfu9m	4424319085	\N	t	2026-07-31 15:53:48.60689+00	2026-07-31 15:53:48.60689+00
\.
SELECT pg_catalog.setval('public.alineacion_jugadores_id_seq', 1, false);
SELECT pg_catalog.setval('public.alineaciones_id_seq', 3, true);
SELECT pg_catalog.setval('public.canchas_id_seq', 1, false);
SELECT pg_catalog.setval('public.categorias_id_seq', 1, false);
SELECT pg_catalog.setval('public.equipo_jugadores_id_seq', 88, true);
SELECT pg_catalog.setval('public.equipos_id_seq', 22, true);
SELECT pg_catalog.setval('public.eventos_partido_id_seq', 24, true);
SELECT pg_catalog.setval('public.horarios_cancha_id_seq', 1, false);
SELECT pg_catalog.setval('public.pagos_arbitraje_id_seq', 1, true);
SELECT pg_catalog.setval('public.pagos_inscripcion_id_seq', 1, false);
SELECT pg_catalog.setval('public.partidos_id_seq', 94, true);
SELECT pg_catalog.setval('public.postulaciones_arbitro_id_seq', 6, true);
SELECT pg_catalog.setval('public.roles_id_seq', 7, true);
SELECT pg_catalog.setval('public.sanciones_id_seq', 1, false);
SELECT pg_catalog.setval('public.sedes_id_seq', 8, true);
SELECT pg_catalog.setval('public.solicitudes_equipo_id_seq', 1, true);
SELECT pg_catalog.setval('public.tabla_posiciones_id_seq', 1, false);
SELECT pg_catalog.setval('public.torneo_equipos_id_seq', 8, true);
SELECT pg_catalog.setval('public.torneos_id_seq', 8, true);
SELECT pg_catalog.setval('public.usuarios_id_seq', 103, true);
ALTER TABLE ONLY public.alineacion_jugadores
    ADD CONSTRAINT alineacion_jugadores_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.alineaciones
    ADD CONSTRAINT alineaciones_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.arbitros
    ADD CONSTRAINT arbitros_pkey PRIMARY KEY (usuario_id);
ALTER TABLE ONLY public.canchas
    ADD CONSTRAINT canchas_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_nombre_key UNIQUE (nombre);
ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (usuario_id);
ALTER TABLE ONLY public.equipo_jugadores
    ADD CONSTRAINT equipo_jugadores_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.eventos_partido
    ADD CONSTRAINT eventos_partido_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.horarios_cancha
    ADD CONSTRAINT horarios_cancha_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.jugadores
    ADD CONSTRAINT jugadores_pkey PRIMARY KEY (usuario_id);
ALTER TABLE ONLY public.pagos_arbitraje
    ADD CONSTRAINT pagos_arbitraje_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.pagos_inscripcion
    ADD CONSTRAINT pagos_inscripcion_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.postulaciones_arbitro
    ADD CONSTRAINT postulaciones_arbitro_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_nombre_key UNIQUE (nombre);
ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.sanciones
    ADD CONSTRAINT sanciones_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.solicitudes_equipo
    ADD CONSTRAINT solicitudes_equipo_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.tabla_posiciones
    ADD CONSTRAINT tabla_posiciones_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.torneo_equipos
    ADD CONSTRAINT torneo_equipos_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.torneos
    ADD CONSTRAINT torneos_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);
ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
CREATE INDEX ix_alineacion_jugadores_id ON public.alineacion_jugadores USING btree (id);
CREATE INDEX ix_alineaciones_id ON public.alineaciones USING btree (id);
CREATE INDEX ix_canchas_id ON public.canchas USING btree (id);
CREATE INDEX ix_categorias_id ON public.categorias USING btree (id);
CREATE INDEX ix_equipo_jugadores_id ON public.equipo_jugadores USING btree (id);
CREATE INDEX ix_equipos_id ON public.equipos USING btree (id);
CREATE INDEX ix_eventos_partido_id ON public.eventos_partido USING btree (id);
CREATE INDEX ix_horarios_cancha_id ON public.horarios_cancha USING btree (id);
CREATE INDEX ix_pagos_arbitraje_id ON public.pagos_arbitraje USING btree (id);
CREATE INDEX ix_pagos_inscripcion_id ON public.pagos_inscripcion USING btree (id);
CREATE INDEX ix_partidos_id ON public.partidos USING btree (id);
CREATE INDEX ix_postulaciones_arbitro_id ON public.postulaciones_arbitro USING btree (id);
CREATE INDEX ix_sanciones_id ON public.sanciones USING btree (id);
CREATE INDEX ix_sedes_id ON public.sedes USING btree (id);
CREATE INDEX ix_solicitudes_equipo_id ON public.solicitudes_equipo USING btree (id);
CREATE INDEX ix_tabla_posiciones_id ON public.tabla_posiciones USING btree (id);
CREATE INDEX ix_torneo_equipos_id ON public.torneo_equipos USING btree (id);
CREATE INDEX ix_torneos_id ON public.torneos USING btree (id);
CREATE INDEX ix_usuarios_id ON public.usuarios USING btree (id);
ALTER TABLE ONLY public.alineacion_jugadores
    ADD CONSTRAINT alineacion_jugadores_alineacion_id_fkey FOREIGN KEY (alineacion_id) REFERENCES public.alineaciones(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.alineacion_jugadores
    ADD CONSTRAINT alineacion_jugadores_jugador_id_fkey FOREIGN KEY (jugador_id) REFERENCES public.jugadores(usuario_id);
ALTER TABLE ONLY public.alineaciones
    ADD CONSTRAINT alineaciones_entrenador_id_fkey FOREIGN KEY (entrenador_id) REFERENCES public.entrenadores(usuario_id);
ALTER TABLE ONLY public.alineaciones
    ADD CONSTRAINT alineaciones_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES public.equipos(id);
ALTER TABLE ONLY public.alineaciones
    ADD CONSTRAINT alineaciones_partido_id_fkey FOREIGN KEY (partido_id) REFERENCES public.partidos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.arbitros
    ADD CONSTRAINT arbitros_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);
ALTER TABLE ONLY public.arbitros
    ADD CONSTRAINT arbitros_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.canchas
    ADD CONSTRAINT canchas_sede_id_fkey FOREIGN KEY (sede_id) REFERENCES public.sedes(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.equipo_jugadores
    ADD CONSTRAINT equipo_jugadores_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES public.equipos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.equipo_jugadores
    ADD CONSTRAINT equipo_jugadores_jugador_id_fkey FOREIGN KEY (jugador_id) REFERENCES public.jugadores(usuario_id);
ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);
ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_entrenador_id_fkey FOREIGN KEY (entrenador_id) REFERENCES public.entrenadores(usuario_id);
ALTER TABLE ONLY public.eventos_partido
    ADD CONSTRAINT eventos_partido_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES public.equipos(id);
ALTER TABLE ONLY public.eventos_partido
    ADD CONSTRAINT eventos_partido_jugador_entra_id_fkey FOREIGN KEY (jugador_entra_id) REFERENCES public.jugadores(usuario_id);
ALTER TABLE ONLY public.eventos_partido
    ADD CONSTRAINT eventos_partido_jugador_id_fkey FOREIGN KEY (jugador_id) REFERENCES public.jugadores(usuario_id);
ALTER TABLE ONLY public.eventos_partido
    ADD CONSTRAINT eventos_partido_partido_id_fkey FOREIGN KEY (partido_id) REFERENCES public.partidos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.horarios_cancha
    ADD CONSTRAINT horarios_cancha_cancha_id_fkey FOREIGN KEY (cancha_id) REFERENCES public.canchas(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.jugadores
    ADD CONSTRAINT jugadores_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);
ALTER TABLE ONLY public.jugadores
    ADD CONSTRAINT jugadores_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.pagos_arbitraje
    ADD CONSTRAINT pagos_arbitraje_arbitro_id_fkey FOREIGN KEY (arbitro_id) REFERENCES public.arbitros(usuario_id);
ALTER TABLE ONLY public.pagos_arbitraje
    ADD CONSTRAINT pagos_arbitraje_partido_id_fkey FOREIGN KEY (partido_id) REFERENCES public.partidos(id);
ALTER TABLE ONLY public.pagos_inscripcion
    ADD CONSTRAINT pagos_inscripcion_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES public.equipos(id);
ALTER TABLE ONLY public.pagos_inscripcion
    ADD CONSTRAINT pagos_inscripcion_torneo_id_fkey FOREIGN KEY (torneo_id) REFERENCES public.torneos(id);
ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_arbitro_id_fkey FOREIGN KEY (arbitro_id) REFERENCES public.arbitros(usuario_id);
ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_cancha_id_fkey FOREIGN KEY (cancha_id) REFERENCES public.canchas(id);
ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_equipo_local_id_fkey FOREIGN KEY (equipo_local_id) REFERENCES public.equipos(id);
ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_equipo_visita_id_fkey FOREIGN KEY (equipo_visita_id) REFERENCES public.equipos(id);
ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_torneo_id_fkey FOREIGN KEY (torneo_id) REFERENCES public.torneos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.postulaciones_arbitro
    ADD CONSTRAINT postulaciones_arbitro_arbitro_id_fkey FOREIGN KEY (arbitro_id) REFERENCES public.arbitros(usuario_id);
ALTER TABLE ONLY public.postulaciones_arbitro
    ADD CONSTRAINT postulaciones_arbitro_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES public.equipos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.postulaciones_arbitro
    ADD CONSTRAINT postulaciones_arbitro_torneo_id_fkey FOREIGN KEY (torneo_id) REFERENCES public.torneos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.sanciones
    ADD CONSTRAINT sanciones_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES public.equipos(id);
ALTER TABLE ONLY public.sanciones
    ADD CONSTRAINT sanciones_jugador_id_fkey FOREIGN KEY (jugador_id) REFERENCES public.jugadores(usuario_id);
ALTER TABLE ONLY public.sanciones
    ADD CONSTRAINT sanciones_partido_id_fkey FOREIGN KEY (partido_id) REFERENCES public.partidos(id);
ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.usuarios(id);
ALTER TABLE ONLY public.solicitudes_equipo
    ADD CONSTRAINT solicitudes_equipo_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES public.equipos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.solicitudes_equipo
    ADD CONSTRAINT solicitudes_equipo_jugador_id_fkey FOREIGN KEY (jugador_id) REFERENCES public.jugadores(usuario_id);
ALTER TABLE ONLY public.tabla_posiciones
    ADD CONSTRAINT tabla_posiciones_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES public.equipos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.tabla_posiciones
    ADD CONSTRAINT tabla_posiciones_torneo_id_fkey FOREIGN KEY (torneo_id) REFERENCES public.torneos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.torneo_equipos
    ADD CONSTRAINT torneo_equipos_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES public.equipos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.torneo_equipos
    ADD CONSTRAINT torneo_equipos_torneo_id_fkey FOREIGN KEY (torneo_id) REFERENCES public.torneos(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.torneos
    ADD CONSTRAINT torneos_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.usuarios(id);
ALTER TABLE ONLY public.torneos
    ADD CONSTRAINT torneos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);
ALTER TABLE ONLY public.torneos
    ADD CONSTRAINT torneos_sede_id_fkey FOREIGN KEY (sede_id) REFERENCES public.sedes(id);
ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id);