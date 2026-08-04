import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, Switch, TouchableOpacity, Platform } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Button from '../../components/Button';
import { API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS } from '../../theme/theme';

const CHECKLIST_ITEMS = [
  { key: 'alineacionLocal', label: 'Alineación Local Confirmada' },
  { key: 'alineacionVisita', label: 'Alineación Visitante Confirmada' },
  { key: 'asistenciaLocal', label: 'Asistencia Local (mínimo 7 jugadores)' },
  { key: 'asistenciaVisita', label: 'Asistencia Visitante (mínimo 7 jugadores)' },
  { key: 'canchaLista', label: 'Cancha en Condiciones' },
  { key: 'balonOficial', label: 'Balón Oficial Disponible' },
];

const ConfirmarInicioPartidoScreen = ({ route, navigation }) => {
  const [loading, setLoading] = useState(true);
  const [partido, setPartido] = useState(null);
  const [checklist, setChecklist] = useState({});
  const [warningModalVisible, setWarningModalVisible] = useState(false);
  const [missingItems, setMissingItems] = useState([]);
  const partidoId = route.params?.partidoId;

  useEffect(() => {
    const initial = {};
    CHECKLIST_ITEMS.forEach(item => { initial[item.key] = false; });
    setChecklist(initial);
  }, []);

  const fetchPartido = async () => {
    if (!partidoId) {
      setLoading(false);
      return;
    }

    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      const response = await fetch(API.arbitroPartido(partidoId), {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        setPartido(data);
      } else {
        if (Platform.OS === 'web') {
          window.alert('Error: ' + (data.detail || 'Error al obtener detalles del partido'));
        } else {
          Alert.alert('Error', data.detail || 'Error al obtener detalles del partido');
        }
      }
    } catch (error) {
      console.error(error);
      if (Platform.OS === 'web') {
        window.alert('Error: No se pudo conectar al servidor');
      } else {
        Alert.alert('Error', 'No se pudo conectar al servidor');
      }
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPartido();
  }, [partidoId]);

  const toggleCheck = (key) => {
    setChecklist(prev => ({ ...prev, [key]: !prev[key] }));
  };

  const allChecked = CHECKLIST_ITEMS.every(item => checklist[item.key]);
  const checkedCount = CHECKLIST_ITEMS.filter(item => checklist[item.key]).length;

  const handleIniciar = async () => {
    if (!allChecked) {
      const missing = CHECKLIST_ITEMS.filter(item => !checklist[item.key]);
      setMissingItems(missing);
      setWarningModalVisible(true);
      return;
    }

    try {
      const token = await AsyncStorage.getItem('userToken');
      const response = await fetch(API.arbitroIniciarPartido(partidoId), {
        method: 'PUT',
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });

      if (response.ok) {
        navigation.navigate('PartidoEnCurso', { partidoId });
      } else {
        const data = await response.json();
        if (Platform.OS === 'web') {
          window.alert('Error: ' + (data.detail || 'No se pudo iniciar el partido'));
        } else {
          Alert.alert('Error', data.detail || 'No se pudo iniciar el partido');
        }
      }
    } catch (error) {
      if (Platform.OS === 'web') {
        window.alert('Error: No se pudo conectar al servidor');
      } else {
        Alert.alert('Error', 'No se pudo conectar al servidor');
      }
    }
  };

  const formatearFechaHora = (fechaHoraStr) => {
    try {
      const date = new Date(fechaHoraStr);
      return date.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
    } catch {
      return fechaHoraStr;
    }
  };

  if (loading) {
    return (
      <View style={[styles.container, { justifyContent: 'center', alignItems: 'center' }]}>
        <ActivityIndicator size="large" color={COLORS.primary} />
      </View>
    );
  }

  if (!partido) {
    return (
      <View style={[styles.container, { justifyContent: 'center', alignItems: 'center' }]}>
        <Text style={{ textAlign: 'center', color: COLORS.textMuted }}>Partido no encontrado.</Text>
      </View>
    );
  }

  return (
    <View style={{ flex: 1, backgroundColor: COLORS.background }}>
      <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
        <Text style={styles.title}>Confirmar Partido</Text>
        
        <Card elevated accent style={{ marginBottom: SPACING.l }}>
          <Text style={styles.tourney}>Torneo Primavera 2026</Text>
          <Text style={styles.matchup}>{partido.equipo_local} vs {partido.equipo_visita}</Text>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Sede:</Text>
            <Text style={styles.infoValue}>{partido.sede}</Text>
          </View>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Hora Programada:</Text>
            <Text style={styles.infoValue}>{formatearFechaHora(partido.fecha_hora)}</Text>
          </View>
        </Card>

        <View style={styles.checklistHeader}>
          <Text style={styles.sectionTitle}>Checklist Previo</Text>
          <View style={styles.progressBadge}>
            <Text style={styles.progressText}>{checkedCount}/{CHECKLIST_ITEMS.length}</Text>
          </View>
        </View>

        <View style={styles.progressBarBg}>
          <View style={[styles.progressBarFill, { width: `${(checkedCount / CHECKLIST_ITEMS.length) * 100}%` }]} />
        </View>
        
        <Card elevated>
          {CHECKLIST_ITEMS.map((item, index) => (
            <View key={item.key} style={[styles.checkItem, index < CHECKLIST_ITEMS.length - 1 && styles.checkItemBorder]}>
              <View style={styles.checkItemLeft}>
                <View style={[styles.checkDot, checklist[item.key] && styles.checkDotActive]} />
                <Text style={[styles.checkText, checklist[item.key] && styles.checkTextActive]}>
                  {item.label}
                </Text>
              </View>
              <Switch
                value={checklist[item.key]}
                onValueChange={() => toggleCheck(item.key)}
                trackColor={{ false: COLORS.border, true: COLORS.success + '40' }}
                thumbColor={checklist[item.key] ? COLORS.success : COLORS.textMuted}
              />
            </View>
          ))}
        </Card>

        <Button 
          title={partido.estado === 'en_curso' ? "Continuar Partido" : "Dar Pitazo Inicial"}
          onPress={partido.estado === 'en_curso' ? () => navigation.navigate('PartidoEnCurso', { partidoId }) : handleIniciar}
          style={[{ marginTop: SPACING.l, marginBottom: SPACING.xxl }, !allChecked && partido.estado !== 'en_curso' && styles.buttonDisabled]}
        />
      </ScrollView>

      {warningModalVisible && (
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <View style={styles.modalIconContainer}>
              <Text style={styles.modalIcon}>⚠️</Text>
            </View>
            <Text style={styles.modalTitle}>No se puede iniciar</Text>
            <Text style={styles.modalSubtitle}>
              Debes completar todos los puntos del checklist antes de dar el pitazo inicial.
            </Text>

            <View style={styles.missingList}>
              <Text style={styles.missingLabel}>Pendientes:</Text>
              {missingItems.map(item => (
                <View key={item.key} style={styles.missingItem}>
                  <Text style={styles.missingDot}>•</Text>
                  <Text style={styles.missingText}>{item.label}</Text>
                </View>
              ))}
            </View>

            <TouchableOpacity style={styles.modalCloseBtn} onPress={() => setWarningModalVisible(false)}>
              <Text style={styles.modalCloseBtnText}>Entendido</Text>
            </TouchableOpacity>
          </View>
        </View>
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: COLORS.background,
    padding: SPACING.l,
  },
  title: {
    fontSize: TYPOGRAPHY.sizes.headline,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.l,
  },
  tourney: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
    marginBottom: SPACING.xs,
  },
  matchup: {
    fontSize: TYPOGRAPHY.sizes.title,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.m,
  },
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: SPACING.xs,
  },
  infoLabel: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
  },
  infoValue: {
    fontSize: TYPOGRAPHY.sizes.body,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
  },
  checklistHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: SPACING.m,
    marginBottom: SPACING.s,
  },
  sectionTitle: {
    fontSize: TYPOGRAPHY.sizes.title,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
  },
  progressBadge: {
    backgroundColor: COLORS.primary,
    borderRadius: 12,
    paddingHorizontal: 10,
    paddingVertical: 4,
  },
  progressText: {
    color: COLORS.textPrimary,
    fontWeight: TYPOGRAPHY.weights.bold,
    fontSize: 13,
  },
  progressBarBg: {
    height: 6,
    backgroundColor: COLORS.surfaceLight,
    borderRadius: 3,
    marginBottom: SPACING.m,
    overflow: 'hidden',
  },
  progressBarFill: {
    height: '100%',
    backgroundColor: COLORS.success,
    borderRadius: 3,
  },
  checkItem: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingVertical: 14,
  },
  checkItemBorder: {
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.08)',
  },
  checkItemLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
  },
  checkDot: {
    width: 10,
    height: 10,
    borderRadius: 5,
    backgroundColor: COLORS.textMuted,
    marginRight: 12,
  },
  checkDotActive: {
    backgroundColor: COLORS.success,
  },
  checkText: {
    fontSize: 15,
    color: COLORS.textSecondary,
    flex: 1,
  },
  checkTextActive: {
    color: COLORS.textPrimary,
    fontWeight: TYPOGRAPHY.weights.medium,
  },
  buttonDisabled: {
    opacity: 0.5,
  },
  modalOverlay: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: 'rgba(0,0,0,0.65)',
    justifyContent: 'center',
    alignItems: 'center',
    padding: SPACING.l,
    zIndex: 9999,
    elevation: 9999,
  },
  modalContent: {
    backgroundColor: COLORS.surface,
    borderRadius: RADIUS.card,
    padding: 28,
    width: '100%',
    maxWidth: 400,
    alignItems: 'center',
    borderWidth: 1,
    borderColor: 'rgba(255, 255, 255, 0.1)',
  },
  modalIconContainer: {
    width: 60,
    height: 60,
    borderRadius: 30,
    backgroundColor: COLORS.warning + '20',
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: SPACING.m,
  },
  modalIcon: {
    fontSize: 30,
  },
  modalTitle: {
    fontSize: TYPOGRAPHY.sizes.title,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.xs,
    textAlign: 'center',
  },
  modalSubtitle: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
    textAlign: 'center',
    marginBottom: SPACING.xl,
    lineHeight: 20,
  },
  missingList: {
    width: '100%',
    backgroundColor: COLORS.warning + '10',
    borderRadius: RADIUS.medium,
    padding: SPACING.m,
    marginBottom: SPACING.xl,
  },
  missingLabel: {
    fontSize: 13,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.warning,
    marginBottom: SPACING.xs,
  },
  missingItem: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 6,
  },
  missingDot: {
    color: COLORS.warning,
    fontSize: 16,
    marginRight: 8,
  },
  missingText: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textPrimary,
  },
  modalCloseBtn: {
    backgroundColor: COLORS.primary,
    borderRadius: COMPONENTS.button.radius,
    paddingVertical: SPACING.m,
    paddingHorizontal: 40,
    width: '100%',
    alignItems: 'center',
  },
  modalCloseBtnText: {
    color: COLORS.textPrimary,
    fontWeight: TYPOGRAPHY.weights.bold,
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
  },
});

export default ConfirmarInicioPartidoScreen;
