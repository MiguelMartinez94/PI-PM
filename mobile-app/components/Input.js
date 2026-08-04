import React, { useState } from 'react';
import { View, TextInput, Text, StyleSheet } from 'react-native';
import { COLORS, TYPOGRAPHY, COMPONENTS, SPACING } from '../theme/theme';

const Input = ({ label, placeholder, secureTextEntry, value, onChangeText, error, keyboardType, autoCapitalize }) => {
  const [isFocused, setIsFocused] = useState(false);

  return (
    <View style={styles.container}>
      {label && <Text style={styles.label}>{label}</Text>}
      <TextInput
        style={[
          styles.input,
          isFocused && styles.inputFocused,
          error && styles.inputError
        ]}
        placeholder={placeholder}
        placeholderTextColor={COLORS.textMuted}
        secureTextEntry={secureTextEntry}
        value={value}
        onChangeText={onChangeText}
        onFocus={() => setIsFocused(true)}
        onBlur={() => setIsFocused(false)}
        keyboardType={keyboardType}
        autoCapitalize={autoCapitalize}
      />
      {error && <Text style={styles.errorText}>{error}</Text>}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    marginBottom: SPACING.l,
  },
  label: {
    fontSize: TYPOGRAPHY.sizes.body,
    fontWeight: TYPOGRAPHY.weights.medium,
    color: COLORS.textPrimary,
    marginBottom: SPACING.s,
  },
  input: {
    backgroundColor: COLORS.surface,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: COMPONENTS.input.radius,
    paddingHorizontal: SPACING.l,
    height: COMPONENTS.input.height,
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    color: COLORS.textPrimary,
  },
  inputFocused: {
    borderColor: COLORS.primary,
  },
  inputError: {
    borderColor: COLORS.error, 
  },
  errorText: {
    color: COLORS.error,
    fontSize: TYPOGRAPHY.sizes.caption,
    marginTop: SPACING.xs,
  }
});

export default Input;
