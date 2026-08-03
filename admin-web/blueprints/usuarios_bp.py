from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from utils import api_get, api_delete

usuarios_bp = Blueprint('usuarios_bp', __name__)

@usuarios_bp.route('/gestionar_usuarios/<rol>')
def gestionar_usuarios(rol):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    usuarios = api_get(f'/admin/usuarios?rol={rol}', default=[])
    return render_template('gestionar_usuarios.html', usuarios=usuarios, rol=rol)

@usuarios_bp.route('/eliminar_usuario/<int:id>', methods=['POST'])
def eliminar_usuario(id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))
    api_delete(f'/admin/usuarios/{id}')
    return redirect(request.referrer or url_for('dashboard_bp.dashboard'))
