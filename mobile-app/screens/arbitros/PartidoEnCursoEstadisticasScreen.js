import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Button from '../../components/Button';
import Badge from '../../components/Badge';
import Card from '../../components/Card';
import { API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, SHADOWS, RADIUS } from '../../theme/theme';

const PartidoEnCursoEstadisticasScreen = ({ route, navigation }) => {
  const [loading, setLoading] = useState(true);
  const [estadisticas, setEstadisticas] = useState(null);
  const [seconds, setSeconds] = useState(0);
  const [tab, setTab] = useState('estadisticas');
  
  const partidoId = route.params?.partidoId;

  const fetchEstadisticas = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      const response = await fetch(API.arbitroPartidoEstadisticas(partidoId), {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        setEstadisticas(data);
      }
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchEstadisticas();
    const interval = setInterval(() => {
      setSeconds(s => s + 1);
      fetchEstadisticas();
    }, 10000);
    
    const timerInterval = setInterval(() => {
      setSeconds(s => s + 1);
    }, 1000);

    const unsubscribe = navigation.addListener('focus', () => {
      fetchEstadisticas();
    });

    return () => {
      clearInterval(interval);
      clearInterval(timerInterval);
      unsubscribe();
    };
  }, [partidoId]);

  const handleFinalizar = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      const response = await fetch(API.arbitroFinalizarPartido(partidoId), {
        method: 'PUT',
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      if (response.ok) {
        navigation.navigate('ResultadoPartido', { partidoId });
      } else {
        Alert.alert('Error', 'No se pudo finalizar el partido');
      }
    } catch (error) {
      Alert.alert('Error', 'Error de conexión');
    }
  };

  const formatTimer = () => {
    const m = Math.floor(seconds / 60).toString().padStart(2, '0');
    const s = (seconds % 60).toString().padStart(2, '0');
    return `${m}:${s}`;
  };

  if (loading || !estadisticas) {
    return (
      <View style={[styles.container, { justifyContent: 'center', alignItems: 'center' }]}>
        <ActivityIndicator size="large" color={COLORS.primary} />
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.timer}>{formatTimer()}</Text>
        <View style={styles.scoreBoard}>
          <View style={styles.team}>
            <Text style={styles.teamName}>LOCAL</Text>
            <Text style={styles.score}>{estadisticas.marcador.local}</Text>
          </View>
          <Text style={styles.vs}>-</Text>
          <View style={styles.team}>
            <Text style={styles.teamName}>VISITA</Text>
            <Text style={styles.score}>{estadisticas.marcador.visita}</Text>
          </View>
        </View>
      </View>

      <ScrollView style={styles.content} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
        <View style={styles.tabs}>
          <Text 
            style={[styles.tab, tab === 'estadisticas' && styles.tabActive]}
            onPress={() => setTab('estadisticas')}
          >Estadísticas</Text>
          <Text 
            style={[styles.tab, tab === 'eventos' && styles.tabActive]}
            onPress={() => setTab('eventos')}
          >Eventos</Text>
        </View>

        {tab === 'estadisticas' ? (
          <Card elevated>
            <View style={styles.statRow}>
              <Text style={styles.statValue}>{estadisticas.estadisticas.local.tiros}</Text>
              <Text style={styles.statLabel}>Tiros a Gol</Text>
              <Text style={styles.statValue}>{estadisticas.estadisticas.visita.tiros}</Text>
            </View>

            <View style={styles.statRow}>
              <Text style={styles.statValue}>{estadisticas.estadisticas.local.tiros_esquina}</Text>
              <Text style={styles.statLabel}>Tiros de Esquina</Text>
              <Text style={styles.statValue}>{estadisticas.estadisticas.visita.tiros_esquina}</Text>
            </View>

            <View style={styles.statRow}>
              <Text style={styles.statValue}>{estadisticas.estadisticas.local.faltas}</Text>
              <Text style={styles.statLabel}>Faltas</Text>
              <Text style={styles.statValue}>{estadisticas.estadisticas.visita.faltas}</Text>
            </View>
            
            <View style={styles.statRow}>
              <Text style={[styles.statValue, { color: COLORS.warning }]}>{estadisticas.estadisticas.local.amarillas}</Text>
              <Text style={styles.statLabel}>Tarjetas Amarillas</Text>
              <Text style={[styles.statValue, { color: COLORS.warning }]}>{estadisticas.estadisticas.visita.amarillas}</Text>
            </View>
            
            <View style={[styles.statRow, { borderBottomWidth: 0 }]}>
              <Text style={[styles.statValue, { color: COLORS.primary }]}>{estadisticas.estadisticas.local.rojas}</Text>
              <Text style={styles.statLabel}>Tarjetas Rojas</Text>
              <Text style={[styles.statValue, { color: COLORS.primary }]}>{estadisticas.estadisticas.visita.rojas}</Text>
            </View>
          </Card>
        ) : (
          <View>
            {estadisticas.eventos.length === 0 ? (
              <Card elevated style={{ alignItems: 'center', paddingVertical: SPACING.xxxl }}>
                <Text style={{ textAlign: 'center', color: COLORS.textMuted, fontSize: TYPOGRAPHY.sizes.bodyLarge }}>Aún no hay eventos registrados.</Text>
              </Card>
            ) : (
              estadisticas.eventos.map((ev, idx) => (
                <Card elevated key={idx} style={styles.eventCard}>
                  <Badge title={`Min ${ev.minuto}`} type="neutral" />
                  <Text style={styles.eventText}>{ev.tipo} - {ev.equipo} - {ev.jugador}</Text>
                </Card>
              ))
            )}
          </View>
        )}

      </ScrollView>

      <View style={styles.footer}>
        <Button title="Registrar Evento" onPress={() => navigation.navigate('PartidoEnCursoEventos', { partidoId })} />
        <Button title="Finalizar Partido" type="secondary" onPress={handleFinalizar} style={{ marginTop: SPACING.m }} />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: COLORS.background,
  },
  header: {
    backgroundColor: COLORS.surface,
    padding: SPACING.xxl,
    alignItems: 'center',
    borderBottomLeftRadius: RADIUS.card,
    borderBottomRightRadius: RADIUS.card,
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.08)',
    ...SHADOWS.medium,
  },
  timer: {
    fontSize: TYPOGRAPHY.sizes.headline,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.primary,
    marginBottom: SPACING.m,
  },
  scoreBoard: {
    flexDirection: 'row',
    alignItems: 'center',
    width: '100%',
    justifyContent: 'space-around',
  },
  team: {
    alignItems: 'center',
  },
  teamName: {
    color: COLORS.textSecondary,
    fontSize: TYPOGRAPHY.sizes.body,
    fontWeight: TYPOGRAPHY.weights.bold,
    marginBottom: SPACING.xs,
  },
  score: {
    color: COLORS.textPrimary,
    fontSize: 48,
    fontWeight: TYPOGRAPHY.weights.bold,
  },
  vs: {
    color: COLORS.textSecondary,
    fontSize: TYPOGRAPHY.sizes.title,
    fontWeight: TYPOGRAPHY.weights.bold,
  },
  content: {
    flex: 1,
    padding: SPACING.l,
  },
  tabs: {
    flexDirection: 'row',
    marginBottom: SPACING.xl,
    justifyContent: 'space-around',
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.08)',
  },
  tab: {
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    color: COLORS.textSecondary,
    paddingBottom: SPACING.s,
  },
  tabActive: {
    color: COLORS.primary,
    fontWeight: TYPOGRAPHY.weights.bold,
    borderBottomWidth: 2,
    borderBottomColor: COLORS.primary,
  },
  statRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingVertical: SPACING.m,
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.08)',
  },
  statLabel: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
  },
  statValue: {
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    width: 30,
    textAlign: 'center',
  },
  footer: {
    padding: SPACING.l,
    backgroundColor: COLORS.surface,
    borderTopWidth: 1,
    borderTopColor: 'rgba(255, 255, 255, 0.08)',
    ...SHADOWS.medium,
  },
  eventCard: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: SPACING.m,
    marginBottom: SPACING.s,
  },
  eventText: {
    marginLeft: SPACING.m,
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    color: COLORS.textPrimary,
    flex: 1,
  }
});

export default PartidoEnCursoEstadisticasScreen;
