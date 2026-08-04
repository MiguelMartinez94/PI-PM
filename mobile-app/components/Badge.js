import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const Badge = ({ title, type = 'neutral' }) => {
  return (
    <View style={[styles.badge, styles[type]]}>
      <Text style={[styles.text, type === 'warning' && styles.textDark]}>
        {title}
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  badge: {
    paddingVertical: 4,
    paddingHorizontal: 12,
    borderRadius: 50,
    alignSelf: 'flex-start',
  },
  success: {
    backgroundColor: '#2E7D32',
  },
  warning: {
    backgroundColor: '#F5C518',
  },
  error: {
    backgroundColor: '#8C203D',
  },
  neutral: {
    backgroundColor: '#9E9E9E',
  },
  text: {
    color: '#FFFFFF',
    fontSize: 12,
    fontWeight: 'bold',
  },
  textDark: {
    color: '#0C1026',
  }
});

export default Badge;
