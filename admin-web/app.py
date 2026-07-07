
from flask import Flask, render_template, request, redirect, url_for, session, flash
import requests

app = Flask(__name__)
app.secret_key = "123456"  

FASTAPI_URL = "http://localhost:8000"

def get_headers():
    token = session.get('token')
    if token:
        return {"Authorization": f"Bearer {token}"}
    return {}

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        
        correo = request.form.get('correo')
        password = request.form.get('password')
        
        try:
            response = requests.post(
                f"{FASTAPI_URL}/auth/login", 
                data={"username": correo, "password": password}
            )
            if response.status_code == 200:
                data = response.json()
                session['token'] = data.get('access_token')
                return redirect(url_for('dashboard'))
            else:
                flash("Credenciales incorrectas")
        except requests.exceptions.RequestException:
            flash("Error conectando con la API Backend")
            
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('token', None)
    return redirect(url_for('login'))

@app.route('/dashboard')
def dashboard():
    
    
    
    actividades = []
    try:
        
        
        pass
    except requests.exceptions.RequestException:
        pass
        
    return render_template('dashboard.html', actividades=actividades, torneos_activos=0, equipos_registrados=0, partidos_hoy=0, arbitros_disponibles=0)

@app.route('/crear_torneo')
def crear_torneo():
    
    return render_template('crear_torneo.html')

@app.route('/gestionar_sedes')
def gestionar_sedes():
    
    sedes = []
    try:
        
        
        pass
    except requests.exceptions.RequestException:
        pass
    return render_template('gestionar_sedes.html', sedes=sedes)

@app.route('/registrar_sede')
def registrar_sede():
    
    return render_template('registrar_sede.html')

@app.route('/gestionar_equipo')
def gestionar_equipo():
    
    jugadores = []
    return render_template('gestionar_equipo.html', jugadores=jugadores)

@app.route('/tabla_clasificacion')
def tabla_clasificacion():
    
    posiciones = []
    return render_template('tabla_clasificacion.html', posiciones=posiciones)

@app.route('/aceptar_equipos')
def aceptar_equipos():
    
    solicitudes = []
    return render_template('aceptar_equipos.html', solicitudes=solicitudes)

@app.route('/equipos_emparejamientos')
def equipos_emparejamientos():
    
    equipos = []
    emparejamientos = []
    return render_template('equipos_emparejamientos.html', equipos=equipos, emparejamientos=emparejamientos)

@app.route('/cuadro_eliminatorias')
def cuadro_eliminatorias():
    
    return render_template('cuadro_eliminatorias.html')

@app.route('/gestionar_horarios')
def gestionar_horarios():
    
    return render_template('gestionar_horarios.html')

if __name__ == '__main__':
    app.run(debug=True, port=5000)
