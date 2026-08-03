-- Insertar roles
INSERT INTO roles (id, nombre, descripcion) VALUES
(1, 'admin', 'Administrador'),
(2, 'arbitro', 'Arbitro'),
(3, 'jugador', 'Jugador'),
(4, 'entrenador', 'Entrenador')
ON CONFLICT (id) DO NOTHING;

-- Insertar categorias
INSERT INTO categorias (id, nombre, descripcion) VALUES
(1, 'Masculina', 'Categoria para hombres'),
(2, 'Femenina', 'Categoria para mujeres')
ON CONFLICT (id) DO NOTHING;

-- Insertar sedes (solo las limpias sin corrupcion de texto)
INSERT INTO sedes (id, usuario_id, nombre, direccion, activa, creado_en, telefono, ciudad, capacidad, hora_apertura, hora_cierre, foto_url, descripcion) VALUES
(3, 1, 'Prueba foto', 'Instituto Nacional Indigenista 127', true, '2026-08-02 20:16:22.955067+00', '4427102581', 'SANTIAGO DE QUERETARO', 1, '14:16:00', '14:16:00', NULL, 'Ejemplo'),
(5, 1, 'Juan Perez', 'Instituto Nacional Indigenista 127', true, '2026-08-02 20:33:57.717645+00', '00000000', 'SANTIAGO DE QUERETARO', 1, '14:33:00', '14:33:00', NULL, 'prueba ultima'),
(6, 1, 'CURL_TEST', 'Instituto Nacional Indigenista 127', true, '2026-08-02 20:54:34.146548+00', '4421943964', 'SANTIAGO DE QUERETARO', 1, '14:59:00', '14:59:00', '/uploads/7019987b-7d62-41f4-a247-2e046990f802.jpg', 'test'),
(7, 1, 'Flask Proxy Test', 'Desde Admin Web', true, '2026-08-02 21:04:11.516772+00', '5559876543', 'Queretaro', 1, '09:00:00', '18:00:00', '/uploads/bf347c54-279c-43bc-a3b7-78dc12799567.jpg', 'Test'),
(2, 1, 'Sede Test Full', 'Direccion 123', true, '2026-07-30 21:12:33.739382+00', '5551234567', 'CDMX', 4, '10:00:00', '20:00:00', NULL, 'Wifi, estacionamiento'),
(1, 1, 'DOOM', 'Instituto Nacional Indigenista 127', true, '2026-07-30 20:59:04.495973+00', '4421943964', 'SANTIAGO DE QUERETARO', 1, '08:00:00', '22:00:00', NULL, 'Base')
ON CONFLICT (id) DO NOTHING;

-- Insertar equipos (los limpios sin corrupcion)
INSERT INTO equipos (id, entrenador_id, categoria_id, nombre, escudo_url, limite_jugadores, creado_en) VALUES
(15, 28, 1, 'UPQ', '/uploads/equipos/UPQ.png', 20, '2026-07-31 07:27:58.059913+00'),
(16, 29, NULL, 'UAQ', '/uploads/equipos/UAQ.png', 20, '2026-07-31 15:54:03.937411+00'),
(17, 30, NULL, 'ITQ', '/uploads/equipos/ITQ.png', 20, '2026-07-31 15:54:03.937411+00'),
(18, 31, NULL, 'UTEQ', '/uploads/equipos/UTEQ.png', 20, '2026-07-31 15:54:03.937411+00'),
(19, 32, NULL, 'UNAQ', '/uploads/equipos/UNAQ.png', 20, '2026-07-31 15:54:03.937411+00'),
(20, 33, NULL, 'Anahuac', '/uploads/equipos/ANAHUAC.png', 20, '2026-07-31 15:54:03.937411+00'),
(21, 34, NULL, 'UVM', '/uploads/equipos/UVM.png', 20, '2026-07-31 15:54:03.937411+00'),
(22, 35, NULL, 'Tecmilenio', '/uploads/equipos/TECMILENIO.png', 20, '2026-07-31 15:54:03.937411+00')
ON CONFLICT (id) DO NOTHING;

-- Actualizar sequences
SELECT setval('roles_id_seq', (SELECT MAX(id) FROM roles));
SELECT setval('categorias_id_seq', (SELECT MAX(id) FROM categorias));
SELECT setval('sedes_id_seq', (SELECT MAX(id) FROM sedes));
SELECT setval('equipos_id_seq', (SELECT MAX(id) FROM equipos));
