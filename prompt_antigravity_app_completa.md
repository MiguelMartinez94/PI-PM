# Tarea: completar la aplicación de punta a punta (Móvil + Web + API + Base de Datos)

## 1. Rol y objetivo

Eres el ingeniero full-stack autónomo responsable de dejar esta aplicación 100% funcional de punta a punta: base de datos (PostgreSQL), API (FastAPI), interfaz web (Flask + HTML/CSS) e interfaz móvil (React Native). Tu única fuente de verdad sobre lo que hay que construir es la lista de requerimientos de este documento, organizada por rol (Jugador, Entrenador, Árbitro, Administrador). Un requerimiento NO está terminado hasta que funcione con datos reales de la base de datos, consumidos a través de la API, en la plataforma correspondiente (móvil o web) y en su navegación hacia/desde las demás pantallas relacionadas. No se acepta una versión parcial, simulada o "de mentiritas" de ningún requerimiento.

## 2. Ciclo de trabajo obligatorio (no te detengas entre requerimientos)

Repite este ciclo para cada requerimiento de las secciones 7 a 10, uno por uno y en orden, sin detenerte ni pedirme confirmación entre uno y otro:

1. Toma el primer requerimiento que no esté marcado como verificado.
2. Pruébalo de punta a punta: crea o usa un usuario de prueba con el rol correspondiente, ejecuta la acción desde la interfaz real (móvil o web), confirma que se ejecuta la llamada a la API correspondiente, verifica que el dato haya quedado correctamente escrito o leído en PostgreSQL, y confirma que la navegación hacia y desde las pantallas relacionadas ocurre correctamente.
3. Si algo no existe o no funciona (backend, frontend o base de datos), constrúyelo o corrígelo tú mismo, respetando las restricciones técnicas de la sección 4.
4. No des un requerimiento por cumplido sólo porque "se ve bien" visualmente: debe consumir y persistir datos reales a través de la API, no datos de ejemplo ni hardcodeados.
5. Vuelve a este documento y repite desde el paso 1 con el siguiente requerimiento pendiente.
6. Sólo puedes considerar el trabajo terminado cuando TODOS los requerimientos de los 4 roles (Jugador, Entrenador, Árbitro y Administrador) estén verificados y funcionando end-to-end. Si te topas con un bloqueo real de diseño (no una simple duda menor), resuélvelo con tu propio criterio siguiendo el espíritu de los requerimientos y continúa; no te detengas a mitad de camino a preguntarme.

## 3. Plan de implementación (antes de programar)

Antes de escribir o modificar una sola línea de código, genera tu Task Plan enumerando CADA requerimiento de los 4 roles como una tarea individual — no los agrupes ni los resumas en 4 tareas grandes de "hacer Jugador", "hacer Web", etc. Por cada tarea del plan indica: qué necesita a nivel de base de datos (tablas/columnas nuevas o existentes), qué endpoint(s) de la API involucra o crea, qué pantalla(s) de móvil o web afecta, y con qué otras pantallas se conecta por navegación. Este plan debe reflejar explícitamente que el alcance es la aplicación completa (los 4 roles, todas sus pantallas), no una versión resumida. Una vez generado el plan, continúa directamente con el ciclo de la sección 2 sin esperar una aprobación adicional de mi parte.

## 4. Restricciones técnicas y permisos

Tienes mi autorización para ejecutar cualquier comando necesario para que la ejecución de estas pruebas no se detenga hasta que hayas cumplido con todos los requerimientos.

- Puedes modificar el proyecto de FastAPI siempre y cuando respetes la estructura que ya está definida.
- Puedes modificar interfaces de HTML y estilo CSS del proyecto de Flask si el requerimiento lo requiere.
- Puedes usar cualquier librería que permita que los requerimientos se cumplan, siempre y cuando sea a base de los siguientes lenguajes: Python o JS.
- Puedes modificar la base de datos de PostgreSQL para crear bases de datos, crear tablas y modificarlas según los requerimientos.
- Puedes modificar las screens y todo lo necesario dentro del proyecto móvil con React Native; procura usar los siguientes componentes nativos: StyleSheet, SafeAreaView, ScrollView, Pressable, Switch, TextInput, Alert, FlatList, SectionList, ImageBackground, SplashScreen, ActivityIndicator, KeyboardAvoidingView, Modal, BottomSheet.
- Aún no crearemos una estructura con Docker hasta que yo dé la orden.

