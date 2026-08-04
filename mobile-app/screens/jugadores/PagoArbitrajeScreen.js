import React, { useState } from 'react';
import { View, Text, StyleSheet, ScrollView, Alert, ActivityIndicator } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Button from '../../components/Button';
import { API_BASE } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, RADIUS } from '../../theme/theme';

const PagoArbitrajeScreen = ({ route, navigation }) => {
  const { partidoId } = route.params || { partidoId: null };
  const [loading, setLoading] = useState(false);

  const handlePago = async () => {
    if (!partidoId) {
      Alert.alert('Error', 'No se ha proporcionado un ID de partido válido.');
      return;
    }

    setLoading(true);
    try {
      const token = await AsyncStorage.getItem('userToken');
      const response = await fetch(`${API_BASE}/jugadores/partido/${partidoId}/confirmar-asistencia`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json'
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        Alert.alert('Éxito', data.message || 'Confirmación realizada con éxito');
        navigation.goBack();
      } else {
        Alert.alert('Error', data.detail || 'Error al procesar la confirmación');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
      <Text style={styles.title}>Confirmar Asistencia</Text>
      
      <Card elevated glow style={styles.amountCard}>
        <Text style={styles.amountLabel}>Asistencia de tu Equipo</Text>
        <Text style={styles.amountValue}>Confirmar</Text>
        <Text style={styles.amountDesc}>Partido ID: {partidoId || 'Desconocido'}</Text>
      </Card>

      <Text style={styles.sectionTitle}>Confirmación</Text>
      
      <Card elevated>
        <Text style={{ marginBottom: SPACING.m, color: COLORS.textPrimary, lineHeight: 22 }}>
          Al confirmar asistencia, estás indicando que tu equipo está presente y listo para jugar este partido. 
          El árbitro validará la asistencia mínima para iniciar el encuentro.
        </Text>

        {loading ? (
          <ActivityIndicator size="large" color={COLORS.primary} style={{ marginTop: SPACING.xxl }} />
        ) : (
          <Button 
            title="Confirmar Asistencia" 
            onPress={handlePago}
            style={{ marginTop: 10 }}
          />
        )}
      </Card>

    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: COLORS.background, padding: SPACING.l },
  title: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.xl },
  amountCard: { alignItems: 'center', paddingVertical: 32, backgroundColor: COLORS.surfaceLight, borderRadius: RADIUS.card },
  amountLabel: { color: COLORS.textSecondary, fontSize: TYPOGRAPHY.sizes.bodyLarge, marginBottom: SPACING.s },
  amountValue: { color: COLORS.primary, fontSize: 32, fontWeight: TYPOGRAPHY.weights.bold },
  amountDesc: { color: COLORS.textMuted, marginTop: SPACING.s },
  sectionTitle: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginTop: SPACING.m, marginBottom: SPACING.m }
});

export default PagoArbitrajeScreen;
