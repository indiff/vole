package com.chinasofti.app.demo.fegin;

import com.chinasofti.app.demo.fegin.fallback.TraceServiceFallbackImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@FeignClient(name = "app-mps", fallback = TraceServiceFallbackImpl.class)
public interface TraceService {

    @GetMapping("/rest/trace/{name}")
    String trace(@PathVariable("name") String name);


}
