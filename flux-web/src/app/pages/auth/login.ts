import { Component, computed, inject } from "@angular/core";
import { CommonModule } from "@angular/common";
import { CardModule } from "primeng/card";
import { InputTextModule } from "primeng/inputtext";
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from "@angular/forms";
import { PasswordModule } from "primeng/password";
import { ButtonModule } from "primeng/button";
import { AuthenticationService, LoginRequest } from "../../api";
import { first, firstValueFrom } from "rxjs";
import { HttpClient, HttpClientModule } from "@angular/common/http";
import { Router } from "@angular/router";

@Component({
    selector: 'app-login',
    template: `
    <p-card header="Flux - Login">
        <form class="flex flex-col gap-3" [formGroup]="form" (ngSubmit)="submit()">
            <label class="form-label">
                <span>Username</span>
                <input type="text" pInputText formControlName="username" />
            </label>
            <label class="form-label">
                <span>Password</span>
                <p-password autocomplete="off" pInputPassword [feedback]="false" formControlName="password" />
            </label>
            <p-button type="submit" [disabled]="isLogging || !form.valid" fluid class="mt-3">
                {{ isLogging ? 'Loading...': 'Login' }}
            </p-button>
        </form>
    </p-card>
    `,
    standalone: true,
    imports: [CommonModule, CardModule, InputTextModule, PasswordModule, ReactiveFormsModule, ButtonModule]
})
export class Login {
    
    private http = inject(HttpClient)
    private router = inject(Router)

    authService : AuthenticationService
    constructor(authService: AuthenticationService) {
        this.authService = authService
    }
    
    isLogging = false
    form = new FormGroup({
        username: new FormControl("", Validators.required),
        password: new FormControl("", Validators.required),
    })

    async submit() {
        this.isLogging = true;
        if (this.form.invalid)
            return;

        const body = new URLSearchParams();
        body.set('username', this.form.value.username || '');
        body.set('password', this.form.value.password || '');

        try {
            await firstValueFrom(this.http.post('auth/login', body.toString(), {
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                withCredentials: true
            }))
            this.isLogging = false;
            this.router.navigate(["/ping"]);
        } catch (err) {
            console.error("API error", err);
            this.isLogging = false;
        }
    }
}