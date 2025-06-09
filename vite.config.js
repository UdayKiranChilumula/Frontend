import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react-swc';

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    proxy: {
      '/api': {
        target: 'http://35.171.26.232:3000',
        secure: false,
      },
    },
  },

  plugins: [react()],
});
