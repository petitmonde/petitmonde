/**
 * Example composable for API health check
 */

import { ref } from 'vue';
import { apiService } from 'src/services/api';
import { API_ENDPOINTS } from 'src/config';
import type { HealthResponse } from 'src/types';

export function useHealthCheck() {
  const isHealthy = ref(false);
  const loading = ref(false);
  const error = ref<string | null>(null);

  const checkHealth = async () => {
    loading.value = true;
    error.value = null;

    try {
      const response = await apiService.get<HealthResponse>(API_ENDPOINTS.health);
      isHealthy.value = response.status === 'healthy';
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'Unknown error';
      isHealthy.value = false;
    } finally {
      loading.value = false;
    }
  };

  return {
    isHealthy,
    loading,
    error,
    checkHealth,
  };
}
