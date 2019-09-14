package com.chinasofti.app.auth;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.openfeign.EnableFeignClients;

@Slf4j
@EnableDiscoveryClient
@EnableFeignClients
@EnableHystrix                // 开启断路器
@EnableHystrixDashboard
@SpringBootApplication(scanBasePackages = {"com.chinasofti.app.auth", "com.chinasofti.app.common.bean"})
public class App06AuthApplication {

    public static void main(String[] args) {
        log.debug("App06AuthApplication startup main");
        SpringApplication application = new SpringApplication(App06AuthApplication.class);
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);
    }
}
