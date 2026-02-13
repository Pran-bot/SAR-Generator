package com.SAR_Generator.main_service.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;


@Service
public class KafkaProducerService {

    private static final String TOPIC = "bankAlert";

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    public void send(String event) throws RuntimeException{
        kafkaTemplate.send(TOPIC, event);
    }
}