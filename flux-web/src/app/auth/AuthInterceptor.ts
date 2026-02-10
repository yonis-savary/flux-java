import { HttpErrorResponse, HttpHandlerFn, HttpInterceptorFn, HttpRequest } from "@angular/common/http";
import { inject } from "@angular/core";
import { Router } from "@angular/router";
import { catchError, throwError } from "rxjs";

export const authInjector : HttpInterceptorFn = (req: HttpRequest<any>, next: HttpHandlerFn) => {
    const router = inject(Router);

    return next(req).pipe(
        catchError((error: HttpErrorResponse) => {
            if (error.status === 401)
                router.navigate(['/login']);
            return throwError(() => error);
        })
    );
}