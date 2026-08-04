import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Badge from '../../components/Badge';
import Button from '../../components/Button';
import { API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING } from '../../theme/theme';

const MisPartidosAsignadosScreen = ({ navigation }) => {
  const [loading, setLoading] = useState(true);
  const [partidos, setPartidos] = useState([]);

  const fetchPartidos = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) {
        setLoading(false);
        return;
      }

      const response = await fetch(API.arbitroMisPartidos, {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        if (Array.isArray(data)) {
          setPartidos(data);
        } else if (data?.value && Array.isArray(data.value)) {
          setPartidos(data.value);
        } else {
          console.warn('Unexpected arbitroMisPartidos response shape', data);
          setPartidos([]);
        }
      } else {
        Alert.alert('Error', data.detail || 'Error al obtener tus partidos');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPartidos();
    const unsubscribe = navigation.addListener('focus', () => {
      fetchPartidos();
    });
    return unsubscribe;
  }, [navigation]);

  const formatearFecha = (fechaHoraStr) => {
    try {
      const date = new Date(fechaHoraStr);
      return date.toLocaleDateString() + ' ' + date.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
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

  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
      <Text style={styles.title}>Inicio</Text>
      <Text style={styles.subtitle}>Mis Partidos Asignados</Text>

      {partidos.length === 0 ? (
        <Card elevated style={{ alignItems: 'center', paddingVertical: SPACING.xxxl }}>
          <Text style={{ textAlign: 'center', color: COLORS.textMuted, fontSize: TYPOGRAPHY.sizes.bodyLarge }}>No tienes partidos asignados actualmente.</Text>
        </Card>
      ) : (
        partidos.map((partido) => (
          <Card elevated accent key={partido.partido_id} style={{ marginBottom: SPACING.l }}>
            <View style={styles.cardHeader}>
              <Badge 
                title={formatearFecha(partido.fecha_hora)} 
                type={partido.estado === 'programado' ? 'warning' : partido.estado === 'finalizado' ? 'neutral' : 'success'} 
              />
              <Text style={styles.tourney}>{partido.sede}</Text>
            </View>
            <Text style={styles.matchup}>{partido.equipo_local} vs {partido.equipo_visita}</Text>
            <Text style={styles.role}>Rol: Árbitro Central</Text>
            
            <View style={styles.actions}>
              {partido.estado !== 'finalizado' ? (
                <Button 
                  title={partido.estado === 'en_curso' ? "Continuar Partido" : "Iniciar Partido"}
                  onPress={() => navigation.navigate('ConfirmarInicio', { partidoId: partido.partido_id })} 
                  style={{ flex: 1, marginRight: SPACING.s }}
                />
              ) : (
                <Button 
                  title="Ver Resultados" 
                  type="secondary"
                  onPress={() => navigation.navigate('ResultadoPartido', { partidoId: partido.partido_id })} 
                  style={{ flex: 1 }}
                />
              )}
            </View>
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
    marginBottom: SPACING.xs,
  },
  subtitle: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
    marginBottom: SPACING.xl,
  },
  cardHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: SPACING.s,
  },
  tourney: {
    fontSize: TYPOGRAPHY.sizes.caption,
    color: COLORS.primary,
    fontWeight: TYPOGRAPHY.weights.bold,
  },
  matchup: {
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.xs,
  },
  role: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
    marginBottom: SPACING.m,
  },
  actions: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  }
});

export default MisPartidosAsignadosScreen;