## 5. Integración obligatoria entre capas (esto es lo que se ha estado saltando)

- Elimina los datos y la información que se ha colocado en las interfaces que es meramente de ejemplo, en móvil y en web, y reemplázala por los datos correspondientes que se deben consumir desde la base de datos a través de la API. Ninguna pantalla puede quedarse mostrando datos simulados o hardcodeados.
- Toda acción del usuario (registrar, crear, editar, eliminar, aceptar, rechazar, pagar arbitraje, iniciar partido, registrar evento, generar emparejamientos, etc.) debe persistir realmente en PostgreSQL mediante un endpoint de la API; nada puede quedar simulado únicamente en el frontend.
- El manejo de estados de usuario (administrador, jugador, árbitro o entrenador) debe estar centralizado en la API y reflejarse correctamente tanto en la web como en el móvil.
- Debe existir un único sistema de Login compartido a nivel de API, adaptado en su interfaz para cada dispositivo (web o móvil), que redirija a cada usuario a la experiencia correspondiente a su rol.
- La navegación entre pantallas debe quedar completamente enlazada en ambos proyectos: cada botón, tarjeta o enlace mencionado en los requerimientos (ej. "ver detalles", "gestionar torneos", "ver todos", "postularse") debe llevar realmente a la pantalla correcta con los datos correctos, no sólo existir de forma visual.
- El UI/UX debe ser consistente en todo el proyecto (móvil y web): mismos criterios para estados de carga, estados vacíos (ej. jugador sin equipo, entrenador sin equipo creado), mensajes de error y confirmaciones.

## 6. Requerimientos generales

- Manejo de estados de usuarios para determinar si es administrador, jugador, árbitro o entrenador.
- Tener acceso a través de un sólo Login adaptado para cada dispositivo, web o móvil.

## 7. Rol de Jugador (Móvil)

- Crear cuenta como jugador = Registro (Poder registrar datos como nombre, correo, teléfono, posición (en un select), contraseña y subir su foto de perfil).
- La screen general de los jugadores es que tendrán una barra inferior con 4 botones (inicio, mi equipo, unirse y perfil).
- La sección de "Inicio" mostrará los partidos que tiene el jugador próximos, mostrando únicamente un botón de ver detalles, la fecha de este encuentro y los equipos involucrados, dentro de la interfaz para mostrar estos detalles son los anteriores incluyendo la plantilla de jugadores de los dos equipos, donde se muestre la foto de perfil de los jugadores, su nombre y su posición, además de una screen para pagar arbitraje de ese partido en especifico, se podrá seleccionar alguna tarjeta ya guardada o ingresar los datos de la tarjeta como nombre del titular, el numero de tarjeta, el año de vencimiento y el cvv, en la parte superior de la screen de pago de arbitraje es que se verá el monto a pagar, al finalizar el pago del arbitraje es que se mostrará un mensaje en una screen distinta para confirmar el pago de arbitraje.
- Si el jugador no tiene un equipo aún en la sección de "Inicio" se mostrará una sugerencia para ir a la pestaña de "Unirse" y escoger un equipo para unirse a él.
- La sección de "Mi Equipo" mostrará los jugadores que están en tu equipo, sus nombres, foto y posición, así como una pestaña para ver la alineación que el entrenador ha designado para el próximo partido mostrando el formato de alineación ejemplo: 4-3-3, etc., la foto del jugador y su nombre en un campo de futbol usado como croquis, dentro de esta sección se podrá ver el nombre del entrenador y a qué sede pertenecen.
- En la sección "Unirse" se podrán ver los equipos creados por los entrenadores, en forma de tarjetas se mostrarán los equipos con información como su nombre del equipo, su sede y un botón para ver detalles del equipo, después en la screen de detalles del equipo se verán el nombre del entrenador, la sede, los jugadores con foto, nombre y posición y en la parte de abajo un botón para postularse al equipo.
- En la sección de perfil es que los jugadores podrán ver sus datos de registro y podrán modificarlos, además de cerrar sesión.

