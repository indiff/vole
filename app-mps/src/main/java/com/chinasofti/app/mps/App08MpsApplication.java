package com.chinasofti.app.mps;

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
@EnableFeignClients(basePackages = {"com.chinasofti.app.portal.common.fegin"})
@EnableHystrix                // 开启断路器
@EnableHystrixDashboard
@SpringBootApplication(scanBasePackages = {"com.chinasofti.app.mps", "com.chinasofti.app.common.bean","com.chinasofti.app.portal.common"})
public class App08MpsApplication {

    public static void main(String[] args) {
        log.debug("App08MpsApplication startup main");
        SpringApplication application = new SpringApplication(App08MpsApplication.class);
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);
    }
}
