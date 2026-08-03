from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from sqlalchemy import func

from db.database import get_db
from models import models
from schemas import schemas
from auth.dependencies import get_current_admin
from datetime import datetime

router = APIRouter(prefix="/admin", tags=["Administrativos"])

@router.get("/dashboard")
def get_dashboard(db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    from datetime import timedelta, date
    from sqlalchemy import and_

    stats = {
        "sedes_activas": db.query(models.Sede).filter(models.Sede.activa == True).count(),
        "torneos_curso": db.query(models.Torneo).filter(models.Torneo.estado.in_(['planeado', 'en_curso'])).count(),
        "equipos_registrados": db.query(models.Equipo).count(),
        "partidos": db.query(models.Partido).count(),
    }

    # Próximos partidos (programados, ordenados por fecha)
    ahora = datetime.utcnow()
    proximos_raw = db.query(models.Partido).filter(
        models.Partido.fecha_hora >= ahora,
        models.Partido.estado == 'programado'
    ).order_by(models.Partido.fecha_hora).limit(5).all()

    proximos_partidos = []
    for p in proximos_raw:
        try:
            local = p.equipo_local.nombre if p.equipo_local else "?"
            visita = p.equipo_visita.nombre if p.equipo_visita else "?"
            torneo_nombre = p.torneo.nombre if p.torneo else "?"
            cancha = p.cancha.nombre if p.cancha else "?"
            proximos_partidos.append({
                "id": p.id,
                "local": local,
                "visita": visita,
                "torneo": torneo_nombre,
                "cancha": cancha,
                "fecha_hora": p.fecha_hora.isoformat(),
            })
        except Exception:
            continue

    # Torneos activos (en curso o planeados)
    torneos_raw = db.query(models.Torneo).filter(
        models.Torneo.estado.in_(['planeado', 'en_curso'])
    ).order_by(models.Torneo.fecha_inicio).limit(5).all()

    torneos_activos = []
    for t in torneos_raw:
        try:
            sede_nombre = t.sede.nombre if t.sede else "?"
            equipos_count = db.query(models.TorneoEquipo).filter(models.TorneoEquipo.torneo_id == t.id).count()
            torneos_activos.append({
                "id": t.id,
                "nombre": t.nombre,
                "sede": sede_nombre,
                "estado": t.estado,
                "fecha_inicio": t.fecha_inicio.isoformat() if t.fecha_inicio else None,
                "fecha_fin": t.fecha_fin.isoformat() if t.fecha_fin else None,
                "equipos": equipos_count,
                "reglamento_url": t.reglamento_url,
            })
        except Exception:
            continue

    # Gráfica de partidos por semana (últimas 8 semanas)
    grafica_partidos = []
    for i in range(7, -1, -1):
        semana_inicio = ahora.date() - timedelta(weeks=i)
        semana_fin = semana_inicio + timedelta(days=6)
        count = db.query(models.Partido).filter(
            models.Partido.fecha_hora >= datetime.combine(semana_inicio, datetime.min.time()),
            models.Partido.fecha_hora <= datetime.combine(semana_fin, datetime.max.time())
        ).count()
        grafica_partidos.append({
            "semana": semana_inicio.strftime("%d/%m"),
            "partidos": count
        })

    return {
        "stats": stats,
        "proximos_partidos": proximos_partidos,
        "torneos_activos": torneos_activos,
        "alertas": [],
        "grafica_partidos": grafica_partidos,
    }

@router.get("/sedes")
def get_sedes(db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    sedes = db.query(models.Sede).all()
    result = []
    for s in sedes:
        result.append({
            "id": s.id,
            "nombre": s.nombre,
            "direccion": s.direccion,
            "activa": s.activa,
            "ciudad": getattr(s, 'ciudad', None),
            "telefono": getattr(s, 'telefono', None),
            "cantidad_canchas": getattr(s, 'cantidad_canchas', len(s.canchas) if hasattr(s, 'canchas') else 1),
            "foto_url": getattr(s, 'foto_url', None),
            "horario_apertura": getattr(s, 'horario_apertura').isoformat() if getattr(s, 'horario_apertura', None) else None,
            "horario_cierre": getattr(s, 'horario_cierre').isoformat() if getattr(s, 'horario_cierre', None) else None,
            "amenidades": getattr(s, 'amenidades', None)
        })
    return result

from fastapi import Request
import os
import uuid
import shutil

@router.post("/sedes")
async def crear_sede(request: Request, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    form = await request.form()
    nueva_sede = models.Sede(
        admin_id=current_admin.id,
        nombre=form.get("nombre"),
        direccion=form.get("direccion", "Sin dirección"),
        ciudad=form.get("ciudad"),
        telefono=form.get("telefono"),
        cantidad_canchas=int(form.get("cantidad_canchas")) if form.get("cantidad_canchas") else 1,
        amenidades=form.get("amenidades"),
        activa=True
    )
    if form.get("horario_apertura"):
        try:
            nueva_sede.horario_apertura = datetime.strptime(form.get("horario_apertura"), "%H:%M").time()
        except Exception: pass
    if form.get("horario_cierre"):
        try:
            nueva_sede.horario_cierre = datetime.strptime(form.get("horario_cierre"), "%H:%M").time()
        except Exception: pass
        
    foto = form.get("foto")
    if foto and getattr(foto, "filename", None):
        file_ext = foto.filename.split('.')[-1]
        file_name = f"{uuid.uuid4()}.{file_ext}"
        os.makedirs("uploads", exist_ok=True)
        file_path = os.path.join("uploads", file_name)
        with open(file_path, "wb") as buffer:
            buffer.write(await foto.read())
        nueva_sede.foto_url = f"/uploads/{file_name}"

    db.add(nueva_sede)
    db.commit()
    db.refresh(nueva_sede)
    return {"message": "Sede creada", "id": nueva_sede.id}

@router.put("/sedes/{sede_id}")
async def actualizar_sede(sede_id: int, request: Request, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    sede = db.query(models.Sede).filter(models.Sede.id == sede_id).first()
    if not sede:
        raise HTTPException(status_code=404, detail="Sede no encontrada")
    
    form = await request.form()
    if form.get("nombre"): sede.nombre = form.get("nombre")
    if form.get("direccion"): sede.direccion = form.get("direccion")
    if form.get("ciudad"): sede.ciudad = form.get("ciudad")
    if form.get("telefono"): sede.telefono = form.get("telefono")
    if form.get("cantidad_canchas"): sede.cantidad_canchas = int(form.get("cantidad_canchas"))
    if form.get("amenidades"): sede.amenidades = form.get("amenidades")
    
    if form.get("horario_apertura"):
        try:
            sede.horario_apertura = datetime.strptime(form.get("horario_apertura"), "%H:%M").time()
        except Exception: pass
    if form.get("horario_cierre"):
        try:
            sede.horario_cierre = datetime.strptime(form.get("horario_cierre"), "%H:%M").time()
        except Exception: pass
        
    foto = form.get("foto")
    if foto and getattr(foto, "filename", None):
        file_ext = foto.filename.split('.')[-1]
        file_name = f"{uuid.uuid4()}.{file_ext}"
        os.makedirs("uploads", exist_ok=True)
        file_path = os.path.join("uploads", file_name)
        with open(file_path, "wb") as buffer:
            buffer.write(await foto.read())
        sede.foto_url = f"/uploads/{file_name}"
            
    db.commit()
    return {"message": "Sede actualizada exitosamente"}

@router.delete("/sedes/{sede_id}")
def eliminar_sede(sede_id: int, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    sede = db.query(models.Sede).filter(models.Sede.id == sede_id).first()
    if not sede:
        raise HTTPException(status_code=404, detail="Sede no encontrada")
    
    db.delete(sede)
    db.commit()
    return {"message": "Sede eliminada exitosamente"}

@router.put("/sedes/{sede_id}/toggle")
def toggle_sede(sede_id: int, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    sede = db.query(models.Sede).filter(models.Sede.id == sede_id).first()
    if not sede:
        raise HTTPException(status_code=404, detail="Sede no encontrada")
    
    sede.activa = not sede.activa
    db.commit()
    return {"message": "Estado de la sede actualizado", "activa": sede.activa}

@router.get("/torneos")
def get_torneos(db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    torneos = db.query(models.Torneo).all()
    result = []
    for t in torneos:
        result.append({
            "id": t.id,
            "nombre": t.nombre,
            "sede_id": t.sede_id,
            "categoria_id": t.categoria_id,
            "cupo_equipos": t.cupo_equipos,
            "fecha_inicio": t.fecha_inicio.isoformat() if t.fecha_inicio else None,
            "fecha_fin": t.fecha_fin.isoformat() if t.fecha_fin else None,
            "estado": t.estado,
            "costo_inscripcion": t.costo_inscripcion,
            "formato": t.formato,
            "reglamento_url": t.reglamento_url
        })
    return result

@router.post("/torneos")
async def crear_torneo(request: Request, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    form = await request.form()
    nuevo_torneo = models.Torneo(
        admin_id=current_admin.id,
        nombre=form.get("nombre"),
        sede_id=int(form.get("sede_id")),
        cupo_equipos=int(form.get("cupo_equipos")),
        estado="planeado"
    )
    if form.get("categoria_id"): nuevo_torneo.categoria_id = int(form.get("categoria_id"))
    if form.get("costo_inscripcion"): nuevo_torneo.costo_inscripcion = float(form.get("costo_inscripcion"))
    if form.get("formato"): nuevo_torneo.formato = form.get("formato")
    
    if form.get("fecha_inicio"): nuevo_torneo.fecha_inicio = datetime.strptime(form.get("fecha_inicio"), "%Y-%m-%d").date()
    if form.get("fecha_fin"): nuevo_torneo.fecha_fin = datetime.strptime(form.get("fecha_fin"), "%Y-%m-%d").date()

    reglamento = form.get("reglamento")
    if reglamento and getattr(reglamento, "filename", None):
        file_ext = reglamento.filename.split('.')[-1]
        file_name = f"{uuid.uuid4()}.{file_ext}"
        os.makedirs("uploads", exist_ok=True)
        file_path = os.path.join("uploads", file_name)
        with open(file_path, "wb") as buffer:
            buffer.write(await reglamento.read())
        nuevo_torneo.reglamento_url = f"/uploads/{file_name}"

    db.add(nuevo_torneo)
    db.commit()
    db.refresh(nuevo_torneo)
    return {"message": "Torneo creado exitosamente", "id": nuevo_torneo.id}

@router.put("/torneos/{id}")
async def actualizar_torneo(id: int, request: Request, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    t = db.query(models.Torneo).filter(models.Torneo.id == id).first()
    if not t: raise HTTPException(status_code=404, detail="Torneo no encontrado")
    
    form = await request.form()
    if form.get("nombre"): t.nombre = form.get("nombre")
    if form.get("sede_id"): t.sede_id = int(form.get("sede_id"))
    if form.get("cupo_equipos"): t.cupo_equipos = int(form.get("cupo_equipos"))
    if form.get("categoria_id"): t.categoria_id = int(form.get("categoria_id"))
    if form.get("costo_inscripcion"): t.costo_inscripcion = float(form.get("costo_inscripcion"))
    if form.get("formato"): t.formato = form.get("formato")
    if form.get("estado"): t.estado = form.get("estado")
    
    if form.get("fecha_inicio"): t.fecha_inicio = datetime.strptime(form.get("fecha_inicio"), "%Y-%m-%d").date()
    if form.get("fecha_fin"): t.fecha_fin = datetime.strptime(form.get("fecha_fin"), "%Y-%m-%d").date()

    reglamento = form.get("reglamento")
    if reglamento and getattr(reglamento, "filename", None):
        file_ext = reglamento.filename.split('.')[-1]
        file_name = f"{uuid.uuid4()}.{file_ext}"
        os.makedirs("uploads", exist_ok=True)
        file_path = os.path.join("uploads", file_name)
        with open(file_path, "wb") as buffer:
            buffer.write(await reglamento.read())
        t.reglamento_url = f"/uploads/{file_name}"

    db.commit()
    return {"message": "Torneo actualizado exitosamente"}

@router.get("/torneos/{id}")
def get_torneo(id: int, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    t = db.query(models.Torneo).filter(models.Torneo.id == id).first()
    if not t:
        raise HTTPException(status_code=404, detail="Torneo no encontrado")
    return {
        "id": t.id,
        "nombre": t.nombre,
        "sede_id": t.sede_id,
        "categoria_id": t.categoria_id,
        "cupo_equipos": t.cupo_equipos,
        "fecha_inicio": t.fecha_inicio.isoformat() if t.fecha_inicio else None,
        "fecha_fin": t.fecha_fin.isoformat() if t.fecha_fin else None,
        "estado": t.estado,
        "costo_inscripcion": t.costo_inscripcion,
        "formato": t.formato,
        "reglamento_url": t.reglamento_url
    }

@router.get("/torneos/{id}/detalles_participantes")
def detalles_participantes(id: int, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    torneo = db.query(models.Torneo).filter(models.Torneo.id == id).first()
    if not torneo:
        raise HTTPException(status_code=404, detail="Torneo no encontrado")
    
    equipos_data = []
    torneo_equipos = db.query(models.TorneoEquipo).filter(models.TorneoEquipo.torneo_id == id).all()
    
    for te in torneo_equipos:
        try:
            equipo = db.query(models.Equipo).filter(models.Equipo.id == te.equipo_id).first()
            if not equipo:
                continue
            
            entrenador_nombre = "Sin Entrenador"
            entrenador_correo = ""
            try:
                if equipo.entrenador and equipo.entrenador.usuario:
                    entrenador_nombre = equipo.entrenador.usuario.nombre
                    entrenador_correo = equipo.entrenador.usuario.correo
            except Exception:
                pass

            equipos_data.append({
                "id": equipo.id,
                "nombre": equipo.nombre,
                "escudo_url": equipo.escudo_url,
                "entrenador": {"nombre": entrenador_nombre, "correo": entrenador_correo},
                "estado_inscripcion": te.estado,
                "jugadores": []
            })
        except Exception:
            continue

    return {
        "equipos": equipos_data,
        "arbitros": []
    }

@router.delete("/torneos/{id}")
def eliminar_torneo(id: int, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    t = db.query(models.Torneo).filter(models.Torneo.id == id).first()
    if not t:
        raise HTTPException(status_code=404, detail="Torneo no encontrado")
    db.delete(t)
    db.commit()
    return {"message": "Torneo eliminado exitosamente"}

# ─── PARTIDOS / HORARIOS ──────────────────────────────────────────────────────

@router.get("/partidos_calendario")
def get_partidos_calendario(db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    partidos = db.query(models.Partido).all()
    result = []
    for p in partidos:
        try:
            local_nombre = p.equipo_local.nombre if p.equipo_local else "?"
            visita_nombre = p.equipo_visita.nombre if p.equipo_visita else "?"
            sede_nombre = p.cancha.sede.nombre if p.cancha and p.cancha.sede else "?"
            cancha_nombre = p.cancha.nombre if p.cancha else "?"
            arbitro_nombre = None
            if p.arbitro and p.arbitro.usuario:
                arbitro_nombre = p.arbitro.usuario.nombre
            result.append({
                "id": p.id,
                "torneo_id": p.torneo_id,
                "equipo_local_id": p.equipo_local_id,
                "equipo_visita_id": p.equipo_visita_id,
                "equipo_local": local_nombre,
                "equipo_visita": visita_nombre,
                "cancha_id": p.cancha_id,
                "cancha": cancha_nombre,
                "sede": sede_nombre,
                "arbitro_id": p.arbitro_id,
                "arbitro": arbitro_nombre,
                "fecha_hora": p.fecha_hora.isoformat() if p.fecha_hora else None,
                "estado": p.estado,
                "goles_local": p.goles_local,
                "goles_visita": p.goles_visita,
            })
        except Exception:
            continue
    return result

@router.get("/partidos/datos_formulario")
def get_datos_formulario(db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    torneos = [{"id": t.id, "nombre": t.nombre} for t in db.query(models.Torneo).all()]
    equipos = [{"id": e.id, "nombre": e.nombre} for e in db.query(models.Equipo).all()]
    sedes = [{"id": s.id, "nombre": s.nombre} for s in db.query(models.Sede).all()]
    canchas = []
    for c in db.query(models.Cancha).all():
        canchas.append({"id": c.id, "nombre": c.nombre, "sede_id": c.sede_id})
    
    arbitros = []
    for a in db.query(models.Arbitro).all():
        try:
            arbitros.append({"id": a.usuario_id, "nombre": a.usuario.nombre if a.usuario else "?"})
        except Exception:
            pass

    return {"torneos": torneos, "equipos": equipos, "sedes": sedes, "canchas": canchas, "arbitros": arbitros}

@router.post("/partidos")
def crear_partido(data: dict, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    try:
        nuevo = models.Partido(
            torneo_id=data.get("torneo_id"),
            equipo_local_id=data.get("equipo_local_id"),
            equipo_visita_id=data.get("equipo_visita_id"),
            cancha_id=data.get("cancha_id"),
            arbitro_id=data.get("arbitro_id"),
            fecha_hora=datetime.fromisoformat(data.get("fecha_hora")),
            estado=data.get("estado", "programado")
        )
        db.add(nuevo)
        db.commit()
        db.refresh(nuevo)
        return {"message": "Partido creado", "id": nuevo.id}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.put("/partidos/{partido_id}")
def editar_partido(partido_id: int, data: dict, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    p = db.query(models.Partido).filter(models.Partido.id == partido_id).first()
    if not p:
        raise HTTPException(status_code=404, detail="Partido no encontrado")
    if "equipo_local_id" in data: p.equipo_local_id = data["equipo_local_id"]
    if "equipo_visita_id" in data: p.equipo_visita_id = data["equipo_visita_id"]
    if "cancha_id" in data: p.cancha_id = data["cancha_id"]
    if "arbitro_id" in data: p.arbitro_id = data["arbitro_id"]
    if "fecha_hora" in data: p.fecha_hora = datetime.fromisoformat(data["fecha_hora"])
    if "estado" in data: p.estado = data["estado"]
    db.commit()
    return {"message": "Partido actualizado"}

# ─── EQUIPOS Y GRUPOS DEL TORNEO ─────────────────────────────────────────────

@router.get("/torneos/{torneo_id}/equipos_sin_asignar")
def get_equipos_sin_asignar(torneo_id: int, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    """Devuelve equipos inscritos en el torneo que no tienen grupo asignado"""
    from sqlalchemy import text
    torneo_equipos = db.query(models.TorneoEquipo).filter(
        models.TorneoEquipo.torneo_id == torneo_id
    ).all()
    
    result = []
    for te in torneo_equipos:
        try:
            equipo = db.query(models.Equipo).filter(models.Equipo.id == te.equipo_id).first()
            if equipo:
                result.append({
                    "id": equipo.id,
                    "nombre": equipo.nombre,
                    "escudo_url": equipo.escudo_url,
                    "estado": te.estado
                })
        except Exception:
            continue
    return result

@router.get("/torneos/{torneo_id}/grupos")
def get_grupos(torneo_id: int, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    """Devuelve los grupos del torneo con sus equipos"""
    return {}

# ─── CLASIFICACIÓN ────────────────────────────────────────────────────────────

@router.get("/torneos/{torneo_id}/clasificacion")
def get_clasificacion(torneo_id: int, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    """Devuelve la tabla de posiciones del torneo"""
    posiciones = db.query(models.TablaPosicion).filter(
        models.TablaPosicion.torneo_id == torneo_id
    ).order_by(models.TablaPosicion.puntos.desc(), models.TablaPosicion.goles_favor.desc()).all()

    result = []
    for p in posiciones:
        try:
            equipo = db.query(models.Equipo).filter(models.Equipo.id == p.equipo_id).first()
            nombre = equipo.nombre if equipo else "?"
            escudo = equipo.escudo_url if equipo else None
            result.append({
                "equipo_id": p.equipo_id,
                "equipo": nombre,
                "escudo_url": escudo,
                "partidos_jugados": p.partidos_jugados,
                "ganados": p.ganados,
                "empatados": p.empatados,
                "perdidos": p.perdidos,
                "goles_favor": p.goles_favor,
                "goles_contra": p.goles_contra,
                "diferencia_goles": p.goles_favor - p.goles_contra,
                "puntos": p.puntos,
            })
        except Exception:
            continue
    return result

# ─── LLAVES ELIMINATORIAS ─────────────────────────────────────────────────────

@router.get("/torneos/{torneo_id}/llaves")
def get_llaves(torneo_id: int, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    """Devuelve los partidos de eliminatorias del torneo ordenados por ronda"""
    partidos = db.query(models.Partido).filter(
        models.Partido.torneo_id == torneo_id,
        models.Partido.estado.in_(["programado", "en_curso", "finalizado"])
    ).order_by(models.Partido.fecha_hora).all()

    if not partidos:
        return {"success": False, "matches": [], "message": "No hay partidos generados para este torneo"}

    definidos = []
    por_definir = []

    for p in partidos:
        try:
            local = p.equipo_local.nombre if p.equipo_local else None
            visita = p.equipo_visita.nombre if p.equipo_visita else None
            arbitro_nombre = "Sin árbitro"
            if p.arbitro and p.arbitro.usuario:
                arbitro_nombre = p.arbitro.usuario.nombre

            match_data = {
                "id": p.id,
                "local": local or "Por definir",
                "visita": visita or "Por definir",
                "arbitro": arbitro_nombre,
                "fecha_hora": p.fecha_hora.isoformat() if p.fecha_hora else None,
                "estado": p.estado,
                "goles_local": p.goles_local,
                "goles_visita": p.goles_visita,
            }

            if local and visita:
                definidos.append(match_data)
            else:
                por_definir.append(match_data)
        except Exception:
            continue

    matches = definidos + por_definir

    return {
        "success": True,
        "matches": matches,
        "message": f"Cuadro de eliminatorias - {len(matches)} partidos"
    }

@router.get("/torneos/{torneo_id}/llaves_eliminatorias")
def get_llaves_eliminatorias(torneo_id: int, db: Session = Depends(get_db), current_admin: models.Usuario = Depends(get_current_admin)):
    return get_llaves(torneo_id, db, current_admin)
