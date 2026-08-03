"""
Lee el backup y extrae bloques COPY limpiando lineas corruptas.
Una linea corrupta es aquella donde los datos estan mezclados (sin separador de linea propio).
"""

raw = open('respaldo.sql', 'rb').read()

# Dividir por el separador UTF-16LE CRLF: 0D 0A 00
separator = b'\x0d\x0a\x00'
parts = raw.split(separator)

lines = []
for part in parts:
    if len(part) % 2 == 0:
        lines.append(part.decode('utf-16-le', errors='replace'))
    else:
        # Byte desalineado, agregar null pad
        lines.append((part + b'\x00').decode('utf-16-le', errors='replace'))

# Encontrar bloques COPY y extraer su contenido
in_copy = False
current_table = ''
copy_blocks = {}

for line in lines:
    stripped = line.strip()
    if stripped.startswith('COPY ') and 'FROM stdin' in stripped:
        # Extraer nombre de tabla
        import re
        m = re.search(r'COPY (?:public\.)?(\w+)', stripped)
        if m:
            current_table = m.group(1)
            copy_blocks[current_table] = []
        in_copy = True
        continue
    if stripped == '\\.' and in_copy:
        in_copy = False
        current_table = ''
        continue
    if in_copy and current_table:
        copy_blocks[current_table].append(line.rstrip('\n').rstrip('\r'))

# Mostrar tablas que nos interesan
for table in ['roles', 'categorias', 'equipos', 'sedes', 'canchas']:
    print(f"\n=== {table} ===")
    rows = copy_blocks.get(table, [])
    for r in rows:
        print(repr(r))
