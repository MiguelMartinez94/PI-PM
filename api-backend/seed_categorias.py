importos
fromsqlalchemyimportcreate_engine
fromsqlalchemy.ormimportsessionmaker
fromdb.databaseimportBase
frommodels.modelsimportCategoria

DATABASE_URL=os.getenv(
"DATABASE_URL",
"postgresql://neondb_owner:npg_j5GMCDdNE0Uu@ep-super-breeze-axu8gq3l-pooler.c-4.us-east-2.aws.neon.tech/neondb?sslmode=require&channel_binding=require"
)
engine=create_engine(DATABASE_URL)
SessionLocal=sessionmaker(autocommit=False,autoflush=False,bind=engine)

defseed_categorias():
    db=SessionLocal()
try:

        Base.metadata.create_all(bind=engine)

cats=[
{"id":1,"nombre":"Masculina","descripcion":"Categoría para hombres"},
{"id":2,"nombre":"Femenina","descripcion":"Categoría para mujeres"}
]

forcincats:
            existente=db.query(Categoria).filter(Categoria.id==c['id']).first()
ifnotexistente:
                nueva_cat=Categoria(id=c['id'],nombre=c['nombre'],descripcion=c['descripcion'])
db.add(nueva_cat)
print(f"Creada categoría {c['nombre']} con ID {c['id']}")
else:
                print(f"Categoría {c['nombre']} ya existe")

db.commit()
print("¡Categorías sembradas con éxito!")
exceptExceptionase:
        print(f"Error sembrando categorías: {e}")
db.rollback()
finally:
        db.close()

if__name__=="__main__":
    seed_categorias()
