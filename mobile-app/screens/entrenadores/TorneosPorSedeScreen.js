import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, Platform, TouchableOpacity } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Badge from '../../components/Badge';
import Button from '../../components/Button';
import { API_BASE, API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS } from '../../theme/theme';

const TorneosPorSedeScreen = ({ route, navigation }) => {
  const [loading, setLoading] = useState(true);
  const [data, setData] = useState(null);
  const [miEquipo, setMiEquipo] = useState(null);
  const [confirmModalVisible, setConfirmModalVisible] = useState(false);
  const [selectedTorneoId, setSelectedTorneoId] = useState(null);
  const sedeId = route.params?.sedeId;

  const fetchData = async () => {
    if (!sedeId) {
      setLoading(false);
      return;
    }

    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) {
        setLoading(false);
        return;
      }

      const resSede = await fetch(API.entrenadorSedeTorneos(sedeId), {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      
      const resEquipo = await fetch(API.entrenadorMisEquipos, {
        headers: { 'Authorization': `Bearer ${token}` }
      });

      if (resSede.ok) {
        const dataSede = await resSede.json();
        setData(dataSede);
      } else {
        const errorBody = await resSede.text();
        Alert.alert('Error', errorBody || 'Error al obtener torneos de la sede');
      }
      if (resEquipo.ok) {
        const dataEquipo = await resEquipo.json();
        const list = Array.isArray(dataEquipo)
          ? dataEquipo
          : dataEquipo?.value && Array.isArray(dataEquipo.value)
          ? dataEquipo.value
          : [];
        if (list.length > 0) {
          setMiEquipo(list[0]);
        }
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, [sedeId]);

  const executePostulacion = async (torneoId) => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      const res = await fetch(API.entrenadorInscribirTorneo(torneoId), {
        method: 'POST',
        headers: { 
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ equipo_id: miEquipo?.id })
      });
      if (res.ok) {
        if (Platform.OS === 'web') {
          window.alert('Tu equipo ha sido inscrito en el torneo exitosamente.');
          navigation.navigate('Mi Equipo');
        } else {
          Alert.alert('Éxito', 'Tu equipo ha sido inscrito en el torneo exitosamente.', [
            { text: "OK", onPress: () => navigation.navigate('Mi Equipo') }
          ]);
        }
      } else {
        const errText = await res.text();
        let errMsg = errText;
        try {
          const errData = JSON.parse(errText);
          errMsg = errData.detail || errText;
        } catch(e) {}
        if (Platform.OS === 'web') {
          window.alert('Error del Servidor: ' + errMsg);
        } else {
          Alert.alert('Error del Servidor', errMsg);
        }
      }
    } catch(e) {
      if (Platform.OS === 'web') {
        window.alert('Error de red: ' + e.message);
      } else {
        Alert.alert('Error de red', e.message);
      }
    }
  };

  const postularEquipo = (torneoId) => {
    if (!miEquipo) {
      if (Platform.OS === 'web') {
        window.alert('Necesitas tener un equipo registrado para postularte a un torneo.');
      } else {
        Alert.alert('Atención', 'Necesitas tener un equipo registrado para postularte a un torneo.');
      }
      return;
    }

    setSelectedTorneoId(torneoId);
    setConfirmModalVisible(true);
  };

  if (loading) {
    return (
      <View style={[styles.container, { justifyContent: 'center', alignItems: 'center' }]}>
        <ActivityIndicator size="large" color={COLORS.primary} />
      </View>
    );
  }

  return (
    <View style={{ flex: 1, backgroundColor: COLORS.background }}>
      <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
        <Text style={styles.title}>Torneos en {data?.sede?.nombre || 'Sede'}</Text>

        {Array.isArray(data?.torneos) && data.torneos.length > 0 ? (
          data.torneos.map(torneo => (
            <Card elevated accent key={torneo.id} style={{ marginBottom: SPACING.l }}>
              <Text style={styles.tourneyName}>{torneo.nombre}</Text>
              <Badge 
                title={(torneo.estado === 'abierto' || torneo.estado === 'planeado') ? "Inscripciones Abiertas" : "En curso"} 
                type={(torneo.estado === 'abierto' || torneo.estado === 'planeado') ? "success" : "neutral"} 
              />
              <View style={styles.infoRow}>
                <Text style={styles.infoLabel}>Cupo Límite:</Text>
                <Text style={styles.infoValue}>{torneo.cupo_equipos} Equipos</Text>
              </View>
              <View style={styles.infoRow}>
                <Text style={styles.infoLabel}>Fechas:</Text>
                <Text style={styles.infoValue}>{torneo.fecha_inicio} al {torneo.fecha_fin}</Text>
              </View>
              {(torneo.estado === 'abierto' || torneo.estado === 'planeado') && (
                <Button 
                  title="Inscribir Equipo" 
                  onPress={() => postularEquipo(torneo.id)}
                  style={{ marginTop: SPACING.m }}
                />
              )}
            </Card>
          ))
        ) : (
          <Text style={{ textAlign: 'center', color: COLORS.textMuted, marginTop: SPACING.xl }}>No hay torneos activos en esta sede actualmente.</Text>
        )}
      </ScrollView>

      {}
      {confirmModalVisible && (
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>Confirmar Postulación</Text>
            <Text style={styles.modalText}>
              ¿Deseas postular al equipo "{miEquipo?.nombre}" a este torneo?
            </Text>
            <View style={styles.modalButtons}>
              <TouchableOpacity style={[styles.modalButton, styles.buttonCancel]} onPress={() => setConfirmModalVisible(false)}>
                <Text style={styles.buttonCancelText}>Cancelar</Text>
              </TouchableOpacity>
              <TouchableOpacity style={[styles.modalButton, styles.buttonConfirm]} onPress={() => {
                setConfirmModalVisible(false);
                if (selectedTorneoId) executePostulacion(selectedTorneoId);
              }}>
                <Text style={styles.buttonConfirmText}>Postular</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: COLORS.background, padding: SPACING.l },
  title: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.l },
  tourneyName: { fontSize: TYPOGRAPHY.sizes.title, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.xs },
  infoRow: { flexDirection: 'row', justifyContent: 'space-between', marginTop: SPACING.m },
  infoLabel: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, width: 100 },
  infoValue: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textPrimary, fontWeight: TYPOGRAPHY.weights.medium, flex: 1 },
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
    padding: 24,
    width: '100%', 
    maxWidth: 400,
    borderWidth: 1,
    borderColor: 'rgba(255, 255, 255, 0.1)',
  },
  modalTitle: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.m, textAlign: 'center' },
  modalText: { fontSize: TYPOGRAPHY.sizes.bodyLarge, color: COLORS.textSecondary, textAlign: 'center', marginBottom: SPACING.xl, lineHeight: 22 },
  modalButtons: { flexDirection: 'row', justifyContent: 'space-between', gap: 12 },
  modalButton: { flex: 1, paddingVertical: SPACING.m, borderRadius: COMPONENTS.button.radius, alignItems: 'center' },
  buttonCancel: { backgroundColor: COLORS.surfaceLight, borderWidth: 1, borderColor: 'rgba(255, 255, 255, 0.1)' },
  buttonCancelText: { color: COLORS.textPrimary, fontWeight: TYPOGRAPHY.weights.bold, fontSize: TYPOGRAPHY.sizes.bodyLarge },
  buttonConfirm: { backgroundColor: COLORS.primary },
  buttonConfirmText: { color: COLORS.textPrimary, fontWeight: TYPOGRAPHY.weights.bold, fontSize: TYPOGRAPHY.sizes.bodyLarge }
});

export default TorneosPorSedeScreen;
