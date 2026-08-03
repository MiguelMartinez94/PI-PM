fromdb.databaseimportSessionLocal
fromrouters.auth_routerimportget_password_hash
fromsqlalchemyimporttext

db=SessionLocal()

db.execute(text("INSERT INTO roles (nombre, descripcion) VALUES ('admin', 'Administrador') ON CONFLICT (nombre) DO NOTHING"))
db.commit()

rol_res=db.execute(text("SELECT id FROM roles WHERE nombre = 'admin'")).fetchone()
rol_id=rol_res[0]

res=db.execute(text(f"SELECT id, correo FROM usuarios WHERE rol_id = {rol_id}")).fetchone()

ifnotres:
    pwd=get_password_hash('admin123')
db.execute(text(f"INSERT INTO usuarios (nombre, correo, telefono, contrasena_hash, rol_id, activo) VALUES ('Admin', 'admin@ligapro.com', '1234567890', '{pwd}', {rol_id}, true)"))
db.commit()
print('ADMIN_CREATED admin@ligapro.com admin123')
else:
    print('ADMIN_EXISTS',res[1])
