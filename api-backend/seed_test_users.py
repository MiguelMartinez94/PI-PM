importsys
importos


sys.path.append(os.path.dirname(os.path.abspath(__file__)))

fromdb.databaseimportSessionLocal
fromrouters.auth_routerimportget_password_hash
fromsqlalchemyimporttext

db=SessionLocal()

defensure_role(role_name,role_desc):
    db.execute(text(f"INSERT INTO roles (nombre, descripcion) VALUES ('{role_name}', '{role_desc}') ON CONFLICT (nombre) DO NOTHING"))
db.commit()
res=db.execute(text(f"SELECT id FROM roles WHERE nombre = '{role_name}'")).fetchone()
returnres[0]

rol_arbitro_id=ensure_role('arbitro','Árbitro')
rol_jugador_id=ensure_role('jugador','Jugador')
rol_entrenador_id=ensure_role('entrenador','Entrenador')

foto_url='assets/fotogato.png'

defcreate_user(prefix,index,rol_id,details_table):
    nombre=f"{prefix}{index}"
correo=f"{nombre}@ejemplo.com"
pwd=get_password_hash(nombre)
telefono=f"555000{index:04d}"


res=db.execute(text(f"SELECT id FROM usuarios WHERE correo = '{correo}'")).fetchone()
ifres:
        usuario_id=res[0]
print(f"User {correo} already exists.")
else:
        db.execute(text(f"""
            INSERT INTO usuarios (nombre, correo, telefono, contrasena_hash, rol_id, activo, foto_url) 
            VALUES ('{nombre}', '{correo}', '{telefono}', '{pwd}', {rol_id}, true, '{foto_url}')
        """))
db.commit()
res=db.execute(text(f"SELECT id FROM usuarios WHERE correo = '{correo}'")).fetchone()
usuario_id=res[0]


try:
            db.execute(text(f"INSERT INTO {details_table} (usuario_id) VALUES ({usuario_id})"))
db.commit()
print(f"Created {nombre} - {correo}")
exceptExceptionase:
            db.rollback()
print(f"Error creating details for {nombre}: {e}")

print("Creating Árbitros...")
foriinrange(1,7):
    create_user('arbitro',i,rol_arbitro_id,'arbitros')

print("\nCreating Jugadores...")
foriinrange(1,21):
    create_user('jugador',i,rol_jugador_id,'jugadores')

print("\nCreating Entrenadores...")
foriinrange(1,6):
    create_user('entrenador',i,rol_entrenador_id,'entrenadores')

print("\nFinished seeding users.")
db.close()
