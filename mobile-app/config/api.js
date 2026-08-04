import { Platform } from 'react-native';

const getApiBaseUrl = () => {
  if (process.env.EXPO_PUBLIC_API_BASE_URL) return process.env.EXPO_PUBLIC_API_BASE_URL;
  if (typeof window !== 'undefined' && window.location?.hostname) {
    return `http://${window.location.hostname}:8001`;
  }
  if (Platform.OS === 'android') {
    return 'http://10.0.2.2:8001';
  }
  return 'http://localhost:8001';
};

export const API_BASE = getApiBaseUrl();

export const getImageUrl = (url) => {
  if (!url) return null;
  if (url.startsWith('http://') || url.startsWith('https://')) return url;
  if (url.startsWith('/')) return `${API_BASE}${url}`;
  return `${API_BASE}/${url}`;
};

export const API = {
  login: `${API_BASE}/auth/login`,
  upload: `${API_BASE}/upload`,
  registroJugador: `${API_BASE}/auth/registro/jugador`,
  registroEntrenador: `${API_BASE}/auth/registro/entrenador`,
  registroArbitro: `${API_BASE}/auth/registro/arbitro`,
  jugadorAgenda: `${API_BASE}/jugadores/agenda`,
  jugadorEquipos: `${API_BASE}/jugadores/equipos-disponibles`,
  jugadorMiEquipo: `${API_BASE}/jugadores/mi-equipo`,
  jugadorPerfil: `${API_BASE}/jugadores/perfil`,
  jugadorEquipo: (id) => `${API_BASE}/jugadores/equipo/${id}`,
  jugadorUnirse: (id) => `${API_BASE}/jugadores/equipo/${id}/unirse`,
  jugadorConfirmarAsistencia: (partidoId) => `${API_BASE}/jugadores/partido/${partidoId}/confirmar-asistencia`,
  entrenadorMisEquipos: `${API_BASE}/entrenadores/equipos/mis-equipos`,
  entrenadorCrearEquipo: `${API_BASE}/entrenadores/equipos`,
  entrenadorSedes: `${API_BASE}/entrenadores/sedes`,
  entrenadorSedeTorneos: (sedeId) => `${API_BASE}/entrenadores/sedes/${sedeId}/torneos`,
  entrenadorInscribirTorneo: (torneoId) => `${API_BASE}/entrenadores/torneos/${torneoId}/inscribir`,
  entrenadorProximoPartido: (equipoId) => `${API_BASE}/entrenadores/equipos/${equipoId}/proximo-partido`,
  entrenadorPartidos: (equipoId) => `${API_BASE}/entrenadores/equipos/${equipoId}/partidos`,
  entrenadorSolicitudes: (equipoId) => `${API_BASE}/entrenadores/equipos/${equipoId}/solicitudes`,
  entrenadorResponderSolicitud: (id) => `${API_BASE}/entrenadores/solicitudes/${id}`,
  entrenadorJugadores: (equipoId) => `${API_BASE}/entrenadores/equipos/${equipoId}/jugadores`,
  entrenadorExpulsarJugador: (equipoId, jugadorId) =>
    `${API_BASE}/entrenadores/equipos/${equipoId}/jugadores/${jugadorId}`,
  entrenadorAlineacion: (equipoId) => `${API_BASE}/entrenadores/equipos/${equipoId}/alineacion`,
  entrenadorPerfil: `${API_BASE}/entrenadores/perfil`,
  arbitroMisPartidos: `${API_BASE}/arbitros/mis-partidos`,
  arbitroSedes: `${API_BASE}/arbitros/sedes`,
  arbitroPostularSede: (sedeId) => `${API_BASE}/arbitros/sedes/${sedeId}/postular`,
  arbitroPartido: (partidoId) => `${API_BASE}/arbitros/partido/${partidoId}`,
  arbitroIniciarPartido: (partidoId) => `${API_BASE}/arbitros/partido/${partidoId}/iniciar`,
  arbitroFinalizarPartido: (partidoId) => `${API_BASE}/arbitros/partido/${partidoId}/finalizar`,
  arbitroPartidoJugadores: (partidoId) => `${API_BASE}/arbitros/partido/${partidoId}/jugadores`,
  arbitroPartidoEstadisticas: (partidoId) => `${API_BASE}/arbitros/partido/${partidoId}/estadisticas`,
  arbitroPartidoEvento: (partidoId) => `${API_BASE}/arbitros/partido/${partidoId}/evento`,
  arbitroPerfil: `${API_BASE}/arbitros/perfil`,
};
