package com.SAR_Generator.main_service.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class HealthController {
    @GetMapping("/")
    public String home() {
        return"healthy 1.01 main_service";
    }

    @GetMapping("/health")
    public String health() {
        return"ok";
    }
}
