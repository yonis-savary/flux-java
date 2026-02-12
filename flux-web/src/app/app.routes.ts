import { Routes } from '@angular/router';
import { Ping } from './pages/ping';
import { Login } from './pages/auth/login';
import { ApplicationLayout } from './layouts/applicationLayout';
import { FormLayout } from './layouts/formLayout';
import { Logout } from './pages/auth/logout';

export const routes: Routes = [
    {
        path: '',
        component: ApplicationLayout,
        children: [
            {
                path: "ping",
                title: "Ping Pong !",
                component: Ping
            }
        ]
    },
    {
        path: '',
        component: FormLayout,
        children: [
            {
                path: "login",
                title: "Login Page",
                component: Login
            },
            {
                path: "logout",
                title: "Logging out",
                component: Logout
            }
        ]
    }
];
