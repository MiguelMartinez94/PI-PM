import React from 'react';
import { View, Text, Image, StyleSheet } from 'react-native';
import { COLORS, TYPOGRAPHY } from '../theme/theme';


const AppHeaderTitle = ({ children }) => {
  const screenTitle = typeof children === 'string' ? children : null;

  return (
    <View style={styles.container}>
      <Image
        source={require('../assets/Logo.jpeg')}
        style={styles.logo}
        resizeMode="cover"
      />
      <Text style={styles.brandTitle}>Balompié</Text>
      {screenTitle ? (
        <Text style={styles.separator}>{'  ·  '}</Text>
      ) : null}
      {screenTitle ? (
        <Text style={styles.screenTitle} numberOfLines={1}>
          {screenTitle}
        </Text>
      ) : null}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  logo: {
    width: 30,
    height: 30,
    borderRadius: 15,
    marginRight: 8,
    borderWidth: 1,
    borderColor: COLORS.primary,
  },
  brandTitle: {
    fontSize: TYPOGRAPHY.sizes.subtitle,
    fontWeight: TYPOGRAPHY.weights.bold,
    color: COLORS.primary,
    letterSpacing: 0.5,
  },
  separator: {
    fontSize: TYPOGRAPHY.sizes.bodyLarge,
    color: COLORS.textMuted,
    fontWeight: TYPOGRAPHY.weights.medium,
  },
  screenTitle: {
    fontSize: TYPOGRAPHY.sizes.body,
    fontWeight: TYPOGRAPHY.weights.semibold,
    color: COLORS.textSecondary,
    maxWidth: 150,
  },
});

export default AppHeaderTitle;
