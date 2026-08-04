import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Badge from '../../components/Badge';
import Button from '../../components/Button';
import { API_BASE } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS, SHADOWS } from '../../theme/theme';

const AgendaPartidosScreen = ({ navigation }) => {
  const [loading, setLoading] = useState(true);
  const [agenda, setAgenda] = useState([]);
  const [message, setMessage] = useState('');

  const fetchAgenda = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) {
        setAgenda([]);
        setMessage('Debes iniciar sesión para ver tu agenda.');
        setLoading(false);
        return;
      }

      const response = await fetch(`${API_BASE}/jugadores/agenda`, {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json().catch(() => ({}));
      
      if (response.ok) {
        const partidos = Array.isArray(data.partidos) ? data.partidos : [];
        setAgenda(partidos);
        setMessage(partidos.length > 0 ? 'Tienes partidos próximos a disputar.' : 'No tienes partidos próximos agendados.');
      } else {
        setAgenda([]);
        setMessage(data.detail || 'No se pudieron cargar tus partidos.');
      }
    } catch (error) {
      console.error(error);
      setAgenda([]);
      setMessage('No se pudo conectar al servidor.');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchAgenda();
    const unsubscribe = navigation.addListener('focus', () => {
      fetchAgenda();
    });
    return unsubscribe;
  }, [navigation]);

  if (loading) {
    return (
      <View style={[styles.container, { justifyContent: 'center', alignItems: 'center' }]}>
        <ActivityIndicator size="large" color={COLORS.primary} />
      </View>
    );
  }

  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxl }}>
      <Text style={styles.title}>Inicio</Text>
      <Text style={styles.subtitle}>{message}</Text>

      {agenda.length === 0 ? (
        <Card elevated style={{ alignItems: 'center', paddingVertical: SPACING.xxxl }}>
          <Text style={{ textAlign: 'center', color: COLORS.textMuted, fontSize: TYPOGRAPHY.sizes.bodyLarge }}>No tienes partidos próximos agendados.</Text>
        </Card>
      ) : (
        agenda.map((partido, index) => (
          <Card elevated accent key={partido.id || index} style={styles.matchCard}>
            <View style={styles.header}>
              <Badge title={`${partido.fecha || ''} · ${partido.hora || ''}`.trim()} type="success" />
            </View>
            <Text style={styles.matchup}>{partido.rival || 'Rival por definir'}</Text>
            <Text style={styles.metaText}>Condición: {partido.condicion || 'Por definir'}</Text>
            <Text style={styles.metaText}>Cancha: {partido.cancha || 'Por definir'}</Text>

            <View style={styles.statusBox}>
              <Text style={styles.statusLabel}>Confirmación de Asistencia:</Text>
              {partido.asistenciaConfirmada ? (
                <Text style={styles.pagadoText}>Asistencia confirmada</Text>
              ) : (
                <Text style={styles.pendienteText}>Pendiente por confirmar</Text>
              )}
            </View>
          </Card>
        ))
      )}
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: COLORS.background, padding: SPACING.l },
  title: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: 4 },
  subtitle: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginBottom: SPACING.xl },
  matchCard: { marginBottom: SPACING.l, borderRadius: RADIUS.card },
  header: { marginBottom: SPACING.m },
  matchup: { fontSize: TYPOGRAPHY.sizes.title, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.s },
  metaText: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginBottom: 4 },
  statusBox: { borderTopWidth: 1, borderTopColor: 'rgba(255, 255, 255, 0.08)', paddingTop: SPACING.m, marginTop: SPACING.s },
  statusLabel: { fontSize: TYPOGRAPHY.sizes.body, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.s },
  pagadoText: { color: COLORS.success, fontWeight: TYPOGRAPHY.weights.bold },
  pendienteText: { color: COLORS.textSecondary, fontStyle: 'italic' },
  actionBtn: { width: '100%', paddingVertical: 8 }
});

export default AgendaPartidosScreen;
