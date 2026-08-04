import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, TextInput } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Button from '../../components/Button';
import { API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS } from '../../theme/theme';

const SolicitudesIngresoScreen = ({ route, navigation }) => {
  const [loading, setLoading] = useState(true);
  const [solicitudes, setSolicitudes] = useState([]);
  const equipoId = route.params?.equipoId;

  const [modalVisible, setModalVisible] = useState(false);
  const [selectedSolicitud, setSelectedSolicitud] = useState(null);
  const [dorsalAsignado, setDorsalAsignado] = useState('');

  const fetchSolicitudes = async () => {
    if (!equipoId) {
      setLoading(false);
      return;
    }

    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      const response = await fetch(API.entrenadorSolicitudes(equipoId), {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        setSolicitudes(data);
      } else {
        Alert.alert('Error', data.detail || 'Error al obtener solicitudes');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchSolicitudes();
  }, []);

  const responderSolicitud = async (solicitudId, estado, dorsal = 0) => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      const response = await fetch(API.entrenadorResponderSolicitud(solicitudId), {
        method: 'PUT',
        headers: {
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ estado, dorsal })
      });
      
      if (response.ok) {
        Alert.alert('Éxito', `Solicitud ${estado}`);
        fetchSolicitudes();
        setModalVisible(false);
        setDorsalAsignado('');
      } else {
        const data = await response.json();
        Alert.alert('Error', data.detail || 'Error al responder solicitud');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    }
  };

  const handleAceptarClick = (solicitud) => {
    setSelectedSolicitud(solicitud);
    setModalVisible(true);
  };

  const confirmarAceptar = () => {
    const dorsalNum = parseInt(dorsalAsignado, 10);
    if (isNaN(dorsalNum) || dorsalNum < 1) {
      Alert.alert('Error', 'Por favor ingresa un número de dorsal válido');
      return;
    }
    responderSolicitud(selectedSolicitud.solicitud_id, 'aceptado', dorsalNum);
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
        <Text style={styles.title}>Solicitudes de Ingreso</Text>
        <Text style={styles.subtitle}>ID Equipo: {equipoId || 'N/A'}</Text>

        {solicitudes.length === 0 ? (
          <Card elevated style={{ alignItems: 'center', paddingVertical: SPACING.xxxl }}>
            <Text style={{ textAlign: 'center', color: COLORS.textMuted, fontSize: TYPOGRAPHY.sizes.bodyLarge }}>No hay solicitudes pendientes.</Text>
          </Card>
        ) : (
          solicitudes.map((sol) => (
            <Card elevated key={sol.solicitud_id} style={{ marginBottom: SPACING.l }}>
              <View style={styles.reqHeader}>
                <View style={styles.avatarPlaceholder} />
                <View>
                  <Text style={styles.reqName}>{sol.nombre}</Text>
                  <Text style={styles.reqInfo}>Posición: {sol.posicion || 'N/A'}</Text>
                </View>
              </View>
              <View style={styles.actionRow}>
                <Button title="Aceptar" style={styles.actionBtn} onPress={() => handleAceptarClick(sol)} />
                <Button title="Rechazar" type="secondary" style={styles.actionBtn} onPress={() => responderSolicitud(sol.solicitud_id, 'rechazado')} />
              </View>
            </Card>
          ))
        )}
      </ScrollView>

      {modalVisible && (
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>Asignar Dorsal</Text>
            <Text style={{ marginBottom: SPACING.m, color: COLORS.textSecondary, textAlign: 'center' }}>
              ¿Qué número de dorsal tendrá {selectedSolicitud?.nombre}?
            </Text>
            <TextInput
              style={styles.input}
              placeholder="Ej. 10"
              keyboardType="number-pad"
              value={dorsalAsignado}
              onChangeText={setDorsalAsignado}
              placeholderTextColor={COLORS.textMuted}
            />
            <Button title="Confirmar" onPress={confirmarAceptar} style={{ marginBottom: SPACING.s }} />
            <Button title="Cancelar" type="secondary" onPress={() => setModalVisible(false)} />
          </View>
        </View>
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: COLORS.background, padding: SPACING.l },
  title: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.xs },
  subtitle: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginBottom: SPACING.l },
  reqHeader: { flexDirection: 'row', alignItems: 'center', marginBottom: SPACING.m },
  avatarPlaceholder: { width: 44, height: 44, borderRadius: 22, backgroundColor: COLORS.surfaceLight, borderWidth: 1, borderColor: 'rgba(255, 255, 255, 0.1)', marginRight: SPACING.m },
  reqName: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  reqInfo: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginTop: 2 },
  actionRow: { flexDirection: 'row', justifyContent: 'space-between', marginTop: SPACING.s },
  actionBtn: { width: '48%' },
  modalOverlay: { 
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: 'rgba(0, 0, 0, 0.65)', 
    justifyContent: 'center', 
    alignItems: 'center',
    padding: SPACING.xl,
    zIndex: 9999,
    elevation: 9999,
  },
  modalContent: { 
    width: '100%', 
    maxWidth: 380,
    backgroundColor: COLORS.surface, 
    borderRadius: RADIUS.card, 
    padding: SPACING.xl,
    borderWidth: 1,
    borderColor: 'rgba(255, 255, 255, 0.1)',
  },
  modalTitle: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, marginBottom: SPACING.m, color: COLORS.textPrimary, textAlign: 'center' },
  input: { borderWidth: 1, borderColor: 'rgba(255, 255, 255, 0.1)', borderRadius: COMPONENTS.input.radius, padding: SPACING.m, marginBottom: SPACING.l, backgroundColor: COLORS.background, color: COLORS.textPrimary }
});

export default SolicitudesIngresoScreen;
