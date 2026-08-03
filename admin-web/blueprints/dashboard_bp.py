from flask import Blueprint, render_template, redirect, url_for, session, flash
from utils import api_get

dashboard_bp = Blueprint('dashboard_bp', __name__)

@dashboard_bp.route('/dashboard')
def dashboard():
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    dashboard_data = api_get("/admin/dashboard", default={})
    if dashboard_data is None:
        dashboard_data = {}

    stats = dashboard_data.get('stats', {})
    actividades = dashboard_data.get('proximos_partidos', [])
    torneos_act = dashboard_data.get('torneos_activos', [])

    return render_template('dashboard.html',
        actividades=actividades,
        torneos_activos=stats.get('torneos_curso', 0),
        equipos_registrados=stats.get('equipos_registrados', 0),
        partidos_hoy=stats.get('partidos', 0),
        sedes_activas=stats.get('sedes_activas', 0),
        lista_torneos_activos=torneos_act,
        alertas=dashboard_data.get('alertas', []),
        grafica_partidos=dashboard_data.get('grafica_partidos', []))
