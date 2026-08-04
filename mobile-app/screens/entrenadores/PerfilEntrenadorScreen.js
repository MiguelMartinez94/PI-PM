import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, TextInput } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Card from '../../components/Card';
import Button from '../../components/Button';
import { API_BASE, API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS } from '../../theme/theme';

const PerfilEntrenadorScreen = ({ navigation }) => {
  const [loading, setLoading] = useState(true);
  const [perfil, setPerfil] = useState(null);

  const [editModalVisible, setEditModalVisible] = useState(false);
  const [editNombre, setEditNombre] = useState('');
  const [editTelefono, setEditTelefono] = useState('');
  const [saving, setSaving] = useState(false);

  const fetchPerfil = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) {
        setLoading(false);
        return;
      }

      const response = await fetch(API.entrenadorPerfil, {
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });
      const data = await response.json();
      
      if (response.ok) {
        setPerfil(data);
        setEditNombre(data.nombre || '');
        setEditTelefono(data.telefono || '');
      } else {
        Alert.alert('Error', data.detail || 'Error al obtener perfil');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPerfil();
    const unsubscribe = navigation.addListener('focus', () => {
      fetchPerfil();
    });
    return unsubscribe;
  }, [navigation]);

  const handleLogout = async () => {
    await AsyncStorage.removeItem('userToken');
    await AsyncStorage.removeItem('userRole');
    navigation.navigate('Login');
  };

  const handleSaveProfile = async () => {
    setSaving(true);
    try {
      const token = await AsyncStorage.getItem('userToken');
      const body = {};
      if (editNombre) body.nombre = editNombre;
      if (editTelefono) body.telefono = editTelefono;

      const response = await fetch(API.entrenadorPerfil, {
        method: 'PUT',
        headers: {
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(body)
      });

      if (response.ok) {
        Alert.alert('Éxito', 'Perfil actualizado');
        setEditModalVisible(false);
        fetchPerfil();
      } else {
        Alert.alert('Error', 'No se pudo actualizar el perfil');
      }
    } catch (err) {
      Alert.alert('Error', 'Error de red');
    } finally {
      setSaving(false);
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
    <View style={{ flex: 1, backgroundColor: COLORS.background }}>
      <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
        <Card elevated glow style={styles.profileHeader}>
          <View style={styles.avatarPlaceholder} />
          <Text style={styles.name}>{perfil?.nombre || 'Entrenador'}</Text>
          <Text style={styles.role}>Entrenador de Fútbol</Text>
          <Text style={{ color: COLORS.textSecondary, marginTop: 4 }}>{perfil?.correo}</Text>
          <Text style={{ color: COLORS.textSecondary, marginTop: 4 }}>{perfil?.telefono}</Text>
        </Card>

        <Text style={styles.sectionTitle}>Estadísticas como DT</Text>
        <View style={styles.statsRow}>
          <Card elevated style={styles.statCard}>
            <Text style={styles.statVal}>0</Text>
            <Text style={styles.statLbl}>Ganados</Text>
          </Card>
          <Card elevated style={styles.statCard}>
            <Text style={[styles.statVal, { color: COLORS.textSecondary }]}>0</Text>
            <Text style={styles.statLbl}>Empatados</Text>
          </Card>
          <Card elevated style={styles.statCard}>
            <Text style={styles.statVal}>0</Text>
            <Text style={styles.statLbl}>Perdidos</Text>
          </Card>
        </View>

        <Text style={styles.sectionTitle}>Opciones</Text>
        <Card elevated>
          <Button 
            title="Editar Perfil" 
            type="secondary"
            onPress={() => setEditModalVisible(true)} 
            style={{ marginBottom: SPACING.m }}
          />
          <Button 
            title="Cerrar Sesión" 
            onPress={handleLogout} 
          />
        </Card>
      </ScrollView>

      {editModalVisible && (
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <Text style={styles.modalTitle}>Editar Perfil</Text>
            
            <Text style={styles.inputLabel}>Nombre</Text>
            <TextInput 
              style={styles.input} 
              value={editNombre} 
              onChangeText={setEditNombre} 
            />

            <Text style={styles.inputLabel}>Teléfono</Text>
            <TextInput 
              style={styles.input} 
              value={editTelefono} 
              onChangeText={setEditTelefono} 
              keyboardType="phone-pad"
            />

            {saving ? (
              <ActivityIndicator size="large" color={COLORS.primary} />
            ) : (
              <>
                <Button title="Guardar Cambios" onPress={handleSaveProfile} style={{ marginBottom: SPACING.s }} />
                <Button title="Cancelar" onPress={() => setEditModalVisible(false)} type="secondary" />
              </>
            )}
          </View>
        </View>
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: COLORS.background, padding: SPACING.l },
  profileHeader: { alignItems: 'center', marginBottom: SPACING.xxl, marginTop: SPACING.s, paddingVertical: SPACING.xxl },
  avatarPlaceholder: { 
    width: 100, 
    height: 100, 
    borderRadius: 50, 
    backgroundColor: COLORS.surfaceLight, 
    borderWidth: 2, 
    borderColor: 'rgba(255, 255, 255, 0.15)',
    marginBottom: SPACING.l 
  },
  name: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  role: { fontSize: TYPOGRAPHY.sizes.bodyLarge, color: COLORS.primary, fontWeight: TYPOGRAPHY.weights.bold, marginTop: 2 },
  sectionTitle: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.m },
  statsRow: { flexDirection: 'row', justifyContent: 'space-between', marginBottom: SPACING.xxl },
  statCard: { width: '31%', alignItems: 'center', padding: SPACING.m },
  statVal: { fontSize: 24, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.primary },
  statLbl: { fontSize: 12, color: COLORS.textSecondary },
  modalOverlay: { 
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: 'rgba(0, 0, 0, 0.65)', 
    justifyContent: 'center', 
    alignItems: 'center',
    padding: SPACING.xl,
    zIndex: 9999,
    elevation: 9999,
  },
  modalContent: { 
    width: '100%', 
    backgroundColor: COLORS.surface, 
    borderRadius: RADIUS.card, 
    padding: SPACING.xl,
    borderWidth: 1,
    borderColor: 'rgba(255, 255, 255, 0.1)',
  },
  modalTitle: {
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.l,
    textAlign: 'center'
  },
  inputLabel: { color: COLORS.textPrimary, marginBottom: 6, fontWeight: TYPOGRAPHY.weights.bold },
  input: { 
    backgroundColor: COLORS.background, 
    borderWidth: 1, 
    borderColor: 'rgba(255, 255, 255, 0.1)', 
    padding: SPACING.m, 
    borderRadius: COMPONENTS.input.radius, 
    marginBottom: SPACING.l, 
    color: COLORS.textPrimary 
  }
});

export default PerfilEntrenadorScreen;
