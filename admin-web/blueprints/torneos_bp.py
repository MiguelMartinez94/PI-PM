from flask import Blueprint, render_template, request, redirect, url_for, session, flash, jsonify
from utils import api_get, api_post

torneos_bp = Blueprint('torneos_bp', __name__)

@torneos_bp.route('/crear_torneo', methods=['GET', 'POST'])
def crear_torneo():
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    if request.method == 'POST':
        data = {
            "nombre": request.form.get('nombre'),
            "sede_id": request.form.get('sede'),
            "categoria_id": request.form.get('categoria'),
            "fecha_inicio": request.form.get('fecha_inicio'),
            "fecha_fin": request.form.get('fecha_fin'),
            "formato": request.form.get('formato'),
            "cupo_equipos": request.form.get('cupo_equipos'),
            "costo_inscripcion": request.form.get('costo_inscripcion', 0)
        }

        data = {k: v for k, v in data.items() if v}

        files = {}
        if 'reglamento' in request.files and request.files['reglamento'].filename != '':
            reglamento = request.files['reglamento']
            files = {'reglamento': (reglamento.filename, reglamento.stream, reglamento.mimetype)}

        res = api_post('/admin/torneos', data=data, files=files if files else None)
        if res and res.status_code == 200:
            flash("Torneo creado exitosamente")
            return redirect(url_for('dashboard_bp.dashboard'))
        else:
            flash("Error al crear el torneo")

    sedes = api_get('/admin/sedes', default=[])
    torneos = api_get('/admin/torneos', default=[])
    return render_template('crear_torneo.html', sedes=sedes, torneos=torneos)

@torneos_bp.route('/editar_torneo/<int:id>', methods=['POST'])
def editar_torneo(id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))
    from utils import api_put

    data = {
        "nombre": request.form.get('nombre'),
        "sede_id": request.form.get('sede'),
        "categoria_id": request.form.get('categoria'),
        "fecha_inicio": request.form.get('fecha_inicio'),
        "fecha_fin": request.form.get('fecha_fin'),
        "formato": request.form.get('formato'),
        "cupo_equipos": request.form.get('cupo_equipos'),
        "costo_inscripcion": request.form.get('costo_inscripcion'),
        "estado": request.form.get('estado')
    }
    data = {k: v for k, v in data.items() if v is not None and v != ''}

    files = {}
    if 'reglamento' in request.files and request.files['reglamento'].filename != '':
        reglamento = request.files['reglamento']
        files = {'reglamento': (reglamento.filename, reglamento.stream, reglamento.mimetype)}

    res = api_put(f'/admin/torneos/{id}', data=data, files=files if files else None)
    if res and res.status_code == 200:
        flash("Torneo actualizado exitosamente")
    else:
        flash("Error al actualizar el torneo")
    return redirect(url_for('torneos_bp.crear_torneo'))

@torneos_bp.route('/eliminar_torneo/<int:id>', methods=['POST'])
def eliminar_torneo(id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))
    from utils import api_delete
    res = api_delete(f'/admin/torneos/{id}')
    if res and res.status_code == 200:
        flash("Torneo eliminado exitosamente")
    else:
        flash("Error al eliminar el torneo")
    return redirect(url_for('torneos_bp.crear_torneo'))

@torneos_bp.route('/<int:id>/detalles')
def detalles_torneo(id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))
    torneo = api_get(f'/admin/torneos/{id}')
    detalles = api_get(f'/admin/torneos/{id}/detalles_participantes', default={"equipos": [], "arbitros": []})

    if not torneo:
        flash("Torneo no encontrado")
        return redirect(url_for('torneos_bp.crear_torneo'))

    return render_template('detalles_torneo.html', torneo=torneo, detalles=detalles)

@torneos_bp.route('/admin/torneos/<int:id>/participantes')
def participantes_torneo(id):
    if not session.get('token'):
        return jsonify({"equipos": [], "arbitros": []}), 401
    detalles = api_get(f'/admin/torneos/{id}/detalles_participantes', default={"equipos": [], "arbitros": []})
    return jsonify(detalles)

@torneos_bp.route('/aceptar_equipos')
def aceptar_equipos():
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    solicitudes = api_get('/admin/torneos/solicitudes_pendientes', default=[])
    equipos_aceptados = api_get('/admin/torneos/equipos_aceptados', default=[])
    return render_template('aceptar_equipos.html', solicitudes=solicitudes, aceptados=equipos_aceptados)

@torneos_bp.route('/aceptar_equipo/<int:solicitud_id>', methods=['POST'])
def aceptar_equipo(solicitud_id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))
    res = api_post(f'/admin/torneos/aceptar_equipo/{solicitud_id}')
    flash("Equipo aceptado")
    return redirect(url_for('torneos_bp.aceptar_equipos'))

