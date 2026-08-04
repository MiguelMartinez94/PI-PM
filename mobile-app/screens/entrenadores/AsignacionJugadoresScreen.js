import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, TouchableOpacity } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Button from '../../components/Button';
import { API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING } from '../../theme/theme';

const AsignacionJugadoresScreen = ({ route, navigation }) => {
  const [loading, setLoading] = useState(true);
  const [jugadores, setJugadores] = useState([]);
  const equipoId = route.params?.equipoId;

  const fetchJugadores = async () => {
    if (!equipoId) {
      setLoading(false);
      return;
    }

    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      const response = await fetch(API.entrenadorJugadores(equipoId), {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        setJugadores(data);
      } else {
        Alert.alert('Error', data.detail || 'Error al obtener jugadores');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchJugadores();
  }, []);

  const expulsarJugador = async (jugadorId) => {
    Alert.alert(
      "Expulsar Jugador",
      "¿Estás seguro de que quieres expulsar a este jugador del equipo?",
      [
        { text: "Cancelar", style: "cancel" },
        { 
          text: "Expulsar", 
          style: "destructive",
          onPress: async () => {
            try {
              const token = await AsyncStorage.getItem('userToken');
              const response = await fetch(API.entrenadorExpulsarJugador(equipoId, jugadorId), {
                method: 'DELETE',
                headers: {
                  'Authorization': `Bearer ${token}`
                }
              });
              if (response.ok) {
                Alert.alert('Éxito', 'Jugador expulsado');
                fetchJugadores();
              } else {
                const data = await response.json();
                Alert.alert('Error', data.detail || 'No se pudo expulsar al jugador');
              }
            } catch(e) {
              Alert.alert('Error', 'Error de red');
            }
          }
        }
      ]
    );
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
      <Text style={styles.title}>Plantilla de Jugadores</Text>
      <Text style={styles.subtitle}>ID Equipo: {equipoId || 'N/A'}</Text>

      <Card elevated>
        <View style={styles.header}>
          <Text style={styles.sectionTitle}>Jugadores Activos</Text>
        </View>

        {jugadores.length === 0 ? (
          <Text style={{ textAlign: 'center', color: COLORS.textMuted, padding: SPACING.m }}>No hay jugadores en la plantilla</Text>
        ) : (
          jugadores.map((jugador) => (
            <View key={jugador.id} style={styles.playerRow}>
              <View style={styles.avatarPlaceholder} />
              <View style={styles.playerInfo}>
                <Text style={styles.playerName}>{jugador.nombre}</Text>
                <Text style={styles.playerRole}>Dorsal: #{jugador.dorsal || '-'}</Text>
              </View>
              <TouchableOpacity onPress={() => expulsarJugador(jugador.id)}>
                <Text style={{ color: COLORS.error, fontWeight: TYPOGRAPHY.weights.bold }}>Expulsar</Text>
              </TouchableOpacity>
            </View>
          ))
        )}
      </Card>
      
      <Button 
        title="Volver" 
        type="secondary"
        onPress={() => navigation.goBack()}
        style={{ marginTop: SPACING.l }}
      />
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: COLORS.background, padding: SPACING.l },
  title: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: 4 },
  subtitle: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginBottom: SPACING.l },
  header: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', marginBottom: SPACING.m },
  sectionTitle: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  playerRow: { flexDirection: 'row', alignItems: 'center', paddingVertical: SPACING.m, borderBottomWidth: 1, borderBottomColor: 'rgba(255, 255, 255, 0.08)' },
  avatarPlaceholder: { width: 40, height: 40, borderRadius: 20, backgroundColor: COLORS.surfaceLight, marginRight: SPACING.m },
  playerInfo: { flex: 1 },
  playerName: { fontSize: TYPOGRAPHY.sizes.bodyLarge, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  playerRole: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary }
});

export default AsignacionJugadoresScreen;
