/**
 * Global type definitions
 */

export interface HealthResponse {
  status: string;
  app: string;
}

export interface ApiError {
  message: string;
  statusCode?: number;
}
