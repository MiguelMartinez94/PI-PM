from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from utils import api_get, api_post

horarios_bp = Blueprint('horarios_bp', __name__)

@horarios_bp.route('/gestionar_horarios')
def gestionar_horarios():
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    partidos = api_get('/admin/partidos_calendario', default=[])
    datos = api_get('/admin/partidos/datos_formulario', default={})

    return render_template('gestionar_horarios.html',
        partidos=partidos,
        torneos=datos.get("torneos", []),
        equipos=datos.get("equipos", []),
        sedes=datos.get("sedes", []),
        canchas=datos.get("canchas", []),
        arbitros=datos.get("arbitros", []))

@horarios_bp.route('/partidos/crear', methods=['POST'])
def crear_partido():
    if not session.get('token'):
        return {"success": False, "error": "No autorizado"}, 401
    res = api_post('/admin/partidos', json_data=request.json)
    if res and res.status_code == 200:
        return {"success": True}
    return {"success": False, "error": "Error al crear partido"}, 400

@horarios_bp.route('/partidos/<int:partido_id>/editar', methods=['POST'])
def editar_partido(partido_id):
    if not session.get('token'):
        return {"success": False, "error": "No autorizado"}, 401
    from utils import api_put
    res = api_put(f'/admin/partidos/{partido_id}', json_data=request.json)
    if res and res.status_code == 200:
        return {"success": True}
    return {"success": False, "error": "Error al editar partido"}, 400
