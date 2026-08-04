import React from 'react';
import { TouchableOpacity, Text, StyleSheet } from 'react-native';
import { COLORS, TYPOGRAPHY, COMPONENTS } from '../theme/theme';

const Button = ({ title, onPress, type = 'primary', disabled = false, style }) => {
  return (
    <TouchableOpacity 
      style={[
        styles.button, 
        styles[type], 
        disabled && styles.disabled,
        style
      ]} 
      onPress={onPress}
      disabled={disabled}
    >
      <Text style={[
        styles.text, 
        type === 'secondary' && styles.textSecondary,
        disabled && styles.textDisabled
      ]}>
        {title}
      </Text>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  button: {
    height: COMPONENTS.button.height,
    paddingHorizontal: COMPONENTS.button.paddingHorizontal,
    borderRadius: COMPONENTS.button.radius,
    alignItems: 'center',
    justifyContent: 'center',
  },
  primary: {
    backgroundColor: COLORS.primary,
  },
  secondary: {
    backgroundColor: 'transparent',
    borderWidth: 1.5,
    borderColor: COLORS.primary,
  },
  disabled: {
    backgroundColor: COLORS.textMuted,
    borderColor: COLORS.textMuted,
  },
  text: {
    color: COLORS.textPrimary,
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    fontWeight: TYPOGRAPHY.weights.semibold,
  },
  textSecondary: {
    color: COLORS.primary,
  },
  textDisabled: {
    color: 'rgba(255, 255, 255, 0.7)',
  }
});

export default Button;
