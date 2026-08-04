import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, Image, TouchableOpacity, Platform } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Button from '../../components/Button';
import { API, getImageUrl } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS } from '../../theme/theme';

const SedesArbitroScreen = ({ navigation }) => {
  const [loading, setLoading] = useState(true);
  const [sedes, setSedes] = useState([]);
  const [confirmModalVisible, setConfirmModalVisible] = useState(false);
  const [selectedSede, setSelectedSede] = useState(null);

  const fetchSedes = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      const response = await fetch(API.arbitroSedes, {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        setSedes(data);
      } else {
        Alert.alert('Error', data.detail || 'Error al obtener sedes');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchSedes();
  }, []);

  const executePostulacion = async (sede) => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      const res = await fetch(API.arbitroPostularSede(sede.id), {
        method: 'POST',
        headers: { 'Authorization': `Bearer ${token}` }
      });
      if (res.ok) {
        if (Platform.OS === 'web') {
          window.alert(`Te has postulado exitosamente para oficiar en ${sede.nombre}`);
        } else {
          Alert.alert('Postulación', `Te has postulado exitosamente para oficiar en ${sede.nombre}`);
        }
      } else {
        const err = await res.json();
        if (Platform.OS === 'web') {
          window.alert('Error: ' + (err.detail || 'No se pudo postular a la sede.'));
        } else {
          Alert.alert('Error', err.detail || 'No se pudo postular a la sede.');
        }
      }
    } catch (e) {
      if (Platform.OS === 'web') {
        window.alert('Error: Problema de conexión.');
      } else {
        Alert.alert('Error', 'Problema de conexión.');
      }
    }
  };

  const handlePostular = (sede) => {
    setSelectedSede(sede);
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
        <Text style={styles.title}>Sedes Disponibles</Text>
        <Text style={styles.subtitle}>Selecciona una sede para postularte a los partidos</Text>

        {sedes.length === 0 ? (
          <Card elevated style={{ alignItems: 'center', paddingVertical: SPACING.xxxl }}>
            <Text style={{ textAlign: 'center', color: COLORS.textMuted, fontSize: TYPOGRAPHY.sizes.bodyLarge }}>No hay sedes disponibles.</Text>
          </Card>
        ) : (
          sedes.map((sede) => (
            <Card elevated key={sede.id} style={{ marginBottom: SPACING.l }}>
              {sede.foto_url ? (
                <Image source={{ uri: getImageUrl(sede.foto_url) }} style={styles.image} />
              ) : (
                <View style={styles.imagePlaceholder}>
                  <Text style={styles.placeholderText}>[Foto {sede.nombre}]</Text>
                </View>
              )}
              <Text style={styles.sedeName}>{sede.nombre}</Text>
              <Text style={styles.sedeInfo}>{sede.direccion}</Text>
              <Button 
                title="Postularse a Partidos" 
                onPress={() => handlePostular(sede)}
                style={{ marginTop: SPACING.m }}
              />
            </Card>
          ))
        )}
      </ScrollView>

      {confirmModalVisible && (
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>Confirmar Postulación</Text>
            <Text style={styles.modalText}>
              ¿Deseas postularte para oficiar partidos en la sede "{selectedSede?.nombre}"?
            </Text>
            <View style={styles.modalButtons}>
              <TouchableOpacity style={[styles.modalButton, styles.buttonCancel]} onPress={() => setConfirmModalVisible(false)}>
                <Text style={styles.buttonCancelText}>Cancelar</Text>
              </TouchableOpacity>
              <TouchableOpacity style={[styles.modalButton, styles.buttonConfirm]} onPress={() => {
                setConfirmModalVisible(false);
                if (selectedSede) executePostulacion(selectedSede);
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
  title: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.xs },
  subtitle: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginBottom: SPACING.xl },
  imagePlaceholder: { height: 130, backgroundColor: COLORS.surfaceLight, borderRadius: RADIUS.medium, justifyContent: 'center', alignItems: 'center', marginBottom: SPACING.m, overflow: 'hidden' },
  placeholderText: { color: COLORS.textMuted },
  sedeName: { fontSize: TYPOGRAPHY.sizes.title, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  sedeInfo: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginTop: 4 },
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
    padding: SPACING.xxl,
    width: '100%', 
    maxWidth: 400,
    borderWidth: 1,
    borderColor: 'rgba(255, 255, 255, 0.1)',
  },
  modalTitle: { fontSize: TYPOGRAPHY.sizes.title, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.m, textAlign: 'center' },
  modalText: { fontSize: TYPOGRAPHY.sizes.bodyLarge, color: COLORS.textSecondary, textAlign: 'center', marginBottom: SPACING.xxl, lineHeight: 22 },
  modalButtons: { flexDirection: 'row', justifyContent: 'space-between', gap: SPACING.m },
  modalButton: { flex: 1, paddingVertical: SPACING.m, borderRadius: COMPONENTS.button.radius, alignItems: 'center' },
  buttonCancel: { backgroundColor: COLORS.surfaceLight, borderWidth: 1, borderColor: 'rgba(255, 255, 255, 0.1)' },
  buttonCancelText: { color: COLORS.textPrimary, fontWeight: TYPOGRAPHY.weights.bold, fontSize: TYPOGRAPHY.sizes.bodyLarge },
  buttonConfirm: { backgroundColor: COLORS.primary },
  buttonConfirmText: { color: COLORS.textPrimary, fontWeight: TYPOGRAPHY.weights.bold, fontSize: TYPOGRAPHY.sizes.bodyLarge }
});

export default SedesArbitroScreen;
