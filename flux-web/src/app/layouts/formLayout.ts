import { Component } from "@angular/core";
import { RouterOutlet } from "@angular/router";

@Component({
    imports: [RouterOutlet],
    styles: [`
        :host {display: contents}
    `],
    template: `
    <section class="m-auto">
        <router-outlet/>
    </section>
    `
})
export class FormLayout
{
}