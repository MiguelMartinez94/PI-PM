fromfastapiimportFastAPI
fromfastapi.middleware.corsimportCORSMiddleware
importtime
fromsqlalchemy.excimportOperationalError

fromdb.databaseimportengine,Base
fromroutersimportauth_router,administrativos,arbitros,jugadores,entrenadores


definit_db():
    retries=5
whileretries>0:
        try:
            Base.metadata.create_all(bind=engine)
print("Database connected and tables created.")
break
exceptOperationalError:
            print("Database not ready yet, retrying in 2 seconds...")
time.sleep(2)
retries-=1

init_db()

app=FastAPI(title="API Torneos de Fútbol",description="Backend para la gestión de torneos deportivos",version="1.0.0")


app.add_middleware(
CORSMiddleware,
allow_origins=["*"],
allow_credentials=True,
allow_methods=["*"],
allow_headers=["*"],
)


fromfastapi.staticfilesimportStaticFiles
fromfastapiimportUploadFile,File
importos
importshutil
importuuid


UPLOAD_DIR="uploads"
os.makedirs(UPLOAD_DIR,exist_ok=True)
app.mount("/uploads",StaticFiles(directory=UPLOAD_DIR),name="uploads")

app.include_router(auth_router.router)
app.include_router(administrativos.router)
app.include_router(arbitros.router)
app.include_router(jugadores.router)
app.include_router(entrenadores.router)

@app.post("/upload")
defupload_file(file:UploadFile=File(...)):
    file_extension=file.filename.split(".")[-1]
file_name=f"{uuid.uuid4()}.{file_extension}"
file_path=os.path.join(UPLOAD_DIR,file_name)
withopen(file_path,"wb")asbuffer:
        shutil.copyfileobj(file.file,buffer)
return{"url":f"/uploads/{file_name}"}

@app.get("/")
defread_root():
    return{"message":"Bienvenido a la API de Torneos de Fútbol. Visita /docs para ver la documentación."}
