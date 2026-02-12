package com.flux.flux_api.controllers;

import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;


@RestController
@Tag(name = "PingPong")
public class PingPongController {

    @GetMapping("/ping")
    @Operation(description = "Ping")
    @ApiResponse(responseCode = "200", content = @Content(mediaType = "application/json"))
    Map<String, Object> ping() {
        return Map.of(
            "status", "ok"
        );
    }
}
