import React from 'react';
import { View, StyleSheet } from 'react-native';
import { COLORS, COMPONENTS, SPACING, SHADOWS } from '../theme/theme';

const Card = ({ children, style, accent = false, secondaryAccent = false, elevated = false, glow = false }) => {
  return (
    <View style={[
      styles.card, 
      accent && styles.accent,
      secondaryAccent && styles.secondaryAccent,
      elevated && styles.elevated,
      glow && styles.glow,
      style
    ]}>
      {children}
    </View>
  );
};

const styles = StyleSheet.create({
  card: {
    backgroundColor: COLORS.surface,
    borderRadius: COMPONENTS.card.radius,
    padding: COMPONENTS.card.padding,
    marginBottom: SPACING.l,
    shadowColor: COMPONENTS.card.shadowColor,
    shadowOffset: COMPONENTS.card.shadowOffset,
    shadowOpacity: COMPONENTS.card.shadowOpacity,
    shadowRadius: COMPONENTS.card.shadowRadius,
    elevation: COMPONENTS.card.elevation,
    borderWidth: COMPONENTS.card.borderWidth,
    borderColor: COMPONENTS.card.borderColor,
  },
  accent: {
    borderLeftWidth: 4,
    borderLeftColor: COLORS.primary,
  },
  secondaryAccent: {
    borderLeftWidth: 4,
    borderLeftColor: COLORS.primaryLight,
  },
  elevated: {
    ...SHADOWS.elevated,
    backgroundColor: COLORS.surfaceLight,
    borderColor: 'rgba(255, 255, 255, 0.12)',
  },
  glow: {
    ...SHADOWS.glow,
    borderColor: 'rgba(140, 32, 61, 0.4)',
  }
});

export default Card;
