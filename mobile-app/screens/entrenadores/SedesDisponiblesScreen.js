import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, Image } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Button from '../../components/Button';
import { API, getImageUrl } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, RADIUS } from '../../theme/theme';

const SedesDisponiblesScreen = ({ navigation }) => {
  const [loading, setLoading] = useState(true);
  const [sedes, setSedes] = useState([]);

  const fetchSedes = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) {
        setLoading(false);
        return;
      }

      const response = await fetch(API.entrenadorSedes, {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        if (Array.isArray(data)) {
          setSedes(data);
        } else if (data?.value && Array.isArray(data.value)) {
          setSedes(data.value);
        } else {
          console.warn('Unexpected entrenadorSedes response shape', data);
          setSedes([]);
        }
      } else {
        Alert.alert('Error', data.detail || 'Error al obtener sedes');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchSedes();
    const unsubscribe = navigation.addListener('focus', () => {
      fetchSedes();
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
      <Text style={styles.title}>Sedes para Jugar</Text>
      <Text style={styles.subtitle}>Selecciona una sede para inscribir a tu equipo</Text>

      {sedes.length === 0 ? (
        <Card elevated style={{ alignItems: 'center', paddingVertical: SPACING.xxxl }}>
          <Text style={{ textAlign: 'center', color: COLORS.textMuted, fontSize: TYPOGRAPHY.sizes.bodyLarge }}>No hay sedes activas por el momento.</Text>
        </Card>
      ) : (
        sedes.map(sede => (
          <Card elevated key={sede.id} style={{ marginBottom: SPACING.l }}>
            {sede.foto_url ? (
              <Image source={{ uri: getImageUrl(sede.foto_url) }} style={styles.imagePlaceholder} />
            ) : (
              <View style={styles.imagePlaceholder}>
                <Text style={styles.placeholderText}>[Foto {sede.nombre}]</Text>
              </View>
            )}
            <Text style={styles.sedeName}>{sede.nombre}</Text>
            <Text style={styles.sedeInfo}>{sede.direccion}</Text>
            <Text style={styles.sedeInfo}>Canchas: {sede.cantidad_canchas ?? 'N/D'}</Text>
            <Button 
              title="Ver Torneos" 
              onPress={() => navigation.navigate('TorneosPorSede', { sedeId: sede.id })}
              style={{ marginTop: SPACING.m }}
            />
          </Card>
        ))
      )}
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: COLORS.background, padding: SPACING.l },
  title: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.xs },
  subtitle: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginBottom: SPACING.xl },
  imagePlaceholder: { height: 130, backgroundColor: COLORS.surfaceLight, borderRadius: RADIUS.medium, justifyContent: 'center', alignItems: 'center', marginBottom: SPACING.m, overflow: 'hidden' },
  placeholderText: { color: COLORS.textMuted, fontWeight: TYPOGRAPHY.weights.medium },
  sedeName: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  sedeInfo: { fontSize: TYPOGRAPHY.sizes.body, color: COLORS.textSecondary, marginTop: 4 }
});

export default SedesDisponiblesScreen;
