import React, { useState, useEffect } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { StatusBar } from 'expo-status-bar';
import { View, ActivityIndicator } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { GestureHandlerRootView } from 'react-native-gesture-handler';
import { COLORS, SHADOWS } from './theme/theme';

import LoginScreen from './screens/auth/LoginScreen';
import RegistroArbitroScreen from './screens/auth/RegistroArbitroScreen';
import RegistroEntrenadorScreen from './screens/auth/RegistroEntrenadorScreen';
import RegistroJugadorScreen from './screens/auth/RegistroJugadorScreen';

import SedesArbitroScreen from './screens/arbitros/SedesArbitroScreen';
import TorneosSedeArbitroScreen from './screens/arbitros/TorneosSedeArbitroScreen';
import PartidosPostulacionScreen from './screens/arbitros/PartidosPostulacionScreen';
import MisPartidosAsignadosScreen from './screens/arbitros/MisPartidosAsignadosScreen';
import ConfirmarInicioPartidoScreen from './screens/arbitros/ConfirmarInicioPartidoScreen';
import PartidoEnCursoEstadisticasScreen from './screens/arbitros/PartidoEnCursoEstadisticasScreen';
import PartidoEnCursoEventosScreen from './screens/arbitros/PartidoEnCursoEventosScreen';
import ResultadoPartidoScreen from './screens/arbitros/ResultadoPartidoScreen';
import PerfilArbitroScreen from './screens/arbitros/PerfilArbitroScreen';

import SedesDisponiblesScreen from './screens/entrenadores/SedesDisponiblesScreen';
import TorneosPorSedeScreen from './screens/entrenadores/TorneosPorSedeScreen';
import CrearEquipoScreen from './screens/entrenadores/CrearEquipoScreen';
import SolicitudesIngresoScreen from './screens/entrenadores/SolicitudesIngresoScreen';
import DetalleEquipoEntrenadorScreen from './screens/entrenadores/DetalleEquipoEntrenadorScreen';
import ConfigurarAlineacionScreen from './screens/entrenadores/ConfigurarAlineacionScreen';
import AsignacionJugadoresScreen from './screens/entrenadores/AsignacionJugadoresScreen';
import PerfilEntrenadorScreen from './screens/entrenadores/PerfilEntrenadorScreen';

import EquiposDisponiblesScreen from './screens/jugadores/EquiposDisponiblesScreen';
import DetalleEquipoJugadorScreen from './screens/jugadores/DetalleEquipoJugadorScreen';
import AgendaPartidosScreen from './screens/jugadores/AgendaPartidosScreen';
import PagoArbitrajeScreen from './screens/jugadores/PagoArbitrajeScreen';
import PerfilJugadorScreen from './screens/jugadores/PerfilJugadorScreen';
import UnirseDetalleEquipoScreen from './screens/jugadores/UnirseDetalleEquipoScreen';
import AlineacionJugadorScreen from './screens/jugadores/AlineacionJugadorScreen';

import AppHeaderTitle from './components/AppHeaderTitle';

const Stack = createNativeStackNavigator();
const Tab = createBottomTabNavigator();

const commonTabOptions = {
  headerStyle: { backgroundColor: COLORS.background },
  headerTintColor: COLORS.textPrimary,
  headerTitle: (props) => <AppHeaderTitle {...props} />,
  headerTitleAlign: 'left',
  tabBarActiveTintColor: COLORS.primary,
  tabBarInactiveTintColor: COLORS.textMuted,
  tabBarStyle: {
    backgroundColor: COLORS.surface,
    borderTopColor: 'rgba(255, 255, 255, 0.08)',
    borderTopWidth: 1,
    height: 60,
    paddingBottom: 8,
    paddingTop: 8,
    ...SHADOWS.medium
  }
};

const ArbitroTabs = () => (
  <Tab.Navigator screenOptions={commonTabOptions}>
    <Tab.Screen name="Inicio" component={MisPartidosAsignadosScreen} />
    <Tab.Screen name="Sedes" component={SedesArbitroScreen} />
    <Tab.Screen name="Perfil" component={PerfilArbitroScreen} />
  </Tab.Navigator>
);

const EntrenadorTabs = () => (
  <Tab.Navigator screenOptions={commonTabOptions}>
    <Tab.Screen name="Mi Equipo" component={DetalleEquipoEntrenadorScreen} />
    <Tab.Screen name="Sedes" component={SedesDisponiblesScreen} />
    <Tab.Screen name="Crear Equipo" component={CrearEquipoScreen} />
    <Tab.Screen name="Perfil" component={PerfilEntrenadorScreen} />
  </Tab.Navigator>
);

const JugadorTabs = () => (
  <Tab.Navigator screenOptions={commonTabOptions}>
    <Tab.Screen name="Inicio" component={AgendaPartidosScreen} />
    <Tab.Screen name="Mi Equipo" component={DetalleEquipoJugadorScreen} />
    <Tab.Screen name="Unirse" component={EquiposDisponiblesScreen} />
    <Tab.Screen name="Perfil" component={PerfilJugadorScreen} />
  </Tab.Navigator>
);

export default function App() {
  const [initialRoute, setInitialRoute] = useState('Login');
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const checkLogin = async () => {
      try {
        const token = await AsyncStorage.getItem('userToken');
        const role = await AsyncStorage.getItem('userRole');
        
        if (token && role) {
          if (role === 'jugador') setInitialRoute('JugadorApp');
          else if (role === 'entrenador') setInitialRoute('EntrenadorApp');
          else if (role === 'arbitro' || role === 'árbitro') setInitialRoute('ArbitroApp');
        }
      } catch (e) {
        
      } finally {
        setIsLoading(false);
      }
    };
    checkLogin();
  }, []);

  if (isLoading) {
    return (
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: COLORS.background }}>
        <ActivityIndicator size="large" color={COLORS.primary} />
      </View>
    );
  }

  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <NavigationContainer>
        <StatusBar style="light" backgroundColor={COLORS.background} />
        <Stack.Navigator
          initialRouteName={initialRoute}
          screenOptions={{
            headerStyle: { backgroundColor: COLORS.background },
            headerTintColor: COLORS.textPrimary,
            headerTitle: (props) => <AppHeaderTitle {...props} />,
            headerTitleAlign: 'left',
            animation: 'slide_from_right',
            animationDuration: 220,
          }}
        >
          {}
          <Stack.Screen name="Login" component={LoginScreen} options={{ headerShown: false }} />
          <Stack.Screen name="RegistroArbitro" component={RegistroArbitroScreen} options={{ title: 'Registro de Árbitro' }} />
          <Stack.Screen name="RegistroEntrenador" component={RegistroEntrenadorScreen} options={{ title: 'Registro de Entrenador' }} />
          <Stack.Screen name="RegistroJugador" component={RegistroJugadorScreen} options={{ title: 'Registro de Jugador' }} />
          
          {}
          <Stack.Screen name="ArbitroApp" component={ArbitroTabs} options={{ headerShown: false }} />
          <Stack.Screen name="EntrenadorApp" component={EntrenadorTabs} options={{ headerShown: false }} />
          <Stack.Screen name="JugadorApp" component={JugadorTabs} options={{ headerShown: false }} />

          {}
          <Stack.Screen name="TorneosSedeArbitro" component={TorneosSedeArbitroScreen} options={{ title: 'Torneos' }} />
          <Stack.Screen name="PartidosPostulacion" component={PartidosPostulacionScreen} options={{ title: 'Postulación' }} />
          <Stack.Screen name="ConfirmarInicio" component={ConfirmarInicioPartidoScreen} options={{ title: 'Confirmar Partido' }} />
          <Stack.Screen name="PartidoEnCurso" component={PartidoEnCursoEstadisticasScreen} options={{ title: 'Partido' }} />
          <Stack.Screen name="PartidoEnCursoEventos" component={PartidoEnCursoEventosScreen} options={{ title: 'Eventos' }} />
          <Stack.Screen name="ResultadoPartido" component={ResultadoPartidoScreen} options={{ title: 'Acta' }} />
          
          {}
          <Stack.Screen name="TorneosPorSede" component={TorneosPorSedeScreen} options={{ title: 'Torneos' }} />
          <Stack.Screen name="SolicitudesIngreso" component={SolicitudesIngresoScreen} options={{ title: 'Solicitudes' }} />
          <Stack.Screen name="ConfigurarAlineacion" component={ConfigurarAlineacionScreen} options={{ headerShown: false }} />
          <Stack.Screen name="AsignacionJugadores" component={AsignacionJugadoresScreen} options={{ title: 'Jugadores' }} />
          
          {}
          <Stack.Screen name="PagoArbitraje" component={PagoArbitrajeScreen} options={{ title: 'Pago' }} />
          <Stack.Screen name="UnirseDetalleEquipo" component={UnirseDetalleEquipoScreen} options={{ title: 'Detalles del Equipo' }} />
          <Stack.Screen name="AlineacionJugador" component={AlineacionJugadorScreen} options={{ title: 'Alineación' }} />

        </Stack.Navigator>
      </NavigationContainer>
    </GestureHandlerRootView>
  );
}
