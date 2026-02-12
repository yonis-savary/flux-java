package com.flux.flux_api.generated.annotations;

import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import com.flux.flux_api.generated.entity.WorkplanJsonIssue;

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@ApiResponse(
    responseCode = "200",
    description = "Success",
    content = @Content(
        mediaType = "application/json",
        schema = @Schema(implementation = WorkplanJsonIssue.class)
    )
)
public @interface WorkplanJsonIssueResponse {
    Class<?> schema();
}
