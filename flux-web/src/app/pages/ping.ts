import { Component, OnInit, signal } from "@angular/core";
import { CommonModule } from "@angular/common";
import { firstValueFrom, map } from "rxjs";
import { PingPongService } from "../api";

@Component({
    selector: 'app-ping',
    templateUrl: './ping.html',
    standalone: true,
    imports: [CommonModule]
})
export class Ping implements OnInit {
    response = signal("Loading")

    pingService: PingPongService
    constructor(
        pingService: PingPongService
    ) {
        this.pingService = pingService
    }

    async ngOnInit(): Promise<void> {
        const res = await firstValueFrom(this.pingService.ping())
        this.response.set(res.status);
        console.log(res,this.response)
    }

}