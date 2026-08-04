import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import Card from '../../components/Card';
import Badge from '../../components/Badge';
import Button from '../../components/Button';
import { COLORS, TYPOGRAPHY, SPACING } from '../../theme/theme';

const PartidosPostulacionScreen = ({ navigation }) => {
  return (
    <ScrollView style={styles.container} contentContainerStyle={{ paddingBottom: SPACING.xxxl }}>
      <Text style={styles.title}>Partidos Disponibles</Text>
      <Text style={styles.subtitle}>Torneo Primavera 2026</Text>

      <Card elevated style={{ marginBottom: SPACING.l }}>
        <View style={styles.cardHeader}>
          <Text style={styles.dateText}>Sábado, 15 May - 10:00 AM</Text>
          <Badge title="1 Vacante" type="warning" />
        </View>
        <Text style={styles.matchup}>Deportivo UPQ vs Lobos</Text>
        <Text style={styles.roleText}>Rol Buscado: Árbitro Asistente</Text>
        
        <Button 
          title="Postularse" 
          onPress={() => {}}
          style={{ marginTop: SPACING.m }}
        />
      </Card>

      <Card elevated style={{ marginBottom: SPACING.l }}>
        <View style={styles.cardHeader}>
          <Text style={styles.dateText}>Domingo, 16 May - 08:00 AM</Text>
          <Badge title="2 Vacantes" type="warning" />
        </View>
        <Text style={styles.matchup}>Pumas F7 vs Real Querétaro</Text>
        <Text style={styles.roleText}>Rol Buscado: Árbitro Central y Asistente</Text>
        
        <Button 
          title="Postularse" 
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
  cardHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: SPACING.s,
  },
  dateText: {
    fontSize: TYPOGRAPHY.sizes.body,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.primary,
  },
  matchup: {
    fontSize: TYPOGRAPHY.sizes.title,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.textPrimary,
    marginBottom: SPACING.xs,
  },
  roleText: {
    fontSize: TYPOGRAPHY.sizes.body,
    color: COLORS.textSecondary,
  }
});

export default PartidosPostulacionScreen;
