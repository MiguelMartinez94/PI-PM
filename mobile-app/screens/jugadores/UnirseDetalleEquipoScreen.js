import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, ScrollView, Alert, ActivityIndicator, Image } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Button from '../../components/Button';
import { API_BASE } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS } from '../../theme/theme';

const getImageUrl = (url) => {
  if (!url) return null;
  if (url.startsWith('http://') || url.startsWith('https://')) return url;
  if (url.startsWith('/')) return `${API_BASE}${url}`;
  return `${API_BASE}/${url}`;
};

const UnirseDetalleEquipoScreen = ({ route, navigation }) => {
  const [loading, setLoading] = useState(false);
  const [fetchingData, setFetchingData] = useState(true);
  const [teamInfo, setTeamInfo] = useState(null);
  
  const equipoId = route.params?.equipoId;

  useEffect(() => {
    const fetchDetalles = async () => {
      try {
        const token = await AsyncStorage.getItem('userToken');
        if (!token) return;
        const res = await fetch(`${API_BASE}/jugadores/equipo/${equipoId}`, {
          headers: { 'Authorization': `Bearer ${token}` }
        });
        if (res.ok) {
          const data = await res.json();
          setTeamInfo(data);
        }
      } catch (err) {
        console.error(err);
      } finally {
        setFetchingData(false);
      }
    };
    fetchDetalles();
  }, [equipoId]);

  const handlePostularse = async () => {
    if (!equipoId) {
      Alert.alert('Error', 'ID de equipo no encontrado');
      return;
    }

    setLoading(true);
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      const response = await fetch(`${API_BASE}/jugadores/equipo/${equipoId}/unirse`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        Alert.alert('Éxito', data.message || 'Solicitud enviada exitosamente');
        navigation.goBack();
      } else {
        Alert.alert('Error', data.detail || 'No se pudo enviar la solicitud');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  if (fetchingData) {
    return (
      <View style={[styles.container, { justifyContent: 'center', alignItems: 'center' }]}>
        <ActivityIndicator size="large" color={COLORS.primary} />
      </View>
    );
  }

  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
      <View style={styles.headerInfo}>
        {getImageUrl(teamInfo?.escudo_url) ? (
          <Image source={{ uri: getImageUrl(teamInfo.escudo_url) }} style={styles.avatarPlaceholder} />
        ) : (
          <View style={styles.avatarPlaceholder} />
        )}
        <View style={{ flex: 1 }}>
          <Text style={styles.title}>{teamInfo?.nombre || 'Nombre no disponible'}</Text>
        </View>
      </View>

      <Text style={styles.sectionTitle}>Información del Equipo</Text>
      <Card elevated>
        <Text style={styles.infoLabel}>Entrenador:</Text>
        <Text style={styles.infoValue}>{teamInfo?.entrenador || 'Sin entrenador'}</Text>
      </Card>

      <Text style={styles.sectionTitle}>Jugadores del Equipo</Text>
      <Card elevated>
        {!teamInfo?.jugadores || teamInfo.jugadores.length === 0 ? (
          <Text style={{ color: COLORS.textMuted, textAlign: 'center', padding: SPACING.m }}>No hay jugadores registrados</Text>
        ) : (
          teamInfo.jugadores.map((j) => (
            <View key={j.id} style={styles.playerRow}>
              {getImageUrl(j.foto_url) ? (
                <Image source={{ uri: getImageUrl(j.foto_url) }} style={styles.playerAvatar} />
              ) : (
                <View style={styles.playerAvatar} />
              )}
              <View style={{ flex: 1, marginLeft: SPACING.m }}>
                <Text style={styles.playerName}>{j.nombre}</Text>
                <Text style={styles.playerPos}>{j.posicion}</Text>
              </View>
            </View>
          ))
        )}
      </Card>

      {loading ? (
        <ActivityIndicator size="large" color={COLORS.primary} style={{ marginTop: SPACING.xxl }} />
      ) : (
        <Button 
          title="Enviar Solicitud de Ingreso" 
          onPress={handlePostularse}
          style={{ marginTop: SPACING.xxl, marginBottom: 40 }}
        />
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
  sectionTitle: {
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.m,
  },
  infoLabel: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
    marginTop: SPACING.xs,
  },
  infoValue: {
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    color: COLORS.textPrimary,
    fontWeight: TYPOGRAPHY.weights.bold,
    marginTop: 2,
  },
  playerRow: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: SPACING.m,
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.08)',
  },
  playerAvatar: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: COLORS.surfaceLight,
  },
  playerName: {
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
  },
  playerPos: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
  }
});

export default UnirseDetalleEquipoScreen;
