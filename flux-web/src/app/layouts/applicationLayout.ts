import { Component } from "@angular/core";
import { RouterOutlet } from "@angular/router";
import { ButtonModule } from "primeng/button";
import { Menubar } from "primeng/menubar";

@Component({
    imports: [RouterOutlet, Menubar, ButtonModule],
    styles: [`
        :host {display: contents}
    `],
    template: `
    <section class="flex flex-col gap-3">
    <p-menubar [model]="navItems">
      <ng-template #end>
        <a routerLink="/order/new" >
          <p-button>
            <i class="pi pi-plus"></i>
            New Order
          </p-button>
        </a>
      </ng-template>
    </p-menubar>
        <router-outlet/>
    </section>
    `
})
export class ApplicationLayout {

    navItems = [
        /*

        {
            label: 'Home',
            icon: 'pi pi-home',
            routerLink: "/",
        },
        {
            label: "Clients",
            icon: "pi pi-user",
            items: [
                { label: 'New Client', routerLink: '/clients/new' },
                { label: 'List', routerLink: '/clients' },
            ]
        },
        {
            label: "My Company",
            icon: "pi pi-building",
            routerLink: "/profile"
        },
        {
            label: "Statistics",
            icon: "pi pi-chart-pie",
            routerLink: "/statistics"
        },
        {
            label: "Simulator",
            icon: "pi pi-calculator",
            routerLink: "/simulator"
        },
        */
        {
            label: 'Logout',
            icon: 'pi pi-sign-out',
            routerLink: "/logout"
        }
    ]
}