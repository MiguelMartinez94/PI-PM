import React from 'react';
import { View, Text, StyleSheet, ImageBackground } from 'react-native';
import { COLORS, TYPOGRAPHY, SPACING, SHADOWS } from '../../theme/theme';

const FORMATIONS = {
  '4-4-2': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%' },
    { id: 'pos_2', pos: 'LI', top: '70%', left: '15%' },
    { id: 'pos_3', pos: 'DFC', top: '70%', left: '35%' },
    { id: 'pos_4', pos: 'DFC', top: '70%', left: '60%' },
    { id: 'pos_5', pos: 'LD', top: '70%', left: '81%' },
    { id: 'pos_6', pos: 'MI', top: '45%', left: '15%' },
    { id: 'pos_7', pos: 'MC', top: '45%', left: '35%' },
    { id: 'pos_8', pos: 'MC', top: '45%', left: '60%' },
    { id: 'pos_9', pos: 'MD', top: '45%', left: '81%' },
    { id: 'pos_10', pos: 'DC', top: '15%', left: '35%' },
    { id: 'pos_11', pos: 'DC', top: '15%', left: '60%' },
  ],
  '4-3-3': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%' },
    { id: 'pos_2', pos: 'LI', top: '70%', left: '15%' },
    { id: 'pos_3', pos: 'DFC', top: '70%', left: '35%' },
    { id: 'pos_4', pos: 'DFC', top: '70%', left: '60%' },
    { id: 'pos_5', pos: 'LD', top: '70%', left: '81%' },
    { id: 'pos_6', pos: 'MC', top: '45%', left: '20%' },
    { id: 'pos_7', pos: 'MCD', top: '55%', left: '48%' },
    { id: 'pos_8', pos: 'MC', top: '45%', left: '75%' },
    { id: 'pos_9', pos: 'EI', top: '20%', left: '20%' },
    { id: 'pos_10', pos: 'DC', top: '15%', left: '48%' },
    { id: 'pos_11', pos: 'ED', top: '20%', left: '75%' },
  ],
  '4-2-3-1': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%' },
    { id: 'pos_2', pos: 'LI', top: '70%', left: '15%' },
    { id: 'pos_3', pos: 'DFC', top: '70%', left: '35%' },
    { id: 'pos_4', pos: 'DFC', top: '70%', left: '60%' },
    { id: 'pos_5', pos: 'LD', top: '70%', left: '81%' },
    { id: 'pos_6', pos: 'MCD', top: '55%', left: '35%' },
    { id: 'pos_7', pos: 'MCD', top: '55%', left: '60%' },
    { id: 'pos_8', pos: 'MI', top: '35%', left: '15%' },
    { id: 'pos_9', pos: 'MCO', top: '35%', left: '48%' },
    { id: 'pos_10', pos: 'MD', top: '35%', left: '81%' },
    { id: 'pos_11', pos: 'DC', top: '15%', left: '48%' },
  ],
  '3-5-2': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%' },
    { id: 'pos_2', pos: 'DFC', top: '70%', left: '20%' },
    { id: 'pos_3', pos: 'DFC', top: '70%', left: '48%' },
    { id: 'pos_4', pos: 'DFC', top: '70%', left: '75%' },
    { id: 'pos_5', pos: 'MI', top: '45%', left: '10%' },
    { id: 'pos_6', pos: 'MC', top: '50%', left: '30%' },
    { id: 'pos_7', pos: 'MCD', top: '55%', left: '48%' },
    { id: 'pos_8', pos: 'MC', top: '50%', left: '65%' },
    { id: 'pos_9', pos: 'MD', top: '45%', left: '85%' },
    { id: 'pos_10', pos: 'DC', top: '20%', left: '35%' },
    { id: 'pos_11', pos: 'DC', top: '20%', left: '60%' },
  ],
  '3-4-3': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%' },
    { id: 'pos_2', pos: 'DFC', top: '70%', left: '20%' },
    { id: 'pos_3', pos: 'DFC', top: '70%', left: '48%' },
    { id: 'pos_4', pos: 'DFC', top: '70%', left: '75%' },
    { id: 'pos_5', pos: 'MI', top: '45%', left: '15%' },
    { id: 'pos_6', pos: 'MC', top: '45%', left: '35%' },
    { id: 'pos_7', pos: 'MC', top: '45%', left: '60%' },
    { id: 'pos_8', pos: 'MD', top: '45%', left: '81%' },
    { id: 'pos_9', pos: 'EI', top: '20%', left: '20%' },
    { id: 'pos_10', pos: 'DC', top: '15%', left: '48%' },
    { id: 'pos_11', pos: 'ED', top: '20%', left: '75%' },
  ],
  '5-3-2': [
    { id: 'pos_1', pos: 'GK', top: '85%', left: '48%' },
    { id: 'pos_2', pos: 'CAI', top: '65%', left: '10%' },
    { id: 'pos_3', pos: 'DFC', top: '75%', left: '30%' },
    { id: 'pos_4', pos: 'DFC', top: '75%', left: '48%' },
    { id: 'pos_5', pos: 'DFC', top: '75%', left: '65%' },
    { id: 'pos_6', pos: 'CAD', top: '65%', left: '85%' },
    { id: 'pos_7', pos: 'MC', top: '45%', left: '25%' },
    { id: 'pos_8', pos: 'MCD', top: '50%', left: '48%' },
    { id: 'pos_9', pos: 'MC', top: '45%', left: '70%' },
    { id: 'pos_10', pos: 'DC', top: '20%', left: '35%' },
    { id: 'pos_11', pos: 'DC', top: '20%', left: '60%' },
  ]
};

