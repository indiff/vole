package com.chinasofti.app.message;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@Slf4j
@EnableDiscoveryClient
@SpringBootApplication
public class App12MessageApplication {

    public static void main(String[] args) {
        log.debug("App12MessageApplication startup main");
        SpringApplication application = new SpringApplication(App12MessageApplication.class);
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);
    }
}
