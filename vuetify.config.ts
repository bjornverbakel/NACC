export const vuetifyConfig = {
  // Define global component defaults
  defaults: {
    VBtn: {
      elevation: 0,
      rounded: '0',
    },
    VCard: {
      elevation: 0,
      rounded: '0',
    },
  },

  // Define themes
  theme: {
    defaultTheme: 'light',
    themes: {
      light: {
        colors: {
          background: '#C4C0A9',
          surface: '#D3CDB5',
          primary: '#1976D2',
          secondary: '#424242',
          accent: '#82B1FF',
          error: '#FF5252',
          info: '#2196F3',
          success: '#4CAF50',
          warning: '#FB8C00',
        },
      },
    },
  },
}
