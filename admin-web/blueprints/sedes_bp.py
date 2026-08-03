from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from utils import api_get, api_post, api_put, api_delete

sedes_bp = Blueprint('sedes_bp', __name__)

@sedes_bp.route('/gestionar_sedes')
def gestionar_sedes():
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    sedes = api_get('/admin/sedes', default=[])
    if sedes is None:
        sedes = []

    return render_template('gestionar_sedes.html', sedes=sedes)

@sedes_bp.route('/registrar_sede', methods=['POST'])
def registrar_sede():
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    data = {
        'nombre': request.form.get('nombre'),
        'direccion': request.form.get('direccion'),
        'telefono': request.form.get('telefono'),
        'ciudad': request.form.get('ciudad'),
        'cantidad_canchas': request.form.get('cantidad_canchas'),
        'horario_apertura': request.form.get('horario_apertura'),
        'horario_cierre': request.form.get('horario_cierre'),
        'amenidades': request.form.get('amenidades')
    }
    data = {k: v for k, v in data.items() if v}

    files = {}
    if 'foto' in request.files and request.files['foto'].filename != '':
        foto = request.files['foto']
        foto.stream.seek(0)
        file_bytes = foto.read()
        files = {'foto': (foto.filename, file_bytes, foto.mimetype)}

    res = api_post("/admin/sedes", data=data, files=files if files else None)
    if res and res.status_code == 200:
        flash("Sede registrada exitosamente")
    else:
        flash("Error al registrar sede")

    return redirect(url_for('sedes_bp.gestionar_sedes'))

@sedes_bp.route('/sedes/<int:sede_id>/toggle', methods=['POST'])
def toggle_sede(sede_id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    res = api_put(f"/admin/sedes/{sede_id}/toggle")
    if res and res.status_code == 200:
        flash("Estado de la sede actualizado")
    else:
        flash("Error al actualizar la sede")

    return redirect(url_for('sedes_bp.gestionar_sedes'))

@sedes_bp.route('/sedes/<int:sede_id>/editar', methods=['POST'])
def editar_sede(sede_id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    data = {
        'nombre': request.form.get('nombre'),
        'direccion': request.form.get('direccion'),
        'telefono': request.form.get('telefono'),
        'ciudad': request.form.get('ciudad'),
        'cantidad_canchas': request.form.get('cantidad_canchas'),
        'horario_apertura': request.form.get('horario_apertura'),
        'horario_cierre': request.form.get('horario_cierre'),
        'amenidades': request.form.get('amenidades')
    }
    data = {k: v for k, v in data.items() if v}

    files = {}
    if 'foto' in request.files and request.files['foto'].filename != '':
        foto = request.files['foto']
        foto.stream.seek(0)
        file_bytes = foto.read()
        files = {'foto': (foto.filename, file_bytes, foto.mimetype)}

    res = api_put(f"/admin/sedes/{sede_id}", data=data, files=files if files else None)
    if res and res.status_code == 200:
        flash("Sede actualizada exitosamente")
    else:
        flash("Error al actualizar la sede")

    return redirect(url_for('sedes_bp.gestionar_sedes'))

@sedes_bp.route('/sedes/<int:sede_id>/eliminar', methods=['POST'])
def eliminar_sede(sede_id):
    if not session.get('token'):
        return redirect(url_for('auth_bp.login'))

    res = api_delete(f"/admin/sedes/{sede_id}")
    if res and res.status_code == 200:
        flash("Sede eliminada exitosamente")
    else:
        flash("Error al eliminar la sede")

    return redirect(url_for('sedes_bp.gestionar_sedes'))
