"""
Script definitivo: convierte respaldo.sql (UTF-16LE Windows) a SQL limpio para Neon.
El archivo tiene saltos de linea Windows (CRLF = 0x0D 0x0A 0x00 en UTF-16LE).
Los caracteres especiales (ñ, á, é, etc.) se corrompen porque la exportacion
mezclo encoding dentro de bloques COPY (datos).

Estrategia: 
- Leer el archivo completo como bytes
- Dividir en bloques usando el separador UTF-16LE de salto de linea
- Decodificar cada par de bytes como UTF-16LE, luego limpiar artefactos
"""

raw = open('respaldo.sql', 'rb').read()

# El separador de linea en UTF-16LE es: 0x0D 0x00 0x0A 0x00
# Pero en el archivo es: 0x0D 0x0A 0x00 (CRLF de Windows mezclado)
# Esto causa que cuando hay un byte 0x0A seguido de 0x00, 
# la siguiente linea empiece alineada correctamente.
# Sin embargo, 0x0D 0x0A (sin 0x00) desalinea el stream UTF-16.

# Paso 1: Dividir a nivel de bytes, buscando 0x0D 0x0A 0x00
# que es el CRLF de Windows escrito en un stream UTF-16LE
separator = b'\x0d\x0a\x00'
parts = raw.split(separator)

decoded_lines = []
for i, part in enumerate(parts):
    # Si el part tiene numero impar de bytes, hay un desalineamiento
    # Intentar decodificar y manejar el resultado
    if len(part) % 2 == 0:
        try:
            line = part.decode('utf-16-le', errors='replace')
            decoded_lines.append(line)
        except Exception:
            decoded_lines.append(part.decode('ascii', errors='replace'))
    else:
        # Byte extra al inicio - intentar saltar o agregar padding
        if part and part[0:1] == b'\x0a':
            # Un 0x0A extra, saltar
            rest = part[1:]
            if len(rest) % 2 == 0:
                line = rest.decode('utf-16-le', errors='replace')
            else:
                line = rest.decode('ascii', errors='replace')
            decoded_lines.append(line)
        else:
            # Pad con un byte nulo
            padded = part + b'\x00'
            try:
                line = padded.decode('utf-16-le', errors='replace')
            except Exception:
                line = part.decode('ascii', errors='replace')
            decoded_lines.append(line)

content = '\n'.join(decoded_lines)

# Limpiar caracteres de reemplazo masivos (indica bloques de datos corruptos)
# Quedarnos solo con las partes SQL validas
clean_lines = []
for line in content.split('\n'):
    stripped = line.strip()
    # Saltar lineas vacias
    if not stripped:
        continue
    # Saltar comandos backslash psql excepto \.
    if stripped.startswith('\\') and stripped != '\\.':
        continue
    # Saltar lineas con muchos caracteres de reemplazo (datos corruptos)
    # Un dato corrupto tiene muchos \ufffd o caracteres extraños
    replacement_ratio = line.count('\ufffd') / max(len(line), 1)
    if replacement_ratio > 0.3:
        continue
    clean_lines.append(line)

result = '\n'.join(clean_lines)

with open('respaldo_import.sql', 'w', encoding='utf-8') as f:
    f.write(result)

print(f"Generado respaldo_import.sql")
print(f"Lineas originales: {len(decoded_lines)}")
print(f"Lineas limpias: {len(clean_lines)}")

# Revisar datos de equipos
idx = result.find('COPY public.equipos')
if idx != -1:
    print("\n--- Bloque COPY equipos ---")
    print(repr(result[idx:idx+400]))
