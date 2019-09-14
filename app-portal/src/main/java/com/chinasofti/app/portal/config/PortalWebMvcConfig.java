package com.chinasofti.app.portal.config;

import com.chinasofti.app.common.bean.config.FilterIgnorePropertiesConfig;
import com.chinasofti.app.portal.common.interceptor.GlobalInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

@Configuration
public class PortalWebMvcConfig implements WebMvcConfigurer {

    @Resource
    private FilterIgnorePropertiesConfig filterIgnorePropertiesConfig;

    @Bean
    public GlobalInterceptor getGlobalInterceptor() {
        return new GlobalInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration addInterceptor = registry.addInterceptor(getGlobalInterceptor());
        // 排除exclude
        filterIgnorePropertiesConfig.getExcludes().forEach(url -> addInterceptor.excludePathPatterns(url));
        // 拦截配置
        addInterceptor.addPathPatterns("/**");
    }

}
