importos,re
templates_dir='admin-web/templates'

replacements={
r"url_for\('dashboard'\)":"url_for('dashboard_bp.dashboard')",
r"url_for\('gestionar_sedes'\)":"url_for('sedes_bp.gestionar_sedes')",
r"url_for\('registrar_sede'\)":"url_for('sedes_bp.registrar_sede')",
r"url_for\('crear_torneo'\)":"url_for('torneos_bp.crear_torneo')",
r"url_for\('gestionar_horarios'\)":"url_for('horarios_bp.gestionar_horarios')",
r"url_for\('equipos_emparejamientos'\)":"url_for('torneos_bp.equipos_emparejamientos')",
r"url_for\('tabla_clasificacion'\)":"url_for('clasificacion_bp.tabla_clasificacion')",
r"url_for\('gestionar_usuarios',":"url_for('usuarios_bp.gestionar_usuarios',",
r"url_for\('gestionar_equipos'\)":"url_for('equipos_bp.gestionar_equipos')",
r"url_for\('logout'\)":"url_for('auth_bp.logout')",
r"url_for\('login'\)":"url_for('auth_bp.login')",
r"url_for\('eliminar_equipo',":"url_for('equipos_bp.eliminar_equipo',",
r"url_for\('eliminar_usuario',":"url_for('usuarios_bp.eliminar_usuario',",
r"url_for\('cuadro_eliminatorias'\)":"url_for('torneos_bp.cuadro_eliminatorias')",
r"url_for\('aceptar_equipos'\)":"url_for('torneos_bp.aceptar_equipos')",
r"request\.endpoint == 'dashboard'":"request.endpoint == 'dashboard_bp.dashboard'",
r"request\.endpoint in \['gestionar_sedes', 'registrar_sede'\]":"request.endpoint in ['sedes_bp.gestionar_sedes', 'sedes_bp.registrar_sede']",
r"request\.endpoint == 'crear_torneo'":"request.endpoint == 'torneos_bp.crear_torneo'",
r"request\.endpoint == 'gestionar_horarios'":"request.endpoint == 'horarios_bp.gestionar_horarios'",
r"request\.endpoint in \['equipos_emparejamientos', 'gestionar_equipo', 'aceptar_equipos', 'cuadro_eliminatorias'\]":"request.endpoint in ['torneos_bp.equipos_emparejamientos', 'equipos_bp.gestionar_equipo', 'torneos_bp.aceptar_equipos', 'torneos_bp.cuadro_eliminatorias']",
r"request\.endpoint == 'tabla_clasificacion'":"request.endpoint == 'clasificacion_bp.tabla_clasificacion'",
r"request\.endpoint == 'gestionar_usuarios'":"request.endpoint == 'usuarios_bp.gestionar_usuarios'",
r"request\.endpoint == 'gestionar_equipos'":"request.endpoint == 'equipos_bp.gestionar_equipos'",
}

forroot,_,filesinos.walk(templates_dir):
    forfileinfiles:
        iffile.endswith('.html'):
            filepath=os.path.join(root,file)
withopen(filepath,'r',encoding='utf-8')asf:
                content=f.read()

forpattern,replinreplacements.items():
                content=re.sub(pattern,repl,content)

withopen(filepath,'w',encoding='utf-8')asf:
                f.write(content)
print('Done!')
