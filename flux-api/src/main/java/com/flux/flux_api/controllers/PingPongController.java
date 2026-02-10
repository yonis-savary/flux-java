package com.flux.flux_api.controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class PingPongController {

    @GetMapping("/ping")
    String ping() {
        return new String("pong");
    }
}
