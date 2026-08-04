export const COLORS = {
  
  primary: '#8C203D',
  primaryLight: '#A72D4D',
  primaryDark: '#6A162B',
  
  
  background: '#0C1026',
  surface: '#1E2333',
  surfaceLight: '#282E40',
  
  
  success: '#4CAF50',
  error: '#F44336',
  warning: '#FF9800',
  
  
  textPrimary: '#FFFFFF',
  textSecondary: '#9E9E9E',
  textMuted: '#6E6E6E',
  
  
  border: '#2A3042',
  fieldGreen: '#1E4A28'
};

export const TYPOGRAPHY = {
  weights: {
    regular: '400',
    medium: '500',
    semibold: '600',
    bold: '700'
  },
  sizes: {
    caption: 12,
    body: 14,
    bodyLarge: 16,
    subtitle: 18,
    title: 22,
    headline: 28,
    display: 34
  }
};

export const SPACING = {
  xs: 4,
  s: 8,
  m: 12,
  l: 16,
  xl: 20,
  xxl: 24,
  xxxl: 32,
  huge: 40,
  massive: 48,
  giant: 64
};

export const RADIUS = {
  small: 12,
  medium: 16,
  large: 20,
  card: 24,
  pill: 999
};

export const SHADOWS = {
  soft: {
    shadowColor: '#000000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.18,
    shadowRadius: 12,
    elevation: 4,
  },
  medium: {
    shadowColor: '#000000',
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.28,
    shadowRadius: 18,
    elevation: 8,
  },
  glow: {
    shadowColor: '#8C203D',
    shadowOffset: { width: 0, height: 6 },
    shadowOpacity: 0.35,
    shadowRadius: 16,
    elevation: 6,
  },
  elevated: {
    shadowColor: '#000000',
    shadowOffset: { width: 0, height: 12 },
    shadowOpacity: 0.38,
    shadowRadius: 24,
    elevation: 12,
  }
};

export const COMPONENTS = {
  button: {
    height: 52,
    radius: 18,
    paddingHorizontal: 20,
  },
  input: {
    height: 52,
    radius: 16,
  },
  card: {
    padding: 20,
    radius: 24,
    shadowColor: '#000000',
    shadowOffset: { width: 0, height: 6 },
    shadowOpacity: 0.2,
    shadowRadius: 14,
    elevation: 5,
    borderWidth: 1,
    borderColor: 'rgba(255, 255, 255, 0.08)'
  }
};