@torneos_bp.route('/rechazar_equipo/<int:solicitud_id>', methods=['POST'])
def rechazar_equipo(solicitud_id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))
    res = api_post(f'/admin/torneos/rechazar_equipo/{solicitud_id}')
    flash("Equipo rechazado")
    return redirect(url_for('torneos_bp.aceptar_equipos'))

@torneos_bp.route('/equipos_emparejamientos')
def equipos_emparejamientos():
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))
    torneos = api_get('/admin/torneos', default=[])

    torneo_id = request.args.get('torneo_id')
    equipos = []
    grupos = {}
    torneo_obj = None
    cupo_equipos = 0
    total_equipos = 0

    if torneo_id:
        equipos = api_get(f'/admin/torneos/{torneo_id}/equipos_sin_asignar', default=[])
        grupos = api_get(f'/admin/torneos/{torneo_id}/grupos', default={})
        for t in torneos:
            if str(t.get('id')) == str(torneo_id):
                torneo_obj = t
                cupo_equipos = t.get('cupo_equipos', 0)
                break

        total_equipos = len(equipos)
        for k, v in grupos.items():
            total_equipos += len(v)

    return render_template('equipos_emparejamientos.html',
        torneos=torneos,
        current_torneo=torneo_id,
        equipos=equipos,
        grupos=grupos,
        cupo_equipos=cupo_equipos,
        total_equipos=total_equipos)

@torneos_bp.route('/equipos_emparejamientos/<int:torneo_id>/guardar', methods=['POST'])
def guardar_emparejamientos(torneo_id):
    if not session.get('token'):
        return {"success": False}, 401
    data = request.json
    res = api_post(f'/admin/torneos/{torneo_id}/asignar_grupos', json_data=data)
    if res and res.status_code == 200:
        return {"success": True}
    return {"success": False, "error": "Error al guardar"}, 400

@torneos_bp.route('/<int:torneo_id>/asignar_arbitros', methods=['POST'])
def asignar_arbitros(torneo_id):
    if not session.get('token'):
        return {"success": False}, 401
    res = api_post(f'/admin/torneos/{torneo_id}/asignar_arbitros')
    if res and res.status_code == 200:
        return {"success": True, "message": res.json().get("message", "Árbitros asignados correctamente.")}
    return {"success": False, "error": "Error al asignar árbitros"}, 400

@torneos_bp.route('/<int:torneo_id>/generar_llaves', methods=['POST'])
def generar_llaves(torneo_id):
    if not session.get('token'):
        return {"success": False}, 401
    res = api_post(f'/admin/torneos/{torneo_id}/generar_llaves')
    if res and res.status_code == 200:
        data = res.json()
        data["success"] = True
        return jsonify(data)
    return {"success": False, "error": "Error al generar llaves"}, 400

@torneos_bp.route('/<int:torneo_id>/llaves', methods=['GET'])
def get_llaves(torneo_id):
    if not session.get('token'):
        return {"success": False}, 401
    res = api_get(f'/admin/torneos/{torneo_id}/llaves')
    if res and isinstance(res, dict) and res.get('success'):
        return jsonify(res)
    return {"success": False, "error": "Error al obtener llaves"}, 400

@torneos_bp.route('/<int:torneo_id>/partidos/asignar_arbitros', methods=['POST'])
def asignar_arbitros_partidos(torneo_id):
    if not session.get('token'):
        return {"success": False}, 401
    res = api_post(f'/admin/torneos/{torneo_id}/partidos/asignar_arbitros')
    if res and res.status_code == 200:
        return {"success": True, "message": res.json().get("message", "Árbitros asignados a partidos correctamente.")}
    return {"success": False, "error": "Error al asignar árbitros a partidos"}, 400

@torneos_bp.route('/<int:torneo_id>/programar_calendario', methods=['POST'])
def programar_calendario(torneo_id):
    if not session.get('token'):
        return {"success": False}, 401
    res = api_post(f'/admin/torneos/{torneo_id}/programar_calendario')
    if res and res.status_code == 200:
        return {"success": True, "message": res.json().get("message", "Calendario programado exitosamente.")}
    return {"success": False, "error": "Error al programar calendario"}, 400

@torneos_bp.route('/cuadro_eliminatorias')
def cuadro_eliminatorias():
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))
    torneos = api_get('/admin/torneos', default=[])
    torneo_id = request.args.get('torneo_id')

    llaves = []
    if torneo_id:
        llaves = api_get(f'/admin/torneos/{torneo_id}/llaves_eliminatorias', default=[])

    return render_template('cuadro_eliminatorias.html', torneos=torneos, current_torneo=torneo_id, llaves=llaves)

@torneos_bp.route('/<int:torneo_id>/llaves_json', methods=['GET'])
def get_llaves_json(torneo_id):
    res = api_get(f'/admin/torneos/{torneo_id}/llaves')
    return jsonify(res)
