importos
importre

mobile_dir='mobile-app/screens'

forroot,_,filesinos.walk(mobile_dir):
    forfileinfiles:
        iffile.endswith('.js')orfile.endswith('.ts')orfile.endswith('.tsx'):
            filepath=os.path.join(root,file)
withopen(filepath,'r',encoding='utf-8')asf:
                content=f.read()


new_content=re.sub(r'http://192\.168\.100\.13:8001','http://localhost:8001',content)
new_content=re.sub(r'http://192\.168\.100\.13:8000','http://localhost:8001',new_content)

ifnew_content!=content:
                withopen(filepath,'w',encoding='utf-8')asf:
                    f.write(new_content)
print(f"Updated {filepath} to use localhost:8001")

print("Done updating mobile app URLs to localhost:8001!")
