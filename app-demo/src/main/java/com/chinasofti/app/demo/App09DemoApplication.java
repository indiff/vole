package com.chinasofti.app.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.openfeign.EnableFeignClients;

@Slf4j
@EnableFeignClients
@EnableDiscoveryClient
@EnableHystrix                // 开启断路器
@EnableHystrixDashboard
@SpringBootApplication
public class App09DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(App09DemoApplication.class, args);
    }
}
