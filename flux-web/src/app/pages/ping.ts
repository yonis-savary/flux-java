import { Component, OnInit } from "@angular/core";
import { PingPongControllerService } from "../api";
import { CommonModule } from "@angular/common";
import { firstValueFrom } from "rxjs";

@Component({
    selector: 'app-ping',
    templateUrl: './ping.html',
    standalone: true,
    imports: [CommonModule]
})
export class Ping implements OnInit {
    response = "Loading"

    pingService: PingPongControllerService
    constructor(
        pingService: PingPongControllerService
    ) {
        this.pingService = pingService
    }

    async ngOnInit(): Promise<void> {
        const res = await firstValueFrom(this.pingService.ping());
        console.log(res);
    }

}