import { Routes } from '@angular/router';
import { Ping } from './pages/ping';
import { Login } from './pages/auth/login';

export const routes: Routes = [
    {
        path: "ping",
        title: "Ping Pong !",
        component: Ping
    },
    {
        path: "login",
        title: "Login Page",
        component: Login
    }
];
