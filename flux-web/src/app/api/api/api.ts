export * from './authentication.service';
import { AuthenticationService } from './authentication.service';
export * from './pingPongController.service';
import { PingPongControllerService } from './pingPongController.service';
export const APIS = [AuthenticationService, PingPongControllerService];
