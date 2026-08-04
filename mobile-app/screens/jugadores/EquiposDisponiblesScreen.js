import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, Image } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Button from '../../components/Button';
import { COLORS, TYPOGRAPHY, SPACING, RADIUS } from '../../theme/theme';
import { API_BASE } from '../../config/api';

const getImageUrl = (url) => {
  if (!url) return null;
  if (url.startsWith('http://') || url.startsWith('https://')) return url;
  if (url.startsWith('/')) return `${API_BASE}${url}`;
  return `${API_BASE}/${url}`;
};

const EquiposDisponiblesScreen = ({ navigation }) => {
  const [loading, setLoading] = useState(true);
  const [equipos, setEquipos] = useState([]);
  const [solicitudPendiente, setSolicitudPendiente] = useState(null);

  const fetchEquipos = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      const response = await fetch(`${API_BASE}/jugadores/equipos-disponibles`, {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json().catch(() => ({}));
      
      if (response.ok) {
        const equiposDisponibles = Array.isArray(data.equipos) ? data.equipos : [];
        setEquipos(equiposDisponibles);
        setSolicitudPendiente(data.solicitudPendiente || null);
      } else {
        Alert.alert('Error', data.detail || 'Error al obtener equipos');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchEquipos();
    const unsubscribe = navigation.addListener('focus', () => {
      fetchEquipos();
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
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
      <Text style={styles.title}>Equipos Disponibles</Text>
      <Text style={styles.subtitle}>Encuentra un equipo para unirte</Text>

      {solicitudPendiente ? (
        <Card elevated style={{ marginBottom: SPACING.l }}>
          <Text style={{ color: COLORS.primary, fontWeight: TYPOGRAPHY.weights.bold }}>Ya tienes una solicitud pendiente.</Text>
        </Card>
      ) : null}

      {equipos.length === 0 ? (
        <Card elevated style={{ alignItems: 'center', paddingVertical: SPACING.xxxl }}>
          <Text style={{ textAlign: 'center', color: COLORS.textMuted, fontSize: TYPOGRAPHY.sizes.bodyLarge }}>No hay equipos disponibles por el momento.</Text>
        </Card>
      ) : (
        equipos.map((equipo) => (
          <Card elevated key={equipo.id} style={{ marginBottom: SPACING.l }}>
            <View style={styles.header}>
              {getImageUrl(equipo.escudo_url) ? (
                <Image source={{ uri: getImageUrl(equipo.escudo_url) }} style={styles.avatarPlaceholder} />
              ) : (
                <View style={styles.avatarPlaceholder} />
              )}
              <View style={styles.headerText}>
                <Text style={styles.teamName}>{equipo.nombre}</Text>
              </View>
            </View>
            <View style={styles.stats}>
              <Text style={styles.statText}>Entrenador: {equipo.entrenador || 'Sin entrenador'}</Text>
              <Text style={styles.statText}>{equipo.jugadores || 0}/{equipo.limite_jugadores || 0}</Text>
            </View>
            <Button 
              title="Postularse / Detalles" 
              onPress={() => navigation.navigate('UnirseDetalleEquipo', { equipoId: equipo.id })} 
            />
          </Card>
        ))
      )}
    </ScrollView>
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
    marginBottom: 4,
  },
  subtitle: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
    marginBottom: SPACING.xl,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: SPACING.m,
  },
  avatarPlaceholder: {
    width: 52,
    height: 52,
    borderRadius: 26,
    backgroundColor: COLORS.surfaceLight,
    borderWidth: 1,
    borderColor: 'rgba(255, 255, 255, 0.1)',
    marginRight: SPACING.m,
  },
  headerText: {
    flex: 1,
  },
  teamName: {
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
  },
  tourney: {
    fontSize: TYPOGRAPHY.sizes.caption,
    color: COLORS.primary,
    fontWeight: TYPOGRAPHY.weights.bold,
    marginTop: 2,
  },
  stats: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: SPACING.l,
    paddingTop: SPACING.s,
    borderTopWidth: 1,
    borderTopColor: 'rgba(255, 255, 255, 0.08)',
  },
  statText: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
  }
});

export default EquiposDisponiblesScreen;
