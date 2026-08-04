import React, { useState } from 'react';
import { View, Text, StyleSheet, ScrollView, Image, TouchableOpacity, Alert, ActivityIndicator } from 'react-native';
import * as ImagePicker from 'expo-image-picker';
import Input from '../../components/Input';
import Button from '../../components/Button';
import Card from '../../components/Card';
import { Picker } from '@react-native-picker/picker';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS } from '../../theme/theme';

const RegistroJugadorScreen = ({ navigation }) => {
  const [nombre, setNombre] = useState('');
  const [correo, setCorreo] = useState('');
  const [telefono, setTelefono] = useState('');
  const [posicion, setPosicion] = useState('Delantero');
  const [contrasena, setContrasena] = useState('');
  const [confirmarContrasena, setConfirmarContrasena] = useState('');
  const [foto, setFoto] = useState(null);
  const [loading, setLoading] = useState(false);

  
  const [modalVisible, setModalVisible] = useState(false);
  const [modalConfig, setModalConfig] = useState({ title: '', message: '', type: 'error' });

  const showModal = (title, message, type = 'error') => {
    setModalConfig({ title, message, type });
    setModalVisible(true);
  };

  const handlePickImage = async () => {
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      aspect: [1, 1],
      quality: 0.5,
    });

    if (!result.canceled) {
      setFoto(result.assets[0]);
    }
  };

  const handleRegistro = async () => {
    if (!nombre || !correo || !telefono || !contrasena || !confirmarContrasena) {
      showModal('Campos Incompletos', 'Por favor completa todos los campos requeridos para continuar.', 'error');
      return;
    }

    if (contrasena !== confirmarContrasena) {
      showModal('Error', 'Las contraseñas no coinciden.', 'error');
      return;
    }
    setLoading(true);
    try {
      let fotoUrl = null;
      if (foto) {
        const formData = new FormData();
        formData.append('file', {
          uri: foto.uri,
          name: 'profile.jpg',
          type: 'image/jpeg'
        });
        const uploadRes = await fetch('http://localhost:8001/health', {
          method: 'POST',
          body: formData,
        });
        if (uploadRes.ok) {
          const uploadData = await uploadRes.json();
          fotoUrl = uploadData.url;
        }
      }

      const body = {
        usuario: {
          nombre,
          correo,
          telefono,
          foto_url: fotoUrl,
          contrasena,
          rol_id: 2
        },
        jugador: {
          posicion
        }
      };

      const res = await fetch('http://localhost:8001/health', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body)
      });
      const data = await res.json();
      
      if (res.ok) {
        Alert.alert('Éxito', 'Jugador registrado correctamente');
        navigation.navigate('Login');
      } else {
        showModal('Error', data.detail || 'No se pudo registrar el jugador', 'error');
      }
    } catch (error) {
      console.error(error);
      showModal('Error', 'No se pudo conectar con el servidor', 'error');
    } finally {
      setLoading(false);
    }
  };

  return (
    <View style={{ flex: 1, backgroundColor: COLORS.background }}>
      <ScrollView 
        style={styles.container}
        keyboardShouldPersistTaps="handled"
      >
        <Text style={styles.title}>Registro de Jugador</Text>
        
        <Card>
          <Input label="Nombre Completo" placeholder="Ej. Luis Hernández" value={nombre} onChangeText={setNombre} />
          <Input label="Correo Electrónico" placeholder="ejemplo@correo.com" value={correo} onChangeText={setCorreo} autoCapitalize="none" keyboardType="email-address" />
          <Input label="Teléfono" placeholder="Ej. 1234567890" value={telefono} onChangeText={setTelefono} keyboardType="phone-pad" />
          
          <Text style={styles.label}>Posición Principal</Text>
          <View style={styles.pickerContainer}>
            <Picker
              selectedValue={posicion}
              onValueChange={(itemValue) => setPosicion(itemValue)}
              style={{ color: COLORS.textPrimary }}
              dropdownIconColor={COLORS.textPrimary}
            >
              <Picker.Item label="Delantero" value="Delantero" />
              <Picker.Item label="Medio" value="Medio" />
              <Picker.Item label="Defensa" value="Defensa" />
              <Picker.Item label="Portero" value="Portero" />
            </Picker>
          </View>

          <Input label="Contraseña" placeholder="••••••••" secureTextEntry value={contrasena} onChangeText={setContrasena} />
          <Input label="Confirmar Contraseña" placeholder="••••••••" secureTextEntry value={confirmarContrasena} onChangeText={setConfirmarContrasena} />
          
          <TouchableOpacity style={styles.imagePlaceholder} onPress={handlePickImage}>
            {foto ? (
              <Image source={{ uri: foto.uri }} style={styles.image} />
            ) : (
              <Text style={styles.placeholderText}>[Subir Foto de Perfil]</Text>
            )}
          </TouchableOpacity>

          {loading ? (
            <ActivityIndicator size="large" color={COLORS.primary} style={{ marginTop: SPACING.xl }} />
          ) : (
            <Button 
              title="Completar Registro" 
              onPress={handleRegistro}
              style={{ marginTop: SPACING.xl, marginBottom: SPACING.xl }}
            />
          )}
        </Card>
      </ScrollView>

      {}
      {modalVisible && (
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <View style={[styles.modalHeader, { backgroundColor: modalConfig.type === 'error' ? COLORS.error : COLORS.primary }]}>
              <Text style={styles.modalTitleText}>{modalConfig.title}</Text>
            </View>
            <View style={styles.modalBody}>
              <Text style={styles.modalMessage}>{modalConfig.message}</Text>
              <Button 
                title="Entendido" 
                onPress={() => setModalVisible(false)}
                style={{ marginTop: SPACING.xl }}
              />
            </View>
          </View>
        </View>
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: { 
    flex: 1, 
    backgroundColor: COLORS.background, 
    padding: SPACING.l 
  },
  title: { 
    fontSize: TYPOGRAPHY.sizes.headline, 
    fontWeight: TYPOGRAPHY.weights.bold, 
    color: COLORS.textPrimary, 
    marginBottom: SPACING.xl,
    textAlign: 'center'
  },
  label: { 
    fontSize: TYPOGRAPHY.sizes.body, 
    fontWeight: TYPOGRAPHY.weights.medium, 
    color: COLORS.textPrimary, 
    marginBottom: SPACING.s 
  },
  pickerContainer: { 
    borderWidth: 1, 
    borderColor: COLORS.border, 
    borderRadius: COMPONENTS.input.radius, 
    backgroundColor: COLORS.surface, 
    marginBottom: SPACING.l 
  },
  imagePlaceholder: { 
    height: 120, 
    backgroundColor: COLORS.surface, 
    borderRadius: COMPONENTS.input.radius, 
    borderWidth: 2, 
    borderColor: COLORS.border, 
    borderStyle: 'dashed', 
    justifyContent: 'center', 
    alignItems: 'center', 
    marginTop: SPACING.l, 
    overflow: 'hidden' 
  },
  placeholderText: { 
    color: COLORS.textMuted, 
    fontWeight: TYPOGRAPHY.weights.medium 
  },
  image: { 
    width: '100%', 
    height: '100%' 
  },
  modalOverlay: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: 'rgba(0, 0, 0, 0.6)',
    justifyContent: 'center',
    alignItems: 'center',
    padding: SPACING.xl,
    zIndex: 9999,
    elevation: 9999,
  },
  modalContent: {
    width: '100%',
    backgroundColor: COLORS.surface,
    borderRadius: COMPONENTS.card.radius,
    overflow: 'hidden',
    borderWidth: 1,
    borderColor: COLORS.border,
  },
  modalHeader: {
    padding: SPACING.l,
    alignItems: 'center',
  },
  modalTitleText: {
    color: '#FFF',
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
  },
  modalBody: {
    padding: SPACING.xl,
  },
  modalMessage: {
    color: COLORS.textPrimary,
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    textAlign: 'center',
    lineHeight: 22,
  }
});

export default RegistroJugadorScreen;
