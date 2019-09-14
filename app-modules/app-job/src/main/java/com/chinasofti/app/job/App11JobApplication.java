package com.chinasofti.app.job;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class App11JobApplication {

    public static void main(String[] args) {

        SpringApplication.run(App11JobApplication.class, args);
    }
}