## 8. Rol de Entrenador (Móvil)

- Crear cuenta como entrenador = Registro (poder registrar datos como nombre, correo, teléfono, contraseña y foto de perfil).
- La screen general de los entrenadores tendrá una barra inferior con 4 botones (Mi equipo, Sedes, Crear Equipo y Perfil).
- La sección de "Mi Equipo" permitirá ver en una serie de 3 pestañas la "Alineación" de nuestros jugadores mostrándolos en el campo en su posición designada, además de que se podrá seleccionar a cualquier jugador y que se despliegue un bottomsheet que permita ver los demás jugadores del equipo y poder seleccionar a un jugador para reemplazarlo por otro, los "Jugadores" que nos permite ver a los jugadores del equipo en otra screen con la opción de expulsarlos del equipo, las "Solicitudes" que son peticiones de otros jugadores para poder unirse a nuestro equipo, en esta sección de "Mi Equipo" sólo podrá ser visible todo lo anterior mencionado si es que ya se creó un equipo, sino aparecerá una sugerencia de acudir a la sección de "Crear Equipo".
- La sección de "Sedes" nos permite ver las sedes que existen mostrando el nombre de la sede y su locación además de un botón para ver más detalles de la sede, en la siguiente screen de los detalles podremos ver los torneos que se estarán jugando y podremos postular a nuestro equipo.
- En la sección de "Crear Equipo" es una screen que permite cargar la foto del logo del escudo del equipo, el nombre y determinar la cantidad de jugadores máximos que va a haber dentro del equipo.
- En la sección de "Perfil" es que los entrenadores podrán ver sus datos de registro y podrán modificarlos, además de cerrar sesión.

## 9. Rol de Árbitro (Móvil)

- Crear una cuenta como Árbitro = Registro (poder registrar nombre, correo, teléfono, contraseña, algún certificado de árbitro que sea opcional y una foto de perfil).
- La screen general de los árbitros tendrá una barra inferior con 3 botones (Inicio, Sedes y Perfil).
- En la sección de "Inicio" se mostrarán tarjetas que indiquen los partidos en los que participará el Árbitro, indicando el nombre de la sede, la hora, los equipos que se van a enfrentar y botón para iniciar el partido, en la siguiente screen después de haber iniciado el partido se mostrará el "Control de Partido" que mostrará los datos del partido a disputar, un checklist sobre las alineaciones visitantes y locales, el pago de arbitraje de parte local y visitante, por último un botón para empezar el partido, una vez comenzado el partido se mostrará únicamente una nueva screen que será para poder registrar eventos durante el partido con el contador funcional del tiempo, el marcador en tiempo real del partido, una sección para presionar botones con los nombres de los eventos que pueden pasar en un partido, como lo son: goles, faltas, amarillas, rojas, fueras de lugar, penaltis y agregar tiempo, todo lo anterior funcionando correctamente, el árbitro tendrá oportunidad de en esa misma screen visualizar otra pestaña que contendrá el contador de tiempo del partido, el marcador y una tabla con las estadísticas generales de los dos equipos (tiros a gol, tiros de esquina, faltas, tarjetas amarillas y rojas) y en otra pestaña de esta misma tabla los eventos en forma cronológica mostrando el responsable de cierto evento (nombre del jugador) y el minuto en que se marcó, para seleccionar cada uno de los eventos se mostrará un bottomsheet para seleccionar el jugador responsable del evento permitiendo ver jugadores de uno u otro equipo, al final de esta screen se podrá ver el botón para terminar el partido y de inmediato mostrará un resumen con la tabla anterior de estadísticas y los eventos.
- En la sección de "Sedes", el árbitro podrá ver las sedes que se encuentran con torneos, ver los detalles de la sede para postularse a cada uno de los partidos.
- En la sección de perfil es que los árbitros podrán ver sus datos de registro y podrán modificarlos, además de cerrar sesión.

## 10. Rol de Administrador (Web)

- Iniciar sesión como administrador = Login (poder ingresar el correo electrónico y la contraseña, con un ícono para mostrar/ocultar la contraseña y un enlace de "¿Olvidaste tu contraseña?"). La pantalla de login se divide en dos paneles: el panel izquierdo con fondo oscuro muestra el nombre de la plataforma, un eslogan descriptivo de la app y una fotografía de un estadio; el panel derecho con fondo claro contiene el formulario de acceso con un mensaje de bienvenida, los campos de correo electrónico y contraseña, el botón "Iniciar sesión" y, debajo, un texto que indica que el acceso está restringido a personal autorizado, además del número de versión de la aplicación.
- La pantalla general del administrador cuenta con un menú lateral izquierdo fijo con 7 secciones (Dashboard, Sedes, Torneos, Horarios, Equipos, Clasificación y Configuración), cada una con su ícono, resaltando en color vino la sección en la que se encuentra el administrador. En la parte superior de cada pantalla hay una barra de búsqueda (cuyo texto de ejemplo cambia según la sección, por ejemplo "Buscar equipos..." dentro de la sección de Equipos), un ícono de notificaciones (con un punto rojo cuando existen notificaciones sin leer), un ícono de ayuda y, en la esquina superior derecha, la foto de perfil del administrador junto a su nombre y su cargo dentro de la plataforma.

**Dashboard**
- La sección de "Dashboard" muestra un resumen general de la operación de la liga, saludando al administrador y presentando un botón de acceso directo "+ New Match" para crear un partido nuevo en cualquier momento. Se muestran 4 tarjetas con estadísticas generales: Sedes Activas (con un indicador de incremento respecto al periodo anterior), Torneos en Curso, Equipos Registrados (con indicador de incremento) y Partidos de Esta Semana. Debajo se presenta la tabla de "Próximos Partidos del Día" con las columnas Hora, Equipos, Sede (incluyendo el número de cancha entre paréntesis) y Estado (Por comenzar, Programado), además de un enlace "Ver todos" para ir al listado completo de partidos. En un panel aparte se listan los "Torneos Activos", mostrando por cada uno su nombre, la cantidad de equipos inscritos sobre el cupo total, una barra de progreso de inscripción y una etiqueta de estado (Inscripciones abiertas, En curso - Fecha X, Cierra en X días), junto con un enlace de "Gestionar Torneos". También se incluye una gráfica de barras de "Partidos por Semana" con un filtro de periodo (ej. últimas 4 semanas) y, por último, un panel de "Avisos Importantes" que notifica situaciones que requieren atención (ej. equipos pendientes de validación de pago) junto con un botón de acción directa para resolver dicho aviso (ej. "Revisar Pagos").

**Sedes**
- La sección de "Sedes" lista, en formato de tarjetas, todas las sedes registradas, mostrando por cada una: una fotografía de la instalación, una etiqueta de estado (Activa/Inactiva), el nombre de la sede, su dirección (con ícono de ubicación) y la cantidad de canchas o campos disponibles, además de un botón "Editar" y un botón que alterna entre "Desactivar" y "Activar" según el estado actual de esa sede. En la parte superior hay un botón "+ Agregar nueva sede" que da acceso al formulario de registro.
- Al registrar una nueva sede se abre la pantalla "Registrar Sede", donde se debe ingresar: el nombre de la sede, el teléfono de contacto, la dirección, la ciudad/estado, la cantidad de canchas/campos (mediante un control de + y - para aumentar o disminuir el número), el horario de apertura y cierre (mediante selectores de hora) y una fotografía de la sede (una zona de arrastrar y soltar que acepta formatos SVG, PNG, JPG o GIF con un tamaño máximo de 800x400px), así como una descripción/amenidades en un campo de texto libre para detallar aspectos como el estacionamiento disponible o el tipo de césped. Al final del formulario están los botones "Cancelar" y "Guardar sede".

**Torneos**
- La sección de "Torneos" permite crear un nuevo torneo mediante un formulario que solicita: el nombre del torneo, la sede (en un select), el formato del torneo (en un select), la fecha de inicio, la fecha de fin y la cantidad de equipos participantes, además de un campo de notas/reglas especiales (con un ícono de información). Se muestra una nota indicando que todo torneo creado requiere la aprobación de un comité disciplinario antes de poder publicarse, y al final del formulario están los botones "Cancelar" y "Crear torneo".
- Dentro de cada torneo el administrador puede gestionar la aceptación de los equipos inscritos: se muestra el estado de las inscripciones (ej. Inscripciones Abiertas), una barra de progreso que indica cuántos equipos han sido aceptados de un cupo máximo, y un botón para "Cerrar inscripciones". En la sección de "Solicitudes Pendientes" (con un contador del total) se presenta una tarjeta por cada equipo que solicitó su inscripción, mostrando el logo del equipo, su nombre, el nombre del entrenador, la zona del equipo, la cantidad de jugadores registrados y la fecha de solicitud (o, en su lugar, una advertencia de documentación faltante cuando el equipo no ha completado sus requisitos), junto con los botones "Aceptar" y "Rechazar". De forma paralela, la sección de "Equipos Aceptados" (con su propio contador) lista en una tabla el logo, nombre y estado de cada equipo ya aceptado, con un enlace para ver el listado completo.
- Una vez cerrada la inscripción, el administrador puede generar los emparejamientos de la fase de grupos: en un panel de "Equipos sin Asignar" se listan de forma arrastrable (drag and drop) todos los equipos participantes, mientras que en el panel de "Asignación de Grupos" existen recuadros por cada grupo (Grupo A, Grupo B, etc., cada uno mostrando cuántos equipos lleva de su cupo) donde se sueltan los equipos, además de un contador general de equipos que faltan por asignar. Debajo se muestra la tabla de "Emparejamientos de Partidos" con las columnas de número de partido, grupo, equipo local, equipo visitante y fecha/hora (editable), un botón para "Generar emparejamientos" de forma automática y un botón para exportar el cruce en PDF.
- En la fase final del torneo se visualiza un "Cuadro de Eliminatorias" organizado por rondas en columnas (ej. Octavos, Cuartos, Semifinal, Final), donde cada enfrentamiento muestra el logo y nombre de los dos equipos, el marcador si el partido ya se jugó (o la etiqueta "TBD" cuando los equipos aún no están definidos), un botón de "Set Score" para capturar el resultado en los partidos ya definidos y la fecha/hora programada para los partidos pendientes. Existe además un botón de "Exportar bracket" para descargar el cuadro completo del torneo.

**Horarios**
- La sección de "Horarios de Partidos" permite alternar entre una vista de "Calendario" y una vista de "Lista", además de un botón "+ Nuevo Partido" para agendar un encuentro nuevo. Cuenta con filtros de fecha/periodo, jornada (semana) y día de la semana, junto con un botón de "Aplicar filtros". La vista de calendario presenta una grilla con las horas en el eje vertical (en formato GMT) y los días de la semana con su fecha en el eje horizontal, ubicando cada partido programado en la celda correspondiente junto con la información de la jornada, los equipos que se enfrentan, la sede (con ícono de ubicación) y la hora del encuentro. Cada partido se distingue con un color según su estado: Programado (azul), Confirmado (verde) y Finalizado (gris), mostrando su respectiva leyenda al pie de la pantalla; también pueden aparecer partidos marcados como "Amistoso" para encuentros que están fuera de la jornada oficial de un torneo.

**Equipos**
- La sección de "Gestión de Equipos" lista en una tabla todos los equipos registrados en la plataforma, con las columnas: Logo, Nombre, Entrenador, Cantidad de Jugadores, Torneo Actual (o la etiqueta "Off-season"/sin asignar cuando el equipo no participa en ningún torneo activo) y Estado (Activo/Inactivo), además de una columna de acciones con un enlace "Ver detalles" y un ícono para editar la información del equipo. Cuenta con un buscador de equipos, un botón "+ Añadir Equipo" y una paginación al pie de la tabla que indica cuántos equipos se están mostrando del total registrado.

**Clasificación**
- La sección de "Tabla de Clasificación" muestra una etiqueta de la temporada activa y el nombre del torneo o campeonato en curso. Cuenta con pestañas para alternar entre los distintos grupos del torneo (Grupo A, B, C, D) y una tabla con las columnas: Posición, Equipo (con su logo), PJ (Partidos Jugados), G (Ganados), E (Empatados), P (Perdidos), GF (Goles a Favor), GC (Goles en Contra), DG (Diferencia de Goles) y PTS (Puntos). Las filas se resaltan según corresponda: el primer lugar con un color dorado, los equipos en zona de clasificación en verde y los equipos en zona de eliminación en rojo, mostrando su respectiva leyenda de colores al pie de la tabla. Además cuenta con un botón para "Exportar PDF" de la tabla y un botón de "Edit Points" que permite al administrador ajustar manualmente los puntos de un equipo, mostrando también la fecha y hora de la última actualización de la tabla.

## 11. Checklist final de verificación (Definition of Done)

No des el trabajo por terminado hasta poder marcar todo lo siguiente con datos reales verificados en la base de datos:

**Jugador (Móvil)**
- [ ] Registro completo (nombre, correo, teléfono, posición, contraseña, foto) persistido en BD.
- [ ] Tab bar de 4 botones funcional (Inicio, Mi Equipo, Unirse, Perfil).
- [ ] "Inicio": partidos próximos reales, detalle con plantillas de ambos equipos, pago de arbitraje (tarjeta guardada o nueva) y screen de confirmación.
- [ ] Sugerencia de unirse a un equipo cuando el jugador no tiene equipo.
- [ ] "Mi Equipo": jugadores del equipo, alineación designada por el entrenador sobre croquis de cancha, nombre del entrenador y sede.
- [ ] "Unirse": listado de equipos reales, detalle de equipo y postulación funcional.
- [ ] "Perfil": ver/editar datos y cerrar sesión.

**Entrenador (Móvil)**
- [ ] Registro completo persistido en BD.
- [ ] Tab bar de 4 botones funcional (Mi Equipo, Sedes, Crear Equipo, Perfil).
- [ ] "Mi Equipo" con sus 3 pestañas (Alineación con bottomsheet de reemplazo, Jugadores con expulsión, Solicitudes) sólo visibles si existe equipo creado; sugerencia hacia "Crear Equipo" si no existe.
- [ ] "Sedes": listado real, detalle con torneos disponibles y postulación de equipo.
- [ ] "Crear Equipo": logo, nombre y máximo de jugadores persistidos en BD.
- [ ] "Perfil": ver/editar datos y cerrar sesión.

**Árbitro (Móvil)**
- [ ] Registro completo (incluyendo certificado opcional) persistido en BD.
- [ ] Tab bar de 3 botones funcional (Inicio, Sedes, Perfil).
- [ ] "Inicio": partidos asignados reales, "Control de Partido" con checklist de alineaciones y pagos de arbitraje, botón de inicio de partido.
- [ ] Registro de eventos en vivo (goles, faltas, amarillas, rojas, fuera de lugar, penaltis, tiempo agregado) con marcador y cronómetro funcionando, persistidos en BD, con bottomsheet de selección de jugador.
- [ ] Pestaña de estadísticas generales (tiros a gol, corners, faltas, tarjetas) y pestaña de eventos cronológicos.
- [ ] Fin de partido con resumen de estadísticas y eventos.
- [ ] "Sedes": listado real y postulación a partidos.
- [ ] "Perfil": ver/editar datos y cerrar sesión.

**Administrador (Web)**
- [ ] Login funcional contra la API, con manejo de sesión y redirección por rol.
- [ ] Dashboard con estadísticas reales (sedes activas, torneos en curso, equipos registrados, partidos de la semana), próximos partidos, torneos activos, gráfica de partidos por semana y avisos importantes.
- [ ] Sedes: listado real, alta/edición/activación-desactivación persistida en BD.
- [ ] Torneos: creación, aceptación/rechazo de equipos, generación de emparejamientos por grupo y cuadro de eliminatorias, todo persistido y navegable entre sí.
- [ ] Horarios: vista calendario/lista con filtros funcionales y partidos reales.
- [ ] Equipos: listado, búsqueda, alta y detalle reales.
- [ ] Clasificación: tabla por grupo con datos reales y edición manual de puntos persistida.
