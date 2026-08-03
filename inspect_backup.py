raw = open('respaldo.sql','rb').read()
idx = raw.find(b'e\x00q\x00u\x00i\x00p\x00o\x00s\x00')
while True:
    next_idx = raw.find(b'e\x00q\x00u\x00i\x00p\x00o\x00s\x00', idx+1)
    if next_idx == -1:
        break
    idx = next_idx

print("Last 'equipos' at:", idx)
block = raw[idx:idx+300]
print(block.hex())
print("---")
# Decode it
decoded = block.decode('utf-16-le', errors='replace')
print(repr(decoded[:80]))
