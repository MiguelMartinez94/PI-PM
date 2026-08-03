from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from utils import api_get

clasificacion_bp = Blueprint('clasificacion_bp', __name__)

@clasificacion_bp.route('/tabla_clasificacion')
def tabla_clasificacion():
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    torneos = api_get('/admin/torneos', default=[])
    torneo_id = request.args.get('torneo_id')
    grupo_actual = request.args.get('grupo', 'todos')

    posiciones = api_get(f'/admin/torneos/{torneo_id}/clasificacion', default=[]) if torneo_id else []
    grupos = api_get(f'/admin/torneos/{torneo_id}/grupos', default={}) if torneo_id else {}

    if grupo_actual != 'todos' and grupo_actual in grupos:
        equipo_ids_in_group = [eq['equipo_id'] for eq in grupos[grupo_actual]]
        posiciones = [p for p in posiciones if p['equipo_id'] in equipo_ids_in_group]

    return render_template('tabla_clasificacion.html',
        posiciones=posiciones,
        torneos=torneos,
        current_torneo=torneo_id,
        grupos=grupos,
        current_grupo=grupo_actual)
