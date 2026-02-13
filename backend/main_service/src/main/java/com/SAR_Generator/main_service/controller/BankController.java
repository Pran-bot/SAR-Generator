package com.SAR_Generator.main_service.controller;

import org.springframework.web.bind.annotation.RestController;

import com.SAR_Generator.main_service.services.BankAlertService;
import com.SAR_Generator.main_service.services.BankAlertServiceImple;
import com.SAR_Generator.main_service.services.KafkaProducerService;

import java.lang.module.ResolutionException;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

// import com.fasterxml.jackson.databind.JsonNode;


@RestController
public class BankController {

    @Autowired
    private BankAlertServiceImple bankAlertServiceImple;

    @PostMapping("/data")
    public ResponseEntity<String> bankEndpoint(@RequestBody String body) {

        // //  Check empty body
        // if (body == null || body.isBlank()) {
        //     return ResponseEntity
        //             .badRequest()
        //             .body("Request body is empty");
        // }

        // body = body.trim();

        // // Basic JSON format check
        // if (body.charAt(0) != '{' || body.charAt(body.length() - 1) != '}') {

        //     return ResponseEntity
        //             .badRequest()
        //             .body("Invalid JSON format");
        // }

        try {
            // Send to Kafka
            bankAlertServiceImple.processAlert(body);

            return ResponseEntity.ok("success");

        } catch (Exception e) {

            return ResponseEntity
                    .status(500)
                    .body("Kafka error: " + e.getMessage());
        }
    }
}
