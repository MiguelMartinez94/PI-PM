import React, { useState, useRef, useMemo, useEffect } from 'react';
import { View, Text, StyleSheet, Image, ImageBackground, TouchableOpacity, Alert, ActivityIndicator } from 'react-native';
import Icon from 'react-native-vector-icons/Feather';
import BottomSheet, { BottomSheetFlatList } from '@gorhom/bottom-sheet';
import { Picker } from '@react-native-picker/picker';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { API } from '../../config/api';
import { COLORS, TYPOGRAPHY, SPACING, COMPONENTS, RADIUS, SHADOWS } from '../../theme/theme';

const FORMATIONS = {
  '4-4-2': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%', jugadorId: null },
    { id: 'pos_2', pos: 'LI', top: '70%', left: '15%', jugadorId: null },
    { id: 'pos_3', pos: 'DFC', top: '70%', left: '35%', jugadorId: null },
    { id: 'pos_4', pos: 'DFC', top: '70%', left: '60%', jugadorId: null },
    { id: 'pos_5', pos: 'LD', top: '70%', left: '81%', jugadorId: null },
    { id: 'pos_6', pos: 'MI', top: '45%', left: '15%', jugadorId: null },
    { id: 'pos_7', pos: 'MC', top: '45%', left: '35%', jugadorId: null },
    { id: 'pos_8', pos: 'MC', top: '45%', left: '60%', jugadorId: null },
    { id: 'pos_9', pos: 'MD', top: '45%', left: '81%', jugadorId: null },
    { id: 'pos_10', pos: 'DC', top: '15%', left: '35%', jugadorId: null },
    { id: 'pos_11', pos: 'DC', top: '15%', left: '60%', jugadorId: null },
  ],
  '4-3-3': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%', jugadorId: null },
    { id: 'pos_2', pos: 'LI', top: '70%', left: '15%', jugadorId: null },
    { id: 'pos_3', pos: 'DFC', top: '70%', left: '35%', jugadorId: null },
    { id: 'pos_4', pos: 'DFC', top: '70%', left: '60%', jugadorId: null },
    { id: 'pos_5', pos: 'LD', top: '70%', left: '81%', jugadorId: null },
    { id: 'pos_6', pos: 'MC', top: '45%', left: '20%', jugadorId: null },
    { id: 'pos_7', pos: 'MCD', top: '55%', left: '48%', jugadorId: null },
    { id: 'pos_8', pos: 'MC', top: '45%', left: '75%', jugadorId: null },
    { id: 'pos_9', pos: 'EI', top: '20%', left: '20%', jugadorId: null },
    { id: 'pos_10', pos: 'DC', top: '15%', left: '48%', jugadorId: null },
    { id: 'pos_11', pos: 'ED', top: '20%', left: '75%', jugadorId: null },
  ],
  '4-2-3-1': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%', jugadorId: null },
    { id: 'pos_2', pos: 'LI', top: '70%', left: '15%', jugadorId: null },
    { id: 'pos_3', pos: 'DFC', top: '70%', left: '35%', jugadorId: null },
    { id: 'pos_4', pos: 'DFC', top: '70%', left: '60%', jugadorId: null },
    { id: 'pos_5', pos: 'LD', top: '70%', left: '81%', jugadorId: null },
    { id: 'pos_6', pos: 'MCD', top: '55%', left: '35%', jugadorId: null },
    { id: 'pos_7', pos: 'MCD', top: '55%', left: '60%', jugadorId: null },
    { id: 'pos_8', pos: 'MI', top: '35%', left: '15%', jugadorId: null },
    { id: 'pos_9', pos: 'MCO', top: '35%', left: '48%', jugadorId: null },
    { id: 'pos_10', pos: 'MD', top: '35%', left: '81%', jugadorId: null },
    { id: 'pos_11', pos: 'DC', top: '15%', left: '48%', jugadorId: null },
  ],
  '3-5-2': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%', jugadorId: null },
    { id: 'pos_2', pos: 'DFC', top: '70%', left: '20%', jugadorId: null },
    { id: 'pos_3', pos: 'DFC', top: '70%', left: '48%', jugadorId: null },
    { id: 'pos_4', pos: 'DFC', top: '70%', left: '75%', jugadorId: null },
    { id: 'pos_5', pos: 'MI', top: '45%', left: '10%', jugadorId: null },
    { id: 'pos_6', pos: 'MC', top: '50%', left: '30%', jugadorId: null },
    { id: 'pos_7', pos: 'MCD', top: '55%', left: '48%', jugadorId: null },
    { id: 'pos_8', pos: 'MC', top: '50%', left: '65%', jugadorId: null },
    { id: 'pos_9', pos: 'MD', top: '45%', left: '85%', jugadorId: null },
    { id: 'pos_10', pos: 'DC', top: '20%', left: '35%', jugadorId: null },
    { id: 'pos_11', pos: 'DC', top: '20%', left: '60%', jugadorId: null },
  ],
  '3-4-3': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%', jugadorId: null },
    { id: 'pos_2', pos: 'DFC', top: '70%', left: '20%', jugadorId: null },
    { id: 'pos_3', pos: 'DFC', top: '70%', left: '48%', jugadorId: null },
    { id: 'pos_4', pos: 'DFC', top: '70%', left: '75%', jugadorId: null },
    { id: 'pos_5', pos: 'MI', top: '45%', left: '15%', jugadorId: null },
    { id: 'pos_6', pos: 'MC', top: '45%', left: '35%', jugadorId: null },
    { id: 'pos_7', pos: 'MC', top: '45%', left: '60%', jugadorId: null },
    { id: 'pos_8', pos: 'MD', top: '45%', left: '81%', jugadorId: null },
    { id: 'pos_9', pos: 'EI', top: '20%', left: '20%', jugadorId: null },
    { id: 'pos_10', pos: 'DC', top: '15%', left: '48%', jugadorId: null },
    { id: 'pos_11', pos: 'ED', top: '20%', left: '75%', jugadorId: null },
  ],
  '5-3-2': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%', jugadorId: null },
    { id: 'pos_2', pos: 'CAI', top: '65%', left: '10%', jugadorId: null },
    { id: 'pos_3', pos: 'DFC', top: '75%', left: '30%', jugadorId: null },
    { id: 'pos_4', pos: 'DFC', top: '75%', left: '48%', jugadorId: null },
    { id: 'pos_5', pos: 'DFC', top: '75%', left: '65%', jugadorId: null },
    { id: 'pos_6', pos: 'CAD', top: '65%', left: '85%', jugadorId: null },
    { id: 'pos_7', pos: 'MC', top: '45%', left: '25%', jugadorId: null },
    { id: 'pos_8', pos: 'MCD', top: '50%', left: '48%', jugadorId: null },
    { id: 'pos_9', pos: 'MC', top: '45%', left: '70%', jugadorId: null },
    { id: 'pos_10', pos: 'DC', top: '20%', left: '35%', jugadorId: null },
    { id: 'pos_11', pos: 'DC', top: '20%', left: '60%', jugadorId: null },
  ]
};

const ConfigurarAlineacionScreen = ({ route, navigation }) => {
  const equipoId = route.params?.equipoId;
  const [loading, setLoading] = useState(true);
  const [jugadoresReales, setJugadoresReales] = useState([]);
  const [selectedFormationKey, setSelectedFormationKey] = useState('4-4-2');
  const [alineacion, setAlineacion] = useState(JSON.parse(JSON.stringify(FORMATIONS['4-4-2'])));
  const [nodoSeleccionado, setNodoSeleccionado] = useState(null);
  const [modalVisible, setModalVisible] = useState(false);
  const [modalMessage, setModalMessage] = useState({ title: '', body: '' });
  const bottomSheetRef = useRef(null);

  const snapPoints = useMemo(() => ['50%', '75%'], []);

  useEffect(() => {
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
        
        if (response.ok && Array.isArray(data)) {
          const formatJugadores = data.map((j, i) => ({
            id: j.id,
            numero: j.dorsal || (i + 1),
            nombre: j.nombre,
            posiciones: [j.posicion || 'Sin Pos'],
            foto_url: j.foto_url
          }));
          setJugadoresReales(formatJugadores);
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

    fetchJugadores();
  }, [equipoId]);

  const handleFormationChange = (formationKey) => {
    setSelectedFormationKey(formationKey);
    setAlineacion(JSON.parse(JSON.stringify(FORMATIONS[formationKey])));
  };

  const handleNodePress = (nodo) => {
    setNodoSeleccionado(nodo);
    bottomSheetRef.current?.expand();
  };

  const handleCloseSheet = () => {
    bottomSheetRef.current?.close();
    setNodoSeleccionado(null);
  };

  const handleSelectJugador = (jugadorId) => {
    if (!nodoSeleccionado) return;
    
    const isAssigned = alineacion.some(n => n.jugadorId === jugadorId && n.id !== nodoSeleccionado.id);
    if (isAssigned) return;

    setAlineacion(prev => 
      prev.map(n => n.id === nodoSeleccionado.id ? { ...n, jugadorId } : n)
    );
    handleCloseSheet();
  };

  const asignadosCount = alineacion.filter(n => n.jugadorId !== null).length;

  const handleGuardar = async () => {
    const jugadoresAsignados = alineacion
      .filter(n => n.jugadorId !== null)
      .map(n => {
        const jugador = jugadoresReales.find(j => j.id === n.jugadorId);
        return {
          jugador_id: n.jugadorId,
          posicion: n.pos,
          es_titular: true,
          numero_dorsal: jugador ? jugador.numero : 0
        };
      });

    if (jugadoresAsignados.length === 0) {
      setModalMessage({ title: 'Aviso', body: 'No has asignado a ningún jugador.' });
      setModalVisible(true);
      return;
    }

    setLoading(true);
    try {
      const token = await AsyncStorage.getItem('userToken');
      const response = await fetch(API.entrenadorAlineacion(equipoId), {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          formacion: selectedFormationKey,
          jugadores: jugadoresAsignados
        })
      });

      const data = await response.json();
      if (response.ok) {
        setModalMessage({ title: 'Éxito', body: data.message || 'Alineación guardada exitosamente.' });
        setModalVisible(true);
      } else {
        setModalMessage({ title: 'Error', body: data.detail || 'Error al guardar la alineación' });
        setModalVisible(true);
      }
    } catch (error) {
      console.error(error);
      setModalMessage({ title: 'Error', body: 'No se pudo conectar al servidor' });
      setModalVisible(true);
    } finally {
      setLoading(false);
    }
  };

  const renderJugadorItem = ({ item }) => {
    const asignado = alineacion.some(n => n.jugadorId === item.id);

    return (
      <TouchableOpacity 
        style={[styles.bsItem, asignado && styles.bsItemAssigned]} 
        onPress={() => handleSelectJugador(item.id)}
        disabled={asignado}
      >
        <View style={styles.bsAvatar}>
          <Text style={styles.bsAvatarText}>{item.numero}</Text>
        </View>
        <View style={styles.bsInfo}>
          <Text style={[styles.bsName, asignado && { color: COLORS.textMuted }]}>{item.nombre}</Text>
          <View style={styles.bsPosBadge}>
            <Text style={styles.bsPosText}>{item.posiciones.join(' / ')}</Text>
          </View>
        </View>
        {asignado ? (
          <Icon name="check-circle" size={24} color={COLORS.success} />
        ) : (
          <Icon name="plus-circle" size={24} color={COLORS.primary} />
        )}
      </TouchableOpacity>
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
    <View style={styles.container}>
      {}
      <View style={styles.header}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Icon name="arrow-left" size={24} color={COLORS.textPrimary} />
        </TouchableOpacity>
        <Image source={require('../../assets/Logo.jpeg')} style={{ width: 26, height: 26, borderRadius: 13, marginRight: 6 }} />
        <Text style={{ color: COLORS.primary, fontWeight: 'bold', fontSize: 16, marginRight: 8 }}>Balompié</Text>
        <View style={styles.headerTitleContainer}>
          <Picker
            selectedValue={selectedFormationKey}
            style={styles.picker}
            dropdownIconColor={COLORS.textPrimary}
            onValueChange={(itemValue) => handleFormationChange(itemValue)}
          >
            {Object.keys(FORMATIONS).map(key => (
              <Picker.Item label={key} value={key} key={key} />
            ))}
          </Picker>
          <Text style={styles.headerSubtitle}>{asignadosCount}/11 Asignados</Text>
        </View>
        <View style={{ width: 24 }} />
      </View>

      {}
      <View style={styles.fieldContainer}>
        <ImageBackground 
          source={require('../../assets/soccer_field.png')} 
          style={styles.fieldImage}
          resizeMode="cover"
        >
          {alineacion.map((nodo) => {
            const jugador = nodo.jugadorId ? jugadoresReales.find(j => j.id === nodo.jugadorId) : null;
            const isSelected = nodoSeleccionado?.id === nodo.id;

            if (jugador) {
              return (
                <TouchableOpacity 
                  key={nodo.id} 
                  style={[styles.nodeFilledWrapper, { top: nodo.top, left: nodo.left, marginLeft: -25, marginTop: -25 }]}
                  onPress={() => handleNodePress(nodo)}
                >
                  <View style={[styles.nodeFilled, isSelected && styles.nodeSelected]}>
                    <Text style={styles.nodeFilledNumber}>{jugador.numero}</Text>
                  </View>
                  <View style={styles.nodeLabelWrapper}>
                    <Text style={styles.nodeLabel}>{jugador.nombre}</Text>
                  </View>
                  <View style={styles.nodeCheck}>
                    <Icon name="check-circle" size={14} color={COLORS.success} style={{backgroundColor: '#FFF', borderRadius: 7, overflow: 'hidden'}} />
                  </View>
                </TouchableOpacity>
              );
            } else {
              return (
                <TouchableOpacity 
                  key={nodo.id} 
                  style={[styles.nodeEmpty, isSelected && styles.nodeEmptySelected, { top: nodo.top, left: nodo.left, marginLeft: -25, marginTop: -25 }]}
                  onPress={() => handleNodePress(nodo)}
                >
                  <Text style={styles.nodeEmptyText}>{nodo.pos}</Text>
                  <Text style={styles.nodeEmptyPlus}>+</Text>
                </TouchableOpacity>
              );
            }
          })}
        </ImageBackground>
      </View>

      {}
      <View style={styles.footer}>
        <TouchableOpacity style={styles.saveBtn} onPress={handleGuardar}>
          <Icon name="save" size={20} color={COLORS.textPrimary} style={{ marginRight: 8 }} />
          <Text style={styles.saveBtnText}>GUARDAR ALINEACIÓN</Text>
        </TouchableOpacity>
      </View>

      {}
      <BottomSheet
        ref={bottomSheetRef}
        index={-1}
        snapPoints={snapPoints}
        enablePanDownToClose={true}
        backgroundStyle={styles.bsBackground}
        handleIndicatorStyle={styles.bsIndicator}
      >
        <View style={styles.bsHeader}>
          <Text style={styles.bsTitle}>SELECCIONAR {nodoSeleccionado?.pos}</Text>
          <TouchableOpacity onPress={handleCloseSheet}>
            <Icon name="x" size={24} color={COLORS.textMuted} />
          </TouchableOpacity>
        </View>
        <BottomSheetFlatList
          data={jugadoresReales}
          keyExtractor={i => i.id.toString()}
          renderItem={renderJugadorItem}
          contentContainerStyle={{ padding: SPACING.l }}
          ListEmptyComponent={() => (
            <Text style={{ textAlign: 'center', color: COLORS.textMuted, marginTop: 20 }}>
              No tienes jugadores registrados en tu equipo.
            </Text>
          )}
        />
      </BottomSheet>

      {}
      {modalVisible && (
        <View style={styles.modalOverlay}>
          <View style={styles.modalContent}>
            <View style={[styles.modalHeader, modalMessage.title === 'Error' || modalMessage.title === 'Aviso' ? styles.modalHeaderError : styles.modalHeaderSuccess]}>
              <Icon 
                name={modalMessage.title === 'Error' || modalMessage.title === 'Aviso' ? "alert-circle" : "check-circle"} 
                size={40} 
                color={COLORS.textPrimary} 
              />
            </View>
            <Text style={styles.modalTitleText}>{modalMessage.title}</Text>
            <Text style={styles.modalMessageText}>{modalMessage.body}</Text>
            <TouchableOpacity 
              style={styles.modalBtn} 
              onPress={() => setModalVisible(false)}
            >
              <Text style={styles.modalBtnText}>Aceptar</Text>
            </TouchableOpacity>
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
  modalOverlay: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: 'rgba(0,0,0,0.65)',
    justifyContent: 'center',
    alignItems: 'center',
    zIndex: 9999,
    elevation: 9999,
  },
  modalContent: {
    width: '80%',
    maxWidth: 380,
    backgroundColor: COLORS.surface,
    borderRadius: RADIUS.card,
    overflow: 'hidden',
    alignItems: 'center',
    paddingBottom: SPACING.xl,
    borderWidth: 1,
    borderColor: 'rgba(255, 255, 255, 0.1)',
  },
  modalHeader: {
    width: '100%',
    paddingVertical: SPACING.xl,
    alignItems: 'center',
    justifyContent: 'center'
  },
  modalHeaderSuccess: {
    backgroundColor: COLORS.success
  },
  modalHeaderError: {
    backgroundColor: COLORS.error
  },
  modalTitleText: {
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginTop: SPACING.xl,
    marginBottom: SPACING.xs
  },
  modalMessageText: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
    textAlign: 'center',
    paddingHorizontal: 20,
    marginBottom: SPACING.xxl
  },
  modalBtn: {
    backgroundColor: COLORS.primary,
    paddingVertical: SPACING.m,
    paddingHorizontal: 32,
    borderRadius: COMPONENTS.button.radius
  },
  modalBtnText: {
    color: COLORS.textPrimary,
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    fontWeight: TYPOGRAPHY.weights.bold
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingTop: 50,
    paddingBottom: SPACING.l,
    paddingHorizontal: SPACING.l,
    backgroundColor: COLORS.background,
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.08)',
  },
  backBtn: {
    padding: 4,
  },
  headerTitleContainer: {
    flex: 1,
    alignItems: 'center',
  },
  picker: {
    width: 150,
    color: COLORS.textPrimary,
    backgroundColor: 'transparent',
    height: 40,
  },
  headerSubtitle: {
    color: COLORS.textSecondary,
    fontSize: TYPOGRAPHY.sizes.body,
  },
  fieldContainer: {
    flex: 1,
    backgroundColor: COLORS.fieldGreen, 
  },
  fieldImage: {
    width: '100%',
    height: '100%',
  },
  footer: {
    padding: SPACING.l,
    backgroundColor: COLORS.surface,
    borderTopWidth: 1,
    borderTopColor: 'rgba(255, 255, 255, 0.08)',
    ...SHADOWS.medium,
  },
  saveBtn: {
    backgroundColor: COLORS.primary,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    paddingVertical: SPACING.m,
    borderRadius: COMPONENTS.button.radius,
    ...SHADOWS.glow,
  },
  saveBtnText: {
    color: COLORS.textPrimary,
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    fontWeight: TYPOGRAPHY.weights.bold,
  },
  nodeEmpty: {
    position: 'absolute',
    width: 50,
    height: 50,
    borderRadius: 25,
    borderWidth: 2,
    borderColor: '#FFF',
    borderStyle: 'dashed',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'rgba(255,255,255,0.1)',
  },
  nodeEmptySelected: {
    borderColor: '#FFF',
    borderStyle: 'solid',
    backgroundColor: 'rgba(255,255,255,0.3)',
  },
  nodeEmptyText: {
    color: '#FFF',
    fontSize: 12,
    fontWeight: TYPOGRAPHY.weights.bold,
  },
  nodeEmptyPlus: {
    color: '#FFF',
    fontSize: 16,
    fontWeight: TYPOGRAPHY.weights.bold,
    marginTop: -4,
  },
  nodeFilledWrapper: {
    position: 'absolute',
    alignItems: 'center',
    width: 50,
  },
  nodeFilled: {
    width: 50,
    height: 50,
    borderRadius: 25,
    backgroundColor: '#FFF',
    borderWidth: 3,
    borderColor: COLORS.primary,
    justifyContent: 'center',
    alignItems: 'center',
    ...SHADOWS.glow,
  },
  nodeSelected: {
    borderColor: COLORS.success,
  },
  nodeFilledNumber: {
    color: COLORS.background,
    fontSize: 18,
    fontWeight: TYPOGRAPHY.weights.bold,
  },
  nodeLabelWrapper: {
    backgroundColor: '#FFF',
    paddingHorizontal: 4,
    paddingVertical: 2,
    borderRadius: 4,
    marginTop: 4,
  },
  nodeLabel: {
    color: COLORS.background,
    fontSize: 10,
    fontWeight: TYPOGRAPHY.weights.bold,
    textAlign: 'center',
  },
  nodeCheck: {
    position: 'absolute',
    bottom: 20,
    right: -4,
  },
  bsBackground: {
    backgroundColor: COLORS.surface,
  },
  bsIndicator: {
    backgroundColor: COLORS.border,
    width: 40,
  },
  bsHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: SPACING.l,
    paddingBottom: SPACING.l,
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.08)',
  },
  bsTitle: {
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
  },
  bsItem: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: SPACING.m,
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.08)',
  },
  bsItemAssigned: {
    opacity: 0.6,
  },
  bsAvatar: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: COLORS.background,
    justifyContent: 'center',
    alignItems: 'center',
  },
  bsAvatarText: {
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
  },
  bsInfo: {
    flex: 1,
    marginLeft: SPACING.m,
  },
  bsName: {
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
  },
  bsPosBadge: {
    backgroundColor: COLORS.background,
    paddingHorizontal: 6,
    paddingVertical: 2,
    borderRadius: 4,
    alignSelf: 'flex-start',
    marginTop: 4,
  },
  bsPosText: {
    fontSize: 10,
    color: COLORS.primary,
    fontWeight: TYPOGRAPHY.weights.bold,
  }
});

export default ConfigurarAlineacionScreen;
