import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Button from '../../components/Button';
import Input from '../../components/Input';
import { API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS } from '../../theme/theme';

const ResultadoPartidoScreen = ({ route, navigation }) => {
  const [loading, setLoading] = useState(true);
  const [estadisticas, setEstadisticas] = useState(null);
  const [observaciones, setObservaciones] = useState('');
  
  const partidoId = route.params?.partidoId;

  const fetchEstadisticas = async () => {
    if (!partidoId) {
      setLoading(false);
      return;
    }

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
      } else {
        Alert.alert('Error', data.detail || 'Error al obtener estadísticas finales');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchEstadisticas();
  }, [partidoId]);

  const handleGuardarActa = () => {
    Alert.alert('Éxito', 'El acta del partido se ha guardado correctamente.');
    navigation.navigate('ArbitroApp');
  };

  if (loading || !estadisticas) {
    return (
      <View style={[styles.container, { justifyContent: 'center', alignItems: 'center' }]}>
        <ActivityIndicator size="large" color={COLORS.primary} />
      </View>
    );
  }

  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
      <Text style={styles.title}>Resultado Final</Text>
      <Text style={styles.subtitle}>Verifica los datos antes de cerrar el acta</Text>

      <Card elevated glow style={styles.scoreCard}>
        <View style={styles.team}>
          <View style={styles.avatarPlaceholder} />
          <Text style={styles.teamName}>LOCAL</Text>
          <Text style={styles.score}>{estadisticas.marcador.local}</Text>
        </View>
        <Text style={styles.vs}>VS</Text>
        <View style={styles.team}>
          <View style={styles.avatarPlaceholder} />
          <Text style={styles.teamName}>VISITA</Text>
          <Text style={styles.score}>{estadisticas.marcador.visita}</Text>
        </View>
      </Card>

      <Card elevated>
        <Text style={styles.sectionTitle}>Firma del Acta</Text>
        <Input 
          label="Observaciones del Árbitro" 
          placeholder="Ej. Ningún incidente grave..." 
          value={observaciones}
          onChangeText={setObservaciones}
        />
        
        <View style={styles.signatureBox}>
          <Text style={styles.placeholderText}>[Firma Digital Capitán Local]</Text>
        </View>
        
        <View style={styles.signatureBox}>
          <Text style={styles.placeholderText}>[Firma Digital Capitán Visitante]</Text>
        </View>
        
        <Button 
          title="Guardar y Enviar Acta" 
          onPress={handleGuardarActa}
          style={{ marginTop: SPACING.m }}
        />
      </Card>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: COLORS.background, padding: SPACING.l },
  title: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.xs },
  subtitle: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginBottom: SPACING.xl },
  scoreCard: { flexDirection: 'row', justifyContent: 'space-around', alignItems: 'center', paddingVertical: SPACING.xxl, marginBottom: SPACING.xl },
  team: { alignItems: 'center' },
  avatarPlaceholder: { width: 60, height: 60, borderRadius: 30, backgroundColor: COLORS.surfaceLight, borderWidth: 1, borderColor: 'rgba(255, 255, 255, 0.1)', marginBottom: SPACING.s },
  teamName: { color: COLORS.textSecondary, fontSize: TYPOGRAPHY.sizes.body, fontWeight: TYPOGRAPHY.weights.bold, marginBottom: SPACING.s },
  score: { color: COLORS.textPrimary, fontSize: 42, fontWeight: TYPOGRAPHY.weights.bold },
  vs: { color: COLORS.primary, fontSize: TYPOGRAPHY.sizes.title, fontWeight: TYPOGRAPHY.weights.bold },
  sectionTitle: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.m },
  signatureBox: { height: 100, backgroundColor: COLORS.background, borderWidth: 1, borderColor: 'rgba(255, 255, 255, 0.1)', borderRadius: COMPONENTS.input.radius, justifyContent: 'center', alignItems: 'center', marginBottom: SPACING.m },
  placeholderText: { color: COLORS.textMuted, fontStyle: 'italic' }
});

export default ResultadoPartidoScreen;
