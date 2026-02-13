package com.SAR_Generator.main_service.validation;

import javax.management.RuntimeErrorException;

import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class JsonValidator  {

    @Autowired
    private ObjectMapper objectMapper;

    public void validate(String json) {

        if (json == null || json.isBlank()) {
            throw new RuntimeException("Empty body");
        }
        try {
            objectMapper.readTree(json);
        } catch (Exception e) {
            throw new RuntimeException("Invalid JSON format");
        }
    }
}