const AlineacionJugadorScreen = ({ route }) => {
  const alineacionJugadores = route.params?.alineacion || [];
  const formacion = route.params?.formacion || '4-4-2';

  const formationLayout = FORMATIONS[formacion] || FORMATIONS['4-4-2'];
  
  const nodes = formationLayout.map((node, i) => {
    const jugador = alineacionJugadores[i];
    return {
      ...node,
      jugador: jugador || null
    };
  });

  return (
    <View style={styles.container}>
      <View style={styles.headerInfo}>
        <Text style={styles.title}>Formación {formacion}</Text>
        <Text style={styles.subtitle}>Alineación titular propuesta</Text>
      </View>

      <View style={styles.fieldContainer}>
        <ImageBackground 
          source={require('../../assets/soccer_field.png')} 
          style={styles.fieldImage} 
          resizeMode="cover"
        >
          {nodes.map((nodo) => (
            <View 
              key={nodo.id}
              style={[
                styles.playerNode,
                { top: nodo.top, left: nodo.left }
              ]}
            >
              {nodo.jugador ? (
                <>
                  <View style={styles.avatarCircle}>
                    <Text style={styles.avatarText}>{nodo.jugador.numero}</Text>
                  </View>
                  <View style={styles.nameBadge}>
                    <Text style={styles.playerName} numberOfLines={1}>
                      {nodo.jugador.nombre}
                    </Text>
                  </View>
                </>
              ) : (
                <View style={styles.emptyNode}>
                  <Text style={styles.emptyNodeText}>{nodo.pos}</Text>
                </View>
              )}
            </View>
          ))}
        </ImageBackground>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: COLORS.background,
  },
  headerInfo: {
    padding: SPACING.l,
    alignItems: 'center',
    backgroundColor: COLORS.surface,
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(255, 255, 255, 0.08)',
    ...SHADOWS.soft,
  },
  title: {
    color: COLORS.textPrimary,
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
  },
  subtitle: {
    color: COLORS.textSecondary,
    fontSize: TYPOGRAPHY.sizes.body,
    marginTop: 4,
  },
  fieldContainer: {
    flex: 1,
    padding: 10,
    paddingBottom: 20,
    backgroundColor: COLORS.fieldGreen,
  },
  fieldImage: {
    flex: 1,
    width: '100%',
    position: 'relative',
  },
  playerNode: {
    position: 'absolute',
    alignItems: 'center',
    width: 60,
    marginLeft: -30, 
    marginTop: -30, 
  },
  avatarCircle: {
    width: 34,
    height: 34,
    borderRadius: 17,
    backgroundColor: COLORS.primary,
    borderWidth: 2,
    borderColor: '#FFF',
    justifyContent: 'center',
    alignItems: 'center',
    ...SHADOWS.glow,
  },
  avatarText: {
    color: '#FFF',
    fontWeight: TYPOGRAPHY.weights.bold,
    fontSize: 12,
  },
  nameBadge: {
    backgroundColor: 'rgba(0, 0, 0, 0.75)',
    borderRadius: 4,
    paddingHorizontal: 5,
    paddingVertical: 2,
    marginTop: 4,
    width: '100%',
  },
  playerName: {
    color: '#FFF',
    fontSize: 10,
    fontWeight: '600',
    textAlign: 'center',
  },
  emptyNode: {
    width: 34,
    height: 34,
    borderRadius: 17,
    backgroundColor: 'rgba(255, 255, 255, 0.35)',
    borderWidth: 2,
    borderColor: '#FFF',
    borderStyle: 'dashed',
    justifyContent: 'center',
    alignItems: 'center',
  },
  emptyNodeText: {
    color: '#FFF',
    fontSize: 10,
    fontWeight: TYPOGRAPHY.weights.bold,
  }
});

export default AlineacionJugadorScreen;
