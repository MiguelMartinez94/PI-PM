from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from utils import api_post

auth_bp = Blueprint('auth_bp', __name__)

@auth_bp.route('/', methods=['GET', 'POST'])
@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        correo = request.form.get('correo')
        password = request.form.get('password')

        data = {"username": correo, "password": password}
        response = api_post('/auth/login', data=data)

        if response and response.status_code == 200:
            resp_data = response.json()
            rol = resp_data.get('rol_nombre')
            if rol not in ['admin', 'administrador']:
                flash("Acceso denegado. Esta plataforma es únicamente para administradores.")
                return render_template('login.html')

            session['token'] = resp_data.get('access_token')
            session['rol'] = rol
            return redirect(url_for('dashboard_bp.dashboard'))
        else:
            flash("Credenciales incorrectas o error en el servidor.")

    return render_template('login.html')

@auth_bp.route('/logout')
def logout():
    session.pop('token', None)
    return redirect(url_for('auth_bp.login'))
