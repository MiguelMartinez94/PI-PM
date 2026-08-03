from flask import Flask, Response
import requests

from blueprints.auth_bp import auth_bp
from blueprints.dashboard_bp import dashboard_bp
from blueprints.sedes_bp import sedes_bp
from blueprints.torneos_bp import torneos_bp
from blueprints.horarios_bp import horarios_bp
from blueprints.equipos_bp import equipos_bp
from blueprints.clasificacion_bp import clasificacion_bp
from blueprints.usuarios_bp import usuarios_bp
from utils import FASTAPI_URL

app = Flask(__name__)
app.secret_key = "123456"

app.register_blueprint(auth_bp)
app.register_blueprint(dashboard_bp)
app.register_blueprint(sedes_bp)
app.register_blueprint(torneos_bp)
app.register_blueprint(horarios_bp)
app.register_blueprint(equipos_bp)
app.register_blueprint(clasificacion_bp)
app.register_blueprint(usuarios_bp)


@app.route('/uploads/<path:filename>')
def proxy_uploads(filename):
    res = requests.get(f"{FASTAPI_URL}/uploads/{filename}")
    return Response(res.content, content_type=res.headers.get('Content-Type', 'image/jpeg'))


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)
