import React, { useEffect, useState } from 'react';
import {
  View, Text, StyleSheet, ScrollView, Alert, ActivityIndicator,
  Modal, TouchableOpacity, FlatList, Platform, TextInput
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Badge from '../../components/Badge';
import { API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS, SHADOWS } from '../../theme/theme';

const EVENT_TYPES = [
  { key: 'Gol',           label: '⚽ Gol',             color: COLORS.success, textColor: COLORS.textPrimary },
  { key: 'Penalti',       label: '🎯 Penalti',         color: COLORS.success, textColor: COLORS.textPrimary },
  { key: 'Falta',         label: '🤚 Falta',           color: COLORS.surfaceLight, textColor: COLORS.textPrimary },
  { key: 'Amarilla',      label: '🟨 Amarilla',        color: COLORS.warning, textColor: COLORS.textPrimary },
  { key: 'Roja',          label: '🟥 Roja',            color: COLORS.error, textColor: COLORS.textPrimary },
  { key: 'Tiro',          label: '🎯 Tiro a Gol',      color: COLORS.surfaceLight, textColor: COLORS.textPrimary },
  { key: 'Tiro_Esquina',  label: '🚩 Tiro de Esquina', color: COLORS.surfaceLight, textColor: COLORS.textPrimary },
  { key: 'Sustitucion',   label: '🔄 Sustitución',     color: COLORS.surfaceLight, textColor: COLORS.textPrimary },
  { key: 'Fuera_Lugar',   label: '🚫 Fuera de Lugar',  color: COLORS.surfaceLight, textColor: COLORS.textPrimary },
  { key: 'Tiempo_Extra',  label: '⏱️ Tiempo Extra',    color: COLORS.surfaceLight, textColor: COLORS.textPrimary },
];

const PartidoEnCursoEventosScreen = ({ route, navigation }) => {
  const partidoId = route.params?.partidoId;
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [partido, setPartido] = useState(null);

  const [sheetVisible, setSheetVisible] = useState(false);
  const [selectedEventType, setSelectedEventType] = useState(null);
  const [sheetStep, setSheetStep] = useState('team');
  const [selectedTeam, setSelectedTeam] = useState(null);
  const [selectedPlayer, setSelectedPlayer] = useState(null);
  const [minute, setMinute] = useState('');

  const [teamsData, setTeamsData] = useState(null);

  const [successModalVisible, setSuccessModalVisible] = useState(false);
  const [lastEvent, setLastEvent] = useState(null);

  const [registeredEvents, setRegisteredEvents] = useState([]);

  useEffect(() => {
    fetchData();
  }, [partidoId]);

  const fetchData = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      const resPartido = await fetch(API.arbitroPartido(partidoId), {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      if (resPartido.ok) {
        const p = await resPartido.json();
        setPartido(p);
      }

      const resJugadores = await fetch(API.arbitroPartidoJugadores(partidoId), {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      if (resJugadores.ok) {
        const data = await resJugadores.json();
        setTeamsData(data);
      }
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  const openEventSheet = (eventType) => {
    setSelectedEventType(eventType);
    if (eventType.key === 'Tiempo_Extra') {
      setSheetStep('minute');
      setSelectedTeam(null);
      setSelectedPlayer(null);
    } else {
      setSheetStep('team');
      setSelectedTeam(null);
      setSelectedPlayer(null);
    }
    setMinute('');
    setSheetVisible(true);
  };

  const selectTeam = (team) => {
    setSelectedTeam(team);
    setSheetStep('player');
  };

  const selectPlayer = (player) => {
    setSelectedPlayer(player);
    setSheetStep('minute');
  };

  const submitEvent = async () => {
    if (!minute || isNaN(parseInt(minute))) {
      if (Platform.OS === 'web') {
        window.alert('Por favor ingresa un número válido (ej. 45 o 3 para tiempo extra).');
      } else {
        Alert.alert('Error', 'Por favor ingresa un número válido.');
      }
      return;
    }

    setSubmitting(true);
    try {
      const token = await AsyncStorage.getItem('userToken');
      
      let equipoId = null;
      if (selectedTeam && teamsData) {
        equipoId = selectedTeam === 'local' ? teamsData.local.equipo_id : teamsData.visita.equipo_id;
      }

      const body = {
        tipo_evento: selectedEventType.key,
        minuto: parseInt(minute),
        equipo_id: equipoId || 0,
        jugador_id: selectedPlayer?.id || null
      };

      const response = await fetch(API.arbitroPartidoEvento(partidoId), {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`
        },
        body: JSON.stringify(body)
      });

      if (response.ok) {
        setSheetVisible(false);
        
        let teamName = 'General';
        if (selectedTeam) {
          teamName = selectedTeam === 'local' ? teamsData.local.nombre : teamsData.visita.nombre;
        }

        const evtDetail = {
          type: selectedEventType,
          team: teamName,
          player: selectedPlayer?.nombre || 'N/A',
          minute: minute
        };
        
        setLastEvent(evtDetail);

        setRegisteredEvents(prev => [{
          id: Date.now(),
          tipo: selectedEventType.key,
          label: selectedEventType.label,
          equipo: teamName,
          jugador: selectedPlayer?.nombre || 'N/A',
          minuto: minute
        }, ...prev]);

        setSuccessModalVisible(true);
      } else {
        const err = await response.json();
        if (Platform.OS === 'web') {
          window.alert('Error: ' + (err.detail || 'Error al registrar evento'));
        } else {
          Alert.alert('Error', err.detail || 'Error al registrar evento');
        }
      }
    } catch (e) {
      if (Platform.OS === 'web') {
        window.alert('Error: Problema de conexión');
      } else {
        Alert.alert('Error', 'Problema de conexión');
      }
    } finally {
      setSubmitting(false);
    }
  };

  const getPlayersForTeam = () => {
    if (!teamsData || !selectedTeam) return [];
    return selectedTeam === 'local' ? teamsData.local.jugadores : teamsData.visita.jugadores;
  };

  if (loading) {
    return (
      <View style={[styles.container, { justifyContent: 'center', alignItems: 'center' }]}>
        <ActivityIndicator size="large" color={COLORS.primary} />
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <ScrollView style={styles.content} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
        {partido && (
          <Card elevated accent style={{ marginBottom: SPACING.m }}>
            <Text style={styles.matchup}>{partido.equipo_local} vs {partido.equipo_visita}</Text>
            <Badge title="En Curso" type="success" />
          </Card>
        )}

        <Text style={styles.sectionTitle}>Registrar Evento</Text>
        <Text style={styles.subtitle}>Selecciona el tipo de evento a registrar</Text>

        <View style={styles.grid}>
          {EVENT_TYPES.map(evt => (
            <TouchableOpacity
              key={evt.key}
              style={[styles.eventBtn, { backgroundColor: evt.color }]}
              onPress={() => openEventSheet(evt)}
              activeOpacity={0.8}
            >
              <Text style={[styles.eventBtnText, { color: evt.textColor }]}>{evt.label}</Text>
            </TouchableOpacity>
          ))}
        </View>

        {registeredEvents.length > 0 && (
          <>
            <Text style={styles.sectionTitle}>Eventos Registrados</Text>
            {registeredEvents.map(evt => (
              <Card elevated key={evt.id} style={{ marginBottom: SPACING.s }}>
                <View style={styles.eventRow}>
                  <View style={styles.minuteBadge}>
                    <Text style={styles.minuteText}>{evt.minuto}'</Text>
                  </View>
                  <View style={{ flex: 1, marginLeft: SPACING.m }}>
                    <Text style={styles.eventLabel}>{evt.label}</Text>
                    {evt.tipo !== 'Tiempo_Extra' && (
                      <Text style={styles.eventDetail}>{evt.jugador} — {evt.equipo}</Text>
                    )}
                  </View>
                </View>
              </Card>
            ))}
          </>
        )}

      </ScrollView>

      {}
      {sheetVisible && (
        <View style={styles.sheetOverlay}>
          <TouchableOpacity style={styles.sheetDismiss} onPress={() => setSheetVisible(false)} />
          <View style={styles.sheetContainer}>
            <View style={styles.sheetHandle} />

            <View style={styles.sheetHeader}>
              <Text style={styles.sheetTitle}>
                {selectedEventType?.label || 'Evento'}
              </Text>
              <TouchableOpacity onPress={() => setSheetVisible(false)} style={{ padding: SPACING.xs }}>
                <Text style={{ fontSize: 20, color: COLORS.textMuted, fontWeight: TYPOGRAPHY.weights.bold }}>✕</Text>
              </TouchableOpacity>
            </View>

            {selectedEventType?.key !== 'Tiempo_Extra' && (
              <>
                <View style={styles.stepIndicator}>
                  <View style={[styles.stepDot, sheetStep === 'team' && styles.stepDotActive]} />
                  <View style={styles.stepLine} />
                  <View style={[styles.stepDot, sheetStep === 'player' && styles.stepDotActive]} />
                  <View style={styles.stepLine} />
                  <View style={[styles.stepDot, sheetStep === 'minute' && styles.stepDotActive]} />
                </View>
                <View style={styles.stepLabels}>
                  <Text style={[styles.stepLabel, sheetStep === 'team' && styles.stepLabelActive]}>Equipo</Text>
                  <Text style={[styles.stepLabel, sheetStep === 'player' && styles.stepLabelActive]}>Jugador</Text>
                  <Text style={[styles.stepLabel, sheetStep === 'minute' && styles.stepLabelActive]}>Minuto</Text>
                </View>
              </>
            )}

            {sheetStep === 'team' && teamsData && selectedEventType?.key !== 'Tiempo_Extra' && (
              <View style={styles.sheetBody}>
                <Text style={styles.sheetQuestion}>¿A qué equipo corresponde?</Text>
                <TouchableOpacity
                  style={[styles.teamOption, { borderColor: COLORS.primary }]}
                  onPress={() => selectTeam('local')}
                >
                  <View style={[styles.teamDot, { backgroundColor: COLORS.primary }]} />
                  <View>
                    <Text style={styles.teamName}>{teamsData.local.nombre}</Text>
                    <Text style={styles.teamRole}>Local</Text>
                  </View>
                </TouchableOpacity>

                <TouchableOpacity
                  style={[styles.teamOption, { borderColor: COLORS.primaryLight }]}
                  onPress={() => selectTeam('visita')}
                >
                  <View style={[styles.teamDot, { backgroundColor: COLORS.primaryLight }]} />
                  <View>
                    <Text style={styles.teamName}>{teamsData.visita.nombre}</Text>
                    <Text style={styles.teamRole}>Visitante</Text>
                  </View>
                </TouchableOpacity>
              </View>
            )}

            {sheetStep === 'player' && selectedEventType?.key !== 'Tiempo_Extra' && (
              <View style={styles.sheetBody}>
                <View style={styles.playerHeader}>
                  <Text style={styles.sheetQuestion}>Selecciona jugador</Text>
                  <TouchableOpacity onPress={() => setSheetStep('team')} style={{ padding: SPACING.xs }}>
                    <Text style={styles.backLink}>← Cambiar equipo</Text>
                  </TouchableOpacity>
                </View>
                <FlatList
                  data={getPlayersForTeam()}
                  keyExtractor={(item) => item.id.toString()}
                  style={{ maxHeight: 280 }}
                  renderItem={({ item }) => (
                    <TouchableOpacity
                      style={styles.playerItem}
                      onPress={() => selectPlayer(item)}
                    >
                      <View style={styles.dorsalBadge}>
                        <Text style={styles.dorsalText}>{item.dorsal}</Text>
                      </View>
                      <View style={{ flex: 1 }}>
                        <Text style={styles.playerName}>{item.nombre}</Text>
                        <Text style={styles.playerPos}>{item.posicion}</Text>
                      </View>
                      <Text style={{ color: COLORS.textMuted, fontSize: 18 }}>›</Text>
                    </TouchableOpacity>
                  )}
                  ListEmptyComponent={
                    <Text style={{ textAlign: 'center', color: COLORS.textMuted, padding: SPACING.l }}>
                      No hay jugadores registrados en este equipo.
                    </Text>
                  }
                />
              </View>
            )}

            {sheetStep === 'minute' && (
              <View style={styles.sheetBody}>
                {selectedEventType?.key !== 'Tiempo_Extra' ? (
                  <>
                    <TouchableOpacity onPress={() => setSheetStep('player')} style={{ padding: SPACING.xs, marginBottom: SPACING.m }}>
                      <Text style={styles.backLink}>← Cambiar jugador</Text>
                    </TouchableOpacity>

                    <View style={styles.summaryCard}>
                      <View style={styles.summaryRow}>
                        <Text style={styles.summaryLabel}>Evento:</Text>
                        <Text style={styles.summaryValue}>{selectedEventType?.label}</Text>
                      </View>
                      <View style={styles.summaryRow}>
                        <Text style={styles.summaryLabel}>Equipo:</Text>
                        <Text style={styles.summaryValue}>
                          {selectedTeam === 'local' ? teamsData?.local.nombre : teamsData?.visita.nombre}
                        </Text>
                      </View>
                      <View style={styles.summaryRow}>
                        <Text style={styles.summaryLabel}>Jugador:</Text>
                        <Text style={styles.summaryValue}>
                          #{selectedPlayer?.dorsal} {selectedPlayer?.nombre}
                        </Text>
                      </View>
                    </View>

                    <Text style={styles.sheetQuestion}>¿En qué minuto ocurrió?</Text>
                  </>
                ) : (
                  <Text style={[styles.sheetQuestion, { marginTop: SPACING.m }]}>¿Cuántos minutos extra deseas agregar?</Text>
                )}

                <TextInput
                  style={styles.minuteInput}
                  keyboardType="numeric"
                  placeholder={selectedEventType?.key === 'Tiempo_Extra' ? "Ej: 5" : "Ej: 32"}
                  placeholderTextColor={COLORS.textMuted}
                  value={minute}
                  onChangeText={setMinute}
                  maxLength={3}
                />

                <TouchableOpacity
                  style={[styles.confirmBtn, submitting && { opacity: 0.6 }]}
                  onPress={submitEvent}
                  disabled={submitting}
                >
                  {submitting ? (
                    <ActivityIndicator color={COLORS.textPrimary} />
                  ) : (
                    <Text style={styles.confirmBtnText}>Confirmar Evento</Text>
                  )}
                </TouchableOpacity>
                <View style={{ height: 20 }} />
              </View>
            )}
          </View>
        </View>
      )}

      {}
      {successModalVisible && (
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <Text style={{ fontSize: 48, marginBottom: SPACING.m }}>✅</Text>
            <Text style={styles.modalTitle}>Evento Registrado</Text>
            {lastEvent && (
              <View style={{ alignItems: 'center', marginBottom: SPACING.xl }}>
                <Text style={styles.modalDetail}>{lastEvent.type.label}</Text>
                
                {lastEvent.type.key === 'Tiempo_Extra' ? (
                  <Text style={styles.modalDetailSub}>
                    +{lastEvent.minute} minutos añadidos
                  </Text>
                ) : (
                  <>
                    <Text style={styles.modalDetailSub}>
                      Min. {lastEvent.minute}' — {lastEvent.player}
                    </Text>
                    <Text style={styles.modalDetailSub}>{lastEvent.team}</Text>
                  </>
                )}
              </View>
            )}
            <TouchableOpacity
              style={styles.confirmBtn}
              onPress={() => setSuccessModalVisible(false)}
            >
              <Text style={styles.confirmBtnText}>Continuar</Text>
            </TouchableOpacity>
          </View>
        </View>
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: COLORS.background },
  content: { flex: 1, padding: SPACING.l },
  matchup: { fontSize: TYPOGRAPHY.sizes.title, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.xs },
  sectionTitle: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.xs, marginTop: SPACING.xs },
  subtitle: { color: COLORS.textSecondary, marginBottom: SPACING.l, fontSize: TYPOGRAPHY.sizes.body },

  grid: { flexDirection: 'row', flexWrap: 'wrap', justifyContent: 'space-between', marginBottom: SPACING.xxl },
  eventBtn: {
    width: '48%', marginBottom: SPACING.m, paddingVertical: SPACING.l, paddingHorizontal: SPACING.m,
    borderRadius: COMPONENTS.button.radius, alignItems: 'center',
    borderWidth: 1, borderColor: 'rgba(255, 255, 255, 0.08)',
    ...SHADOWS.soft,
  },
  eventBtnText: { fontSize: 15, fontWeight: TYPOGRAPHY.weights.bold },

  eventRow: { flexDirection: 'row', alignItems: 'center' },
  minuteBadge: {
    width: 40, height: 40, borderRadius: 20, backgroundColor: COLORS.primary,
    justifyContent: 'center', alignItems: 'center',
  },
  minuteText: { color: COLORS.textPrimary, fontWeight: TYPOGRAPHY.weights.bold, fontSize: TYPOGRAPHY.sizes.body },
  eventLabel: { fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, fontSize: TYPOGRAPHY.sizes.body },
  eventDetail: { color: COLORS.textSecondary, fontSize: 13, marginTop: 2 },

  sheetOverlay: { 
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: 'rgba(0,0,0,0.65)', 
    justifyContent: 'flex-end',
    zIndex: 9999,
    elevation: 9999,
  },
  sheetDismiss: { flex: 1 },
  sheetContainer: {
    backgroundColor: COLORS.surface, borderTopLeftRadius: RADIUS.card, borderTopRightRadius: RADIUS.card,
    paddingBottom: 30, maxHeight: '85%',
    borderWidth: 1, borderColor: 'rgba(255, 255, 255, 0.1)',
  },
  sheetHandle: {
    width: 40, height: 4, borderRadius: 2, backgroundColor: COLORS.border,
    alignSelf: 'center', marginTop: SPACING.m, marginBottom: SPACING.s,
  },
  sheetHeader: {
    flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center',
    paddingHorizontal: SPACING.xl, paddingBottom: SPACING.m,
    borderBottomWidth: 1, borderBottomColor: 'rgba(255, 255, 255, 0.08)',
  },
  sheetTitle: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  sheetBody: { paddingHorizontal: SPACING.xl, paddingTop: SPACING.l },
  sheetQuestion: { fontSize: TYPOGRAPHY.sizes.bodyLarge, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.l },

  stepIndicator: {
    flexDirection: 'row', alignItems: 'center', justifyContent: 'center',
    paddingTop: SPACING.l, paddingHorizontal: 60,
  },
  stepDot: { width: 12, height: 12, borderRadius: 6, backgroundColor: COLORS.border },
  stepDotActive: { backgroundColor: COLORS.primary, width: 14, height: 14, borderRadius: 7 },
  stepLine: { flex: 1, height: 2, backgroundColor: COLORS.border, marginHorizontal: 4 },
  stepLabels: {
    flexDirection: 'row', justifyContent: 'space-between',
    paddingHorizontal: 50, marginTop: 6, marginBottom: 4,
  },
  stepLabel: { fontSize: 11, color: COLORS.textMuted, fontWeight: TYPOGRAPHY.weights.bold },
  stepLabelActive: { color: COLORS.primary },

  teamOption: {
    flexDirection: 'row', alignItems: 'center',
    borderWidth: 2, borderRadius: RADIUS.medium, padding: SPACING.l, marginBottom: SPACING.m,
    backgroundColor: COLORS.surfaceLight,
  },
  teamDot: { width: 14, height: 14, borderRadius: 7, marginRight: 14 },
  teamName: { fontSize: TYPOGRAPHY.sizes.bodyLarge, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  teamRole: { fontSize: 13, color: COLORS.textSecondary, marginTop: 2 },

  playerHeader: {
    flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', marginBottom: SPACING.s,
  },
  backLink: { color: COLORS.primary, fontSize: 13, fontWeight: TYPOGRAPHY.weights.bold },
  playerItem: {
    flexDirection: 'row', alignItems: 'center', paddingVertical: SPACING.m,
    borderBottomWidth: 1, borderBottomColor: 'rgba(255, 255, 255, 0.08)',
  },
  dorsalBadge: {
    width: 36, height: 36, borderRadius: 18, backgroundColor: COLORS.background,
    justifyContent: 'center', alignItems: 'center', marginRight: SPACING.m,
  },
  dorsalText: { fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.primary, fontSize: TYPOGRAPHY.sizes.body },
  playerName: { fontSize: 15, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  playerPos: { fontSize: 12, color: COLORS.textSecondary, marginTop: 2 },

  summaryCard: {
    backgroundColor: COLORS.background, borderRadius: COMPONENTS.card.radius, padding: SPACING.m, marginBottom: SPACING.xl,
    borderWidth: 1, borderColor: 'rgba(255, 255, 255, 0.08)',
  },
  summaryRow: { flexDirection: 'row', justifyContent: 'space-between', marginBottom: 6 },
  summaryLabel: { fontSize: 13, color: COLORS.textSecondary },
  summaryValue: { fontSize: 13, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  minuteInput: {
    borderWidth: 2, borderColor: 'rgba(255, 255, 255, 0.1)', borderRadius: COMPONENTS.input.radius,
    paddingVertical: SPACING.m, paddingHorizontal: SPACING.l, fontSize: 24,
    fontWeight: TYPOGRAPHY.weights.bold, textAlign: 'center', color: COLORS.textPrimary, marginBottom: SPACING.xl,
    backgroundColor: COLORS.background,
  },
  confirmBtn: {
    backgroundColor: COLORS.primary, borderRadius: COMPONENTS.button.radius, paddingVertical: SPACING.m,
    alignItems: 'center', marginBottom: SPACING.s, width: '100%',
    ...SHADOWS.glow,
  },
  confirmBtnText: { color: COLORS.textPrimary, fontWeight: TYPOGRAPHY.weights.bold, fontSize: TYPOGRAPHY.sizes.bodyLarge },

  modalOverlay: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: 'rgba(0,0,0,0.65)', justifyContent: 'center',
    alignItems: 'center', padding: SPACING.l,
    zIndex: 9999,
    elevation: 9999,
  },
  modalContent: {
    backgroundColor: COLORS.surface, borderRadius: RADIUS.card, padding: 28, width: '100%', maxWidth: 400,
    alignItems: 'center', borderWidth: 1, borderColor: 'rgba(255, 255, 255, 0.1)',
  },
  modalTitle: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.s },
  modalDetail: { fontSize: TYPOGRAPHY.sizes.bodyLarge, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  modalDetailSub: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginTop: 2 },
});

export default PartidoEnCursoEventosScreen;
