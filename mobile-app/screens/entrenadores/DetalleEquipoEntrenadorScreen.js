import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, TouchableOpacity } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Badge from '../../components/Badge';
import Button from '../../components/Button';
import { API_BASE, API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS } from '../../theme/theme';

const DetalleEquipoEntrenadorScreen = ({ navigation }) => {
  const [loading, setLoading] = useState(true);
  const [equipo, setEquipo] = useState(null);
  const [proximoPartido, setProximoPartido] = useState(null);
  const [todosPartidos, setTodosPartidos] = useState([]);
  const [mostrarTodos, setMostrarTodos] = useState(false);

  const formatearFecha = (fechaStr) => {
    try {
      const parts = fechaStr.split(/[T ]/);
      const [y, m, d] = parts[0].split('-');
      const [hr, min] = parts[1].split(':');
      return `${d}/${m}/${y} ${hr}:${min}`;
    } catch {
      return fechaStr;
    }
  };

  const fetchMiEquipo = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) {
        setLoading(false);
        return;
      }

      const response = await fetch(API.entrenadorMisEquipos, {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        if (data && data.length > 0) {
          const eq = data[0];
          setEquipo(eq);
          await fetchProximoPartido(eq.id, token);
          await fetchTodosPartidos(eq.id, token);
        } else {
          setEquipo(null);
        }
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

  const fetchProximoPartido = async (equipoId, token) => {
    try {
      const res = await fetch(API.entrenadorProximoPartido(equipoId), {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      const data = await res.json();
      if (res.ok && data) {
        setProximoPartido(data);
      }
    } catch (err) {
      console.error('Error fetching proximo partido:', err);
    }
  };

  const fetchTodosPartidos = async (equipoId, token) => {
    try {
      const res = await fetch(API.entrenadorPartidos(equipoId), {
        headers: { 'Authorization': `Bearer ${token}` }
      });
      const data = await res.json();
      if (res.ok && Array.isArray(data)) {
        setTodosPartidos(data);
      }
    } catch (err) {
      console.error('Error fetching partidos:', err);
    }
  };

  useEffect(() => {
    fetchMiEquipo();
    const unsubscribe = navigation.addListener('focus', () => {
      fetchMiEquipo();
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
      <View style={[styles.container, { justifyContent: 'center', alignItems: 'center', padding: SPACING.l }]}>
        <Text style={{ textAlign: 'center', color: COLORS.textPrimary, fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold }}>Aún no tienes un equipo</Text>
        <Text style={{ textAlign: 'center', color: COLORS.textSecondary, marginTop: SPACING.xs, marginBottom: SPACING.xl }}>Ve a la pestaña "Crear Equipo" para registrar uno nuevo y comenzar a jugar.</Text>
        <Button title="Crear Equipo" onPress={() => navigation.navigate('Crear Equipo')} />
      </View>
    );
  }

  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
      <View style={styles.headerInfo}>
        <View style={styles.avatarPlaceholder} />
        <View>
          <Text style={styles.title}>{equipo.nombre}</Text>
          <Badge title="Activo" type="success" />
        </View>
      </View>

      <View style={styles.actionGrid}>
        <Button 
          title="Alineación" 
          onPress={() => navigation.navigate('ConfigurarAlineacion', { equipoId: equipo.id })}
          style={styles.gridBtn}
        />
        <Button 
          title="Jugadores" 
          type="secondary"
          onPress={() => navigation.navigate('AsignacionJugadores', { equipoId: equipo.id })}
          style={styles.gridBtn}
        />
        <Button 
          title="Solicitudes" 
          type="secondary"
          onPress={() => navigation.navigate('SolicitudesIngreso', { equipoId: equipo.id })}
          style={styles.gridBtn}
        />
      </View>

      <Text style={styles.sectionTitle}>Próximo Partido</Text>
      {proximoPartido ? (
        <Card elevated accent style={{ marginBottom: SPACING.xl }}>
          <View style={styles.proximoHeader}>
            <Badge title={formatearFecha(proximoPartido.fecha_hora)} type="success" />
            <Badge 
              title={proximoPartido.estado === 'programado' ? 'Programado' : proximoPartido.estado} 
              type={proximoPartido.estado === 'programado' ? 'warning' : 'neutral'} 
            />
          </View>
          <Text style={styles.matchup}>{equipo.nombre} vs {proximoPartido.rival}</Text>
          <View style={styles.matchDetailRow}>
            <Text style={styles.matchSede}>{proximoPartido.cancha}{proximoPartido.sede ? ` - ${proximoPartido.sede}` : ''}</Text>
          </View>
        </Card>
      ) : (
        <Card elevated accent style={{ marginBottom: SPACING.xl }}>
          <Text style={styles.matchDate}>Pendiente</Text>
          <Text style={styles.matchup}>Aún no hay partidos asignados</Text>
          <Text style={styles.matchSede}>Revisa las notificaciones para conocer tu agenda.</Text>
        </Card>
      )}

      {}
      <View style={styles.calendarioHeader}>
        <Text style={styles.sectionTitle}>Calendario de Partidos</Text>
        {todosPartidos.length > 0 && (
          <TouchableOpacity onPress={() => setMostrarTodos(!mostrarTodos)}>
            <Text style={styles.toggleText}>{mostrarTodos ? 'Ocultar' : `Ver todos (${todosPartidos.length})`}</Text>
          </TouchableOpacity>
        )}
      </View>

      {todosPartidos.length === 0 ? (
        <Card elevated>
          <Text style={{ textAlign: 'center', color: COLORS.textMuted, padding: SPACING.m }}>No hay partidos programados para tu equipo.</Text>
        </Card>
      ) : (
        (mostrarTodos ? todosPartidos : todosPartidos.slice(0, 3)).map((partido, index) => (
          <Card elevated key={partido.id || index} style={{ marginBottom: SPACING.m }}>
            <View style={styles.partidoRow}>
              <View style={{ flex: 1 }}>
                <Text style={styles.partidoTeams}>{partido.rival ? `${equipo.nombre} vs ${partido.rival}` : `${partido.equipo_local || '?'} vs ${partido.equipo_visita || '?'}`}</Text>
                <Text style={styles.partidoFecha}>{formatearFecha(partido.fecha_hora || partido.fecha)}</Text>
                <Text style={styles.partidoDetalle}>{partido.cancha}{partido.sede ? ` - ${partido.sede}` : ''}</Text>
                <Text style={styles.partidoDetalle}>{partido.arbitro}</Text>
              </View>
              <Badge 
                title={partido.estado === 'programado' ? 'Prog.' : partido.estado === 'finalizado' ? 'Final' : partido.estado || 'Pendiente'} 
                type={partido.estado === 'programado' ? 'warning' : partido.estado === 'finalizado' ? 'neutral' : 'success'} 
              />
            </View>
          </Card>
        ))
      )}

      <Text style={[styles.sectionTitle, { marginTop: SPACING.m }]}>Estadísticas Generales</Text>
      <View style={styles.statsRow}>
        <Card elevated style={styles.statCard}>
          <Text style={styles.statVal}>0</Text>
          <Text style={styles.statLbl}>Posición</Text>
        </Card>
        <Card elevated style={styles.statCard}>
          <Text style={styles.statVal}>0</Text>
          <Text style={styles.statLbl}>Puntos</Text>
        </Card>
        <Card elevated style={styles.statCard}>
          <Text style={styles.statVal}>0</Text>
          <Text style={styles.statLbl}>Dif. Gol</Text>
        </Card>
      </View>

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
    marginBottom: 4,
  },
  actionGrid: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: SPACING.xxl,
  },
  gridBtn: {
    width: '31%',
    paddingHorizontal: 4,
    paddingVertical: 10,
  },
  sectionTitle: {
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.m,
  },
  proximoHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: SPACING.m,
  },
  matchDate: {
    color: COLORS.primary,
    fontWeight: TYPOGRAPHY.weights.bold,
    marginBottom: 4,
  },
  matchup: {
    fontSize: TYPOGRAPHY.sizes.title,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.xs,
  },
  matchDetailRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 4,
  },
  matchSede: {
    color: COLORS.textSecondary,
    fontSize: TYPOGRAPHY.sizes.body,
  },
  calendarioHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: SPACING.xs,
    marginBottom: 4,
  },
  toggleText: {
    color: COLORS.primary,
    fontWeight: TYPOGRAPHY.weights.bold,
    fontSize: TYPOGRAPHY.sizes.body,
  },
  partidoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  partidoTeams: {
    fontSize: 15,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: 4,
  },
  partidoFecha: {
    fontSize: 13,
    color: COLORS.primary,
    fontWeight: TYPOGRAPHY.weights.bold,
    marginBottom: 2,
  },
  partidoDetalle: {
    fontSize: 12,
    color: COLORS.textSecondary,
    marginBottom: 1,
  },
  statsRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: SPACING.xxl
  },
  statCard: {
    width: '31%',
    alignItems: 'center',
    padding: SPACING.m,
  },
  statVal: {
    fontSize: 24,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.primary,
  },
  statLbl: {
    fontSize: 12,
    color: COLORS.textSecondary,
  }
});

export default DetalleEquipoEntrenadorScreen;
