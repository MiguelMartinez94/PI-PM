importos
importsys

fromdb.databaseimportSessionLocal
frommodelsimportmodels

defupdate_logos():
    db=SessionLocal()
equipos=db.query(models.Equipo).all()


logos={
"anahuac":"ANAHUAC.png",
"anáhuac":"ANAHUAC.png",
"itq":"ITQ.png",
"tecmilenio":"TECMILENIO.png",
"uaq":"UAQ.png",
"unaq":"UNAQ.png",
"upq":"UPQ.png",
"uteq":"UTEQ.png",
"uvm":"UVM.png",
}

forequipoinequipos:
        name_lower=equipo.nombre.strip().lower()
ifname_lowerinlogos:
            equipo.escudo_url="/uploads/equipos/"+logos[name_lower]
print(f"Updated {equipo.nombre} with logo {equipo.escudo_url}")
else:
            print(f"Team {equipo.nombre} did not match any known logos.")

db.commit()
db.close()

if__name__=="__main__":
    update_logos()
