import { HttpClient } from "@angular/common/http";
import { Component, inject, OnInit } from "@angular/core";
import { CardModule } from "primeng/card";
import { firstValueFrom } from "rxjs";


@Component({
    imports: [CardModule],
    standalone: true,
    template: `
        <p-card header="Logout">
            <p>Logging out...</p>
        </p-card>
    `
})
export class Logout implements OnInit
{
    private http = inject(HttpClient)

    async ngOnInit() {
        await firstValueFrom(this.http.get("auth/logout"))
    }
}