import React, { useState } from 'react';
import { View, Text, StyleSheet, KeyboardAvoidingView, Platform, ScrollView, ActivityIndicator, Modal, Image } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import Input from '../../components/Input';
import Button from '../../components/Button';
import Card from '../../components/Card';
import { API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS } from '../../theme/theme';

const LoginScreen = ({ navigation }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  
  
  const [modalVisible, setModalVisible] = useState(false);
  const [modalConfig, setModalConfig] = useState({ title: '', message: '', type: 'error' });

  const showModal = (title, message, type = 'error') => {
    setModalConfig({ title, message, type });
    setModalVisible(true);
  };

  const handleLogin = async () => {
    console.log('Login attempt', { email, password });
    if (!email || !password) {
      console.log('Showing modal for empty fields');
      showModal('Campos Incompletos', 'Por favor ingresa tu correo y contraseña para poder continuar.', 'error');
      return;
    }

    setLoading(true);
    try {
      const formData = new URLSearchParams();
      formData.append('username', email);
      formData.append('password', password);

      const response = await fetch(API.login, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: formData.toString()
      });

      const data = await response.json();

      if (response.ok) {
        await AsyncStorage.setItem('userToken', data.access_token);
        
        const rol = data.rol_nombre ? data.rol_nombre.toLowerCase() : '';
        await AsyncStorage.setItem('userRole', rol);

        if (rol === 'jugador') {
          navigation.navigate('JugadorApp');
        } else if (rol === 'entrenador') {
          navigation.navigate('EntrenadorApp');
        } else if (rol === 'arbitro' || rol === 'árbitro') {
          navigation.navigate('ArbitroApp');
        } else if (rol === 'admin') {
          showModal('Acceso Restringido', 'Los administradores deben iniciar sesión en la plataforma Web.', 'info');
        } else {
          showModal('Error de Sistema', 'El rol de usuario no fue reconocido.', 'error');
        }
      } else {
        showModal('Error de Autenticación', data.detail || 'Las credenciales ingresadas son incorrectas.', 'error');
      }
    } catch (error) {
      showModal('Error de Conexión', 'No se pudo conectar al servidor. Verifica que los servicios estén activos.', 'error');
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <View style={{ flex: 1, backgroundColor: COLORS.background }}>
      <KeyboardAvoidingView 
        style={styles.container}
        behavior={Platform.OS === "ios" ? "padding" : "height"}
      >
        <ScrollView 
          contentContainerStyle={styles.scroll}
          keyboardShouldPersistTaps="handled"
        >
          <Image source={require('../../assets/Logo.jpeg')} style={styles.logo} resizeMode="contain" />
          <Text style={styles.title}>Balompié</Text>
          <Text style={styles.subtitle}>Sistema Integral de Fútbol</Text>

          <Card style={styles.card}>
            <Text style={styles.cardTitle}>Iniciar Sesión</Text>
            <Input 
              label="Correo Electrónico" 
              placeholder="ejemplo@correo.com" 
              value={email}
              onChangeText={setEmail}
              autoCapitalize="none"
              keyboardType="email-address"
            />
            <Input 
              label="Contraseña" 
              placeholder="••••••••" 
              secureTextEntry 
              value={password}
              onChangeText={setPassword}
            />
            
            {loading ? (
              <ActivityIndicator size="large" color={COLORS.primary} style={{ marginVertical: SPACING.l }} />
            ) : (
              <Button 
                title="Entrar" 
                onPress={handleLogin} 
                style={{ marginVertical: SPACING.l }}
              />
            )}
            
            <View style={styles.divider} />
            <Text style={styles.registerText}>¿No tienes cuenta? Regístrate como:</Text>
            
            <Button 
              title="Árbitro" 
              type="secondary" 
              onPress={() => navigation.navigate('RegistroArbitro')}
              style={styles.registerBtn}
            />
            <Button 
              title="Entrenador" 
              type="secondary" 
              onPress={() => navigation.navigate('RegistroEntrenador')}
              style={styles.registerBtn}
            />
            <Button 
              title="Jugador" 
              type="secondary" 
              onPress={() => navigation.navigate('RegistroJugador')}
              style={styles.registerBtn}
            />
          </Card>
        </ScrollView>
      </KeyboardAvoidingView>

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
  },
  scroll: {
    flexGrow: 1,
    justifyContent: 'center',
    padding: SPACING.xxl,
  },
  logo: {
    width: 90,
    height: 90,
    alignSelf: 'center',
    marginBottom: SPACING.m,
    borderRadius: 45,
  },
  title: {
    fontSize: 42,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    textAlign: 'center',
    marginBottom: SPACING.s,
  },
  subtitle: {
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    color: COLORS.textPrimary,
    textAlign: 'center',
    marginBottom: SPACING.xxxl,
    opacity: 0.8,
  },
  card: {
    padding: SPACING.xxl,
  },
  cardTitle: {
    fontSize: TYPOGRAPHY.sizes.title,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.primary,
    marginBottom: SPACING.xxl,
    textAlign: 'center',
  },
  divider: {
    height: 1,
    backgroundColor: COLORS.border,
    marginVertical: SPACING.l,
  },
  registerText: {
    textAlign: 'center',
    color: COLORS.textSecondary,
    marginBottom: SPACING.l,
    fontSize: TYPOGRAPHY.sizes.body,
  },
  registerBtn: {
    marginBottom: SPACING.m,
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

export default LoginScreen;
