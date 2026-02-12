import { ApplicationConfig, provideBrowserGlobalErrorListeners } from '@angular/core';
import { provideRouter } from '@angular/router';

import { routes } from './app.routes';

import { providePrimeNG } from 'primeng/config'
import Aura from '@primeuix/themes/aura';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { authInjector } from './config/AuthInterceptor';
import { provideApi } from './api';
import { apiInterceptor } from './config/ApiInterceptor';

const primeNGConfig = {theme: {
  preset: {
    ...Aura,
    semantic: {
      ...Aura.semantic,
      primary: {
        50: '#ecf1ff',  100: '#dde4ff',
        200: '#c2ceff', 300: '#9cacff',
        400: '#757fff', 500: '#5959ff',
        600: '#4536f5', 700: '#3b2ad8',
        800: '#3025ae', 900: '#2b2689',
        950: '#1b1650',
      }
    }
  },
  options: {
    darkModeSelector: 'none',
  }
}}

export const appConfig: ApplicationConfig = {
    providers: [
      provideHttpClient(
        withInterceptors([apiInterceptor, authInjector])
      ),
      provideBrowserGlobalErrorListeners(),
      provideRouter(routes),
      providePrimeNG(primeNGConfig),
      provideApi({
        withCredentials: true
      })
    ]
  };