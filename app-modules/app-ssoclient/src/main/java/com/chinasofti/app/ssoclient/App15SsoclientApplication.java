package com.chinasofti.app.ssoclient;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.oauth2.resource.UserInfoRestTemplateFactory;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;

@Slf4j
@EnableDiscoveryClient
@SpringBootApplication(scanBasePackages = {"com.chinasofti.app.ssoclient", "com.chinasofti.app.common.bean"})
public class App15SsoclientApplication {

    public static void main(String[] args) {
        log.debug("App15SsoclientApplication startup main");
        SpringApplication application = new SpringApplication(App15SsoclientApplication.class);
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);
    }


    @LoadBalanced
    @Bean
    public OAuth2RestTemplate restTemplate(UserInfoRestTemplateFactory factory) {
        return factory.getUserInfoRestTemplate();
    }
}
