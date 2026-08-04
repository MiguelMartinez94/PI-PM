import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import Card from '../../components/Card';
import Badge from '../../components/Badge';
import Button from '../../components/Button';
import { COLORS, TYPOGRAPHY, SPACING } from '../../theme/theme';

const TorneosSedeArbitroScreen = ({ navigation }) => {
  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
      <Text style={styles.title}>Torneos en Sede</Text>
      <Text style={styles.subtitle}>Cancha Principal UPQ</Text>

      <Card elevated accent style={{ marginBottom: SPACING.l }}>
        <Text style={styles.tourneyName}>Torneo Primavera 2026</Text>
        <Badge title="Activo" type="success" />
        <View style={styles.infoRow}>
          <Text style={styles.infoLabel}>Partidos esta semana:</Text>
          <Text style={styles.infoValue}>12</Text>
        </View>
        <View style={styles.infoRow}>
          <Text style={styles.infoLabel}>Pago por partido:</Text>
          <Text style={styles.infoValue}>$350.00</Text>
        </View>
        <Button 
          title="Ver Partidos y Postularse" 
          onPress={() => navigation.navigate('PartidosPostulacion')}
          style={{ marginTop: SPACING.m }}
        />
      </Card>
      
      <Card elevated style={{ marginBottom: SPACING.l }}>
        <Text style={styles.tourneyName}>Torneo Verano 2026</Text>
        <Badge title="Próximo" type="warning" />
        <View style={styles.infoRow}>
          <Text style={styles.infoLabel}>Partidos esta semana:</Text>
          <Text style={styles.infoValue}>0</Text>
        </View>
        <View style={styles.infoRow}>
          <Text style={styles.infoLabel}>Pago por partido:</Text>
          <Text style={styles.infoValue}>$400.00</Text>
        </View>
        <Button 
          title="Ver Partidos y Postularse"
          type="secondary" 
          onPress={() => {}}
          style={{ marginTop: SPACING.m }}
        />
      </Card>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: COLORS.background,
    padding: SPACING.l,
  },
  title: {
    fontSize: TYPOGRAPHY.sizes.headline,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.xs,
  },
  subtitle: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
    marginBottom: SPACING.xl,
  },
  tourneyName: {
    fontSize: TYPOGRAPHY.sizes.title,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.s,
  },
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: SPACING.m,
  },
  infoLabel: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
  },
  infoValue: {
    fontSize: TYPOGRAPHY.sizes.body,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
  }
});

export default TorneosSedeArbitroScreen;
