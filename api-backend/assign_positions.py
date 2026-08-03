importos
importsys
importrandom

fromdb.databaseimportSessionLocal
frommodelsimportmodels

defassign_positions():
    db=SessionLocal()


equipos=db.query(models.Equipo).all()

positions=['Defensa','Medio','Delantero']
assigned_jugador_ids=set()

forequipoinequipos:

        rels=db.query(models.EquipoJugador).filter(
models.EquipoJugador.equipo_id==equipo.id,
models.EquipoJugador.estado=='activo'
).all()

jugador_ids=[r.jugador_idforrinrels]
ifnotjugador_ids:
            continue


random.shuffle(jugador_ids)


portero_id=jugador_ids[0]
portero=db.query(models.Jugador).filter(models.Jugador.usuario_id==portero_id).first()
ifportero:
            portero.posicion='Portero'
assigned_jugador_ids.add(portero_id)


forj_idinjugador_ids[1:]:
            j=db.query(models.Jugador).filter(models.Jugador.usuario_id==j_id).first()
ifj:
                j.posicion=random.choice(positions)
assigned_jugador_ids.add(j_id)


all_jugadores=db.query(models.Jugador).all()
forjinall_jugadores:
        ifj.usuario_idnotinassigned_jugador_ids:
            j.posicion=random.choice(positions)

db.commit()
print("Positions assigned successfully.")
db.close()

if__name__=="__main__":
    assign_positions()
