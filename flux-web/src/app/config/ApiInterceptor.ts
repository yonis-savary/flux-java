import { HttpHandlerFn, HttpInterceptorFn, HttpRequest } from "@angular/common/http";
import { environment } from "../../environments/environment";

export const apiInterceptor : HttpInterceptorFn = (req: HttpRequest<any>, next: HttpHandlerFn) => {

    if (req.url.startsWith("http"))
        return next(req);

    const apiBaseUrl = environment.apiUrl;

    const newReq = req.clone({url: `${apiBaseUrl}/${req.url}`});

    return next(newReq);
}