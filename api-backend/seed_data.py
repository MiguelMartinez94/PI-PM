importsys
importos

sys.path.append(os.path.dirname(os.path.abspath(__file__)))
fromdb.databaseimportSessionLocal
importmodels.modelsasmodels
fromsecurity.hashingimportget_password_hash

defseed_data():
    db=SessionLocal()
try:

        rol_entrenador=db.query(models.Rol).filter(models.Rol.nombre=='entrenador').first()
rol_jugador=db.query(models.Rol).filter(models.Rol.nombre=='jugador').first()

ifnotrol_entrenadorornotrol_jugador:
            print("Roles not found")
return


foriinrange(1,4):
            email=f"entrenador_extra_{i}@test.com"
ifnotdb.query(models.Usuario).filter(models.Usuario.correo==email).first():
                usr=models.Usuario(
rol_id=rol_entrenador.id,
nombre=f"Entrenador Extra {i}",
correo=email,
contrasena_hash=get_password_hash("password123"),
telefono="1234567890"
)
db.add(usr)
db.flush()
ent=models.Entrenador(usuario_id=usr.id,anios_experiencia=5)
db.add(ent)
db.commit()


foriinrange(1,69):
            email=f"jugador_extra_{i}@test.com"
ifnotdb.query(models.Usuario).filter(models.Usuario.correo==email).first():
                usr=models.Usuario(
rol_id=rol_jugador.id,
nombre=f"Jugador Extra {i}",
correo=email,
contrasena_hash=get_password_hash("password123"),
telefono="1234567890"
)
db.add(usr)
db.flush()
jug=models.Jugador(
usuario_id=usr.id,
posicion="Medio",
especialidad="Pase"
)
db.add(jug)
db.commit()


entrenadores=db.query(models.Entrenador).all()
iflen(entrenadores)<8:
            foriinrange(len(entrenadores),8):
                usr=models.Usuario(
rol_id=rol_entrenador.id,
nombre=f"Entrenador Gen {i}",
correo=f"entrenador_gen_{i}@test.com",
contrasena_hash=get_password_hash("password123"),
)
db.add(usr)
db.flush()
ent=models.Entrenador(usuario_id=usr.id,anios_experiencia=2)
db.add(ent)
entrenadores.append(ent)
db.commit()


nombres_universidades=["UAQ","ITQ","UTEQ","UNAQ","Anáhuac","UVM","Tecmilenio"]
equipos=db.query(models.Equipo).all()


coaches_without_team=[]
forentinentrenadores[:8]:
            ifnotany(eq.entrenador_id==ent.usuario_idforeqinequipos):
                coaches_without_team.append(ent)

fori,nombreinenumerate(nombres_universidades):
            ifnotdb.query(models.Equipo).filter(models.Equipo.nombre==nombre).first():
                ifi<len(coaches_without_team):
                    eq=models.Equipo(
entrenador_id=coaches_without_team[i].usuario_id,
nombre=nombre,
escudo_url="https://via.placeholder.com/150",
limite_jugadores=20
)
db.add(eq)
db.commit()


equipos=db.query(models.Equipo).limit(8).all()


jugadores=db.query(models.Jugador).limit(88).all()


foridx,equipoinenumerate(equipos):
            start=idx*11
end=start+11
team_players=jugadores[start:end]

forj,jugadorinenumerate(team_players):

                rel=db.query(models.EquipoJugador).filter(
models.EquipoJugador.jugador_id==jugador.usuario_id
).first()
ifnotrel:
                    rel=models.EquipoJugador(
equipo_id=equipo.id,
jugador_id=jugador.usuario_id,
numero_dorsal=j+1,
estado='activo'
)
db.add(rel)
db.commit()
print("Seeding complete")
exceptExceptionase:
        print(f"Error: {e}")
db.rollback()
finally:
        db.close()

if__name__=="__main__":
    seed_data()
