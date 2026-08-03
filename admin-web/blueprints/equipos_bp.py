from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from utils import api_get, api_delete

equipos_bp = Blueprint('equipos_bp', __name__)

@equipos_bp.route('/gestionar_equipos')
def gestionar_equipos():
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    equipos = api_get('/admin/equipos', default=[])
    return render_template('gestionar_equipos.html', equipos=equipos)

@equipos_bp.route('/eliminar_equipo/<int:id>', methods=['POST'])
def eliminar_equipo(id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))
    api_delete(f'/admin/equipos/{id}')
    return redirect(url_for('equipos_bp.gestionar_equipos'))

@equipos_bp.route('/gestionar_equipo/<int:id>')
def gestionar_equipo(id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    equipo = api_get(f'/admin/equipos/{id}', default={})
    jugadores = equipo.get('jugadores', [])
    return render_template('gestionar_equipo.html', equipo=equipo, jugadores=jugadores)
