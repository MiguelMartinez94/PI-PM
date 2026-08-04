import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, Image } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Badge from '../../components/Badge';
import Button from '../../components/Button';
import { API_BASE } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS } from '../../theme/theme';

const getImageUrl = (url) => {
  if (!url) return null;
  if (url.startsWith('http://') || url.startsWith('https://')) return url;
  if (url.startsWith('/')) return `${API_BASE}${url}`;
  return `${API_BASE}/${url}`;
};

const DetalleEquipoJugadorScreen = ({ navigation }) => {
  const [loading, setLoading] = useState(true);
  const [equipo, setEquipo] = useState(null);

  const fetchEquipo = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      const response = await fetch(`${API_BASE}/jugadores/mi-equipo`, {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json().catch(() => ({}));
      
      if (response.ok) {
        setEquipo(data.equipo || null);
      } else if (response.status === 404) {
        setEquipo(null);
      } else {
        Alert.alert('Error', data.detail || 'Error al obtener tu equipo');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchEquipo();
    const unsubscribe = navigation.addListener('focus', () => {
      fetchEquipo();
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

  if (!equipo) {
    return (
      <View style={[styles.container, { justifyContent: 'center', alignItems: 'center' }]}>
        <Text style={{ textAlign: 'center', color: COLORS.textMuted, fontSize: TYPOGRAPHY.sizes.bodyLarge }}>No perteneces a ningún equipo aún.</Text>
        <Text style={{ textAlign: 'center', color: COLORS.textMuted, marginTop: SPACING.s }}>Ve a la pestaña "Unirse" para buscar uno.</Text>
      </View>
    );
  }

  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
      <View style={styles.headerInfo}>
        {getImageUrl(equipo.escudo_url) ? (
          <Image source={{ uri: getImageUrl(equipo.escudo_url) }} style={styles.avatarPlaceholder} />
        ) : (
          <View style={styles.avatarPlaceholder} />
        )}
        <View style={{ flex: 1 }}>
          <Text style={styles.title}>{equipo.nombre}</Text>
          <Text style={styles.subtitle}>Entrenador: {equipo.entrenador || 'Sin entrenador'}</Text>
          <Badge title={equipo.torneo || 'Sin torneo'} type="success" />
        </View>
      </View>

      <Text style={styles.sectionTitle}>Información del equipo</Text>
      <Card elevated style={{ marginBottom: SPACING.xl }}>
        <Text style={{ fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, fontSize: TYPOGRAPHY.sizes.bodyLarge }}>
          {equipo.torneo || 'Sin torneo'}
        </Text>
        <Text style={{ color: COLORS.textSecondary, marginTop: 4 }}>
          Estadísticas: {equipo.estadisticas?.jugados || 0} jugados · {equipo.estadisticas?.ganados || 0} ganados · {equipo.estadisticas?.puntos || 0} puntos
        </Text>
      </Card>

      <Text style={styles.sectionTitle}>Plantilla de jugadores</Text>
      <Card elevated>
        {equipo.jugadores && equipo.jugadores.length > 0 ? (
          equipo.jugadores.map((jugador, idx) => (
            <View key={jugador.id || idx} style={styles.playerRow}>
              <Text style={styles.playerNum}>#{jugador.dorsal || '-'}</Text>
              <Text style={styles.playerName}>{jugador.nombre}</Text>
              <Text style={styles.playerPos}>{jugador.posicion || 'N/A'}</Text>
            </View>
          ))
        ) : (
          <Text style={{ textAlign: 'center', padding: SPACING.m, color: COLORS.textMuted }}>No hay jugadores registrados</Text>
        )}
      </Card>

    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: COLORS.background,
    padding: SPACING.l,
  },
  headerInfo: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: SPACING.xxl,
  },
  avatarPlaceholder: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: COLORS.surfaceLight,
    borderWidth: 2,
    borderColor: 'rgba(255, 255, 255, 0.1)',
    marginRight: SPACING.l,
  },
  title: {
    fontSize: TYPOGRAPHY.sizes.headline,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
  },
  subtitle: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
    marginBottom: SPACING.s,
  },
  sectionTitle: {
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.m,
  },
  pitchCard: {
    padding: 0,
    overflow: 'hidden',
    marginBottom: SPACING.xxl,
    borderRadius: RADIUS.card
  },
  pitchPlaceholder: {
    height: 210,
    backgroundColor: COLORS.fieldGreen,
    justifyContent: 'center',
    alignItems: 'center',
    padding: SPACING.l,
  },
  placeholderText: {
    color: '#FFFFFF',
    fontWeight: TYPOGRAPHY.weights.bold,
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    marginBottom: SPACING.s,
  },
  myPosText: {
    color: 'rgba(255, 255, 255, 0.9)',
    fontSize: TYPOGRAPHY.sizes.body,
    textAlign: 'center'
  },
  playerRow: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: SPACING.m,
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.08)',
  },
  playerNum: {
    width: 40,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.primary,
    textAlign: 'center',
  },
  playerName: {
    flex: 1,
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    color: COLORS.textPrimary,
  },
  playerPos: {
    color: COLORS.textSecondary,
    fontSize: TYPOGRAPHY.sizes.body,
    textAlign: 'right',
    paddingRight: SPACING.s
  }
});

export default DetalleEquipoJugadorScreen;
