import React, { useState } from 'react';
import { View, Text, StyleSheet, ScrollView, Alert, ActivityIndicator, Image, TouchableOpacity } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as ImagePicker from 'expo-image-picker';
import Card from '../../components/Card';
import Input from '../../components/Input';
import Button from '../../components/Button';
import { API_BASE, API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, RADIUS } from '../../theme/theme';

const CrearEquipoScreen = ({ navigation }) => {
  const [nombre, setNombre] = useState('');
  const [escudoUri, setEscudoUri] = useState(null);
  const [categoria, setCategoria] = useState('Masculina');
  const [loading, setLoading] = useState(false);

  const pickImage = async () => {
    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      quality: 0.8,
    });
    if (!result.canceled) {
      setEscudoUri(result.assets[0].uri);
    }
  };

  const handleCrearEquipo = async () => {
    if (!nombre) {
      Alert.alert('Error', 'El nombre del equipo es obligatorio');
      return;
    }

    setLoading(true);
    try {
      const token = await AsyncStorage.getItem('userToken');
      if (!token) return;

      let finalEscudoUrl = null;
      if (escudoUri) {
        const formData = new FormData();
        formData.append('file', {
          uri: escudoUri,
          name: 'escudo_equipo.jpg',
          type: 'image/jpeg',
        });
        const uploadRes = await fetch(API.upload, {
          method: 'POST',
          body: formData,
        });
        if (uploadRes.ok) {
          const uploadData = await uploadRes.json();
          finalEscudoUrl = uploadData.url;
        }
      }

      const response = await fetch(API.entrenadorCrearEquipo, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`
        },
        body: JSON.stringify({ 
          nombre: nombre,
          escudo_url: finalEscudoUrl,
          categoria_id: categoria === 'Masculina' ? 1 : 2
        })
      });
      
      const data = await response.json();
      
      if (response.ok) {
        Alert.alert('Éxito', 'Equipo creado correctamente');
        navigation.navigate('Mi Equipo');
      } else {
        Alert.alert('Error', data.detail || 'Error al crear equipo');
      }
    } catch (error) {
      console.error(error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
      <Text style={styles.title}>Crear Nuevo Equipo</Text>
      
      <Card elevated glow>
        <Input 
          label="Nombre del Equipo" 
          placeholder="Ej. Los Halcones" 
          value={nombre}
          onChangeText={setNombre}
        />
        
        <TouchableOpacity style={styles.imagePlaceholder} onPress={pickImage}>
          {escudoUri ? (
            <Image source={{ uri: escudoUri }} style={{ width: '100%', height: '100%', borderRadius: 60 }} />
          ) : (
            <Text style={styles.placeholderText}>Subir Logo</Text>
          )}
        </TouchableOpacity>
        
        <Text style={styles.label}>Categoría</Text>
        <View style={styles.catRow}>
          <Button 
            title="Masculina" 
            type={categoria === 'Masculina' ? 'primary' : 'secondary'}
            style={styles.catBtn} 
            onPress={() => setCategoria('Masculina')} 
          />
          <Button 
            title="Femenina" 
            type={categoria === 'Femenina' ? 'primary' : 'secondary'}
            style={styles.catBtn} 
            onPress={() => setCategoria('Femenina')} 
          />
        </View>

        {loading ? (
          <ActivityIndicator size="large" color={COLORS.primary} style={{ marginTop: SPACING.xxl }} />
        ) : (
          <Button 
            title="Registrar Equipo" 
            onPress={handleCrearEquipo}
            style={{ marginTop: SPACING.xxl, marginBottom: SPACING.m }}
          />
        )}
      </Card>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: COLORS.background, padding: SPACING.l },
  title: { fontSize: TYPOGRAPHY.sizes.headline, fontWeight: TYPOGRAPHY.weights.bold, color: COLORS.textPrimary, marginBottom: SPACING.l },
  imagePlaceholder: {
    width: 120, 
    height: 120, 
    borderRadius: 60, 
    backgroundColor: COLORS.surfaceLight, 
    borderWidth: 2, 
    borderColor: 'rgba(255, 255, 255, 0.15)', 
    borderStyle: 'dashed', 
    justifyContent: 'center', 
    alignItems: 'center', 
    alignSelf: 'center',
    marginTop: SPACING.m, 
    marginBottom: SPACING.m
  },
  placeholderText: { color: COLORS.textMuted, fontWeight: TYPOGRAPHY.weights.medium },
  label: { fontSize: TYPOGRAPHY.sizes.body, fontWeight: TYPOGRAPHY.weights.medium, color: COLORS.textPrimary, marginBottom: SPACING.s, marginTop: SPACING.xs },
  catRow: { flexDirection: 'row', justifyContent: 'space-between' },
  catBtn: { width: '48%' }
});

export default CrearEquipoScreen;
