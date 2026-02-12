export * from './authentication.service';
import { AuthenticationService } from './authentication.service';
export * from './pingPong.service';
import { PingPongService } from './pingPong.service';
export const APIS = [AuthenticationService, PingPongService];
