import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView, ActivityIndicator, Alert, Image, TextInput } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as ImagePicker from 'expo-image-picker';
import Card from '../../components/Card';
import Button from '../../components/Button';
import { API_BASE } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS } from '../../theme/theme';

const PerfilJugadorScreen = ({ navigation }) => {
  const [loading, setLoading] = useState(true);
  const [perfil, setPerfil] = useState(null);
  
  const [editModalVisible, setEditModalVisible] = useState(false);
  const [editNombre, setEditNombre] = useState('');
  const [editTelefono, setEditTelefono] = useState('');
  const [editFoto, setEditFoto] = useState(null);
  const [saving, setSaving] = useState(false);

  const fetchPerfil = async () => {
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      const response = await fetch(`${API_BASE}/jugadores/perfil`, {
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

  const pickImage = async () => {
    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      quality: 0.8,
    });
    if (!result.canceled) {
      setEditFoto(result.assets[0].uri);
    }
  };

  const handleSaveProfile = async () => {
    setSaving(true);
    try {
      let nuevaFotoUrl = perfil.foto_url;
      const token = await AsyncStorage.getItem('userToken');

      if (editFoto) {
        const formData = new FormData();
        formData.append('file', {
          uri: editFoto,
          name: 'perfil_update.jpg',
          type: 'image/jpeg',
        });
        const uploadRes = await fetch(`${API_BASE}/upload`, {
          method: 'POST',
          body: formData,
        });
        if (uploadRes.ok) {
          const uploadData = await uploadRes.json();
          nuevaFotoUrl = uploadData.url;
        }
      }

      const url = new URL(`${API_BASE}/jugadores/perfil`);
      if (editNombre) url.searchParams.append('nombre', editNombre);
      if (editTelefono) url.searchParams.append('telefono', editTelefono);
      if (nuevaFotoUrl) url.searchParams.append('foto_url', nuevaFotoUrl);

      const updateRes = await fetch(url.toString(), {
        method: 'PUT',
        headers: {
          'Authorization': `Bearer ${token}`
        }
      });

      if (updateRes.ok) {
        Alert.alert('Éxito', 'Perfil actualizado correctamente');
        setEditModalVisible(false);
        setEditFoto(null);
        fetchPerfil();
      } else {
        Alert.alert('Error', 'No se pudo actualizar el perfil');
      }
    } catch (err) {
      console.error(err);
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

  const avatarSource = perfil?.foto_url 
    ? { uri: `${API_BASE}${perfil.foto_url.startsWith('/') ? perfil.foto_url : `/${perfil.foto_url}`}` }
    : null;

  return (
    <View style={{ flex: 1, backgroundColor: COLORS.background }}>
      <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
        <Card elevated glow style={styles.profileHeader}>
          {avatarSource ? (
            <Image source={avatarSource} style={styles.avatar} />
          ) : (
            <View style={styles.avatarPlaceholder} />
          )}
          <Text style={styles.name}>{perfil?.nombre || 'Jugador'}</Text>
          <Text style={styles.role}>Posición: {perfil?.posicion || 'Sin definir'}</Text>
          <Text style={{ color: COLORS.textSecondary, marginTop: 4 }}>{perfil?.correo}</Text>
          <Text style={{ color: COLORS.textSecondary, marginTop: 4 }}>{perfil?.telefono}</Text>
        </Card>

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

            <Button title="Cambiar Foto de Perfil" onPress={pickImage} type="secondary" style={{ marginBottom: SPACING.l }} />
            {editFoto && <Text style={{ color: COLORS.success, marginBottom: SPACING.l, textAlign: 'center' }}>Nueva foto seleccionada</Text>}

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
    width: 104, 
    height: 104, 
    borderRadius: 52, 
    backgroundColor: COLORS.surfaceLight, 
    borderWidth: 2, 
    borderColor: 'rgba(255, 255, 255, 0.15)',
    marginBottom: SPACING.l 
  },
  avatar: { width: 104, height: 104, borderRadius: 52, marginBottom: SPACING.l },
  name: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary },
  role: { fontSize: TYPOGRAPHY.sizes.bodyLarge, color: COLORS.primary, fontWeight: TYPOGRAPHY.weights.bold, marginTop: 2 },
  sectionTitle: { fontSize: TYPOGRAPHY.sizes.subtitle, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.m },
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

export default PerfilJugadorScreen;
