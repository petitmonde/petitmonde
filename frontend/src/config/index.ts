/**
 * Application configuration
 */

export const config = {
  apiBaseUrl: import.meta.env.VITE_API_BASE_URL || 'http://localhost:8000',
  apiVersion: 'v1',
} as const;

export const API_ENDPOINTS = {
  health: '/health',
  api: {
    root: `/api/${config.apiVersion}`,
  },
} as const;
