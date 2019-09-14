package com.chinasofti.app.portal.config;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.chinasofti.app.common.bean.config.FilterIgnorePropertiesConfig;
import com.chinasofti.app.passport.common.config.EnablePassportSso;
import com.chinasofti.app.passport.common.cookie.DefaultPassportCookieServices;
import com.chinasofti.app.passport.common.cookie.PassportCookieServices;
import com.chinasofti.app.passport.common.tokenstore.PassportTokenStore;
import com.chinasofti.app.passport.common.tokenstore.RedisPassportTokenStore;
import com.chinasofti.app.passport.common.utils.jackson2.PassportJackson2Module;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.jackson2.CoreJackson2Module;
import org.springframework.security.web.jackson2.WebJackson2Module;
import org.springframework.web.cors.CorsUtils;

import javax.annotation.Resource;

@Configuration
@EnablePassportSso
public class PortalWebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Resource
    private FilterIgnorePropertiesConfig filterIgnorePropertiesConfig;


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        String logout ="/logout";
        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry =
                http
                        .authorizeRequests();
        registry.requestMatchers(CorsUtils::isPreFlightRequest).permitAll();
        filterIgnorePropertiesConfig.getUrls().forEach(url -> registry.antMatchers(url).permitAll());
        registry.anyRequest().authenticated()
                .and()
                .logout().logoutUrl(logout)
                .invalidateHttpSession(true)
                .clearAuthentication(true);
    }


    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(redisConnectionFactory);
        template.setKeySerializer(new StringRedisSerializer());
        template.setHashKeySerializer(new StringRedisSerializer());
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new CoreJackson2Module());
        mapper.registerModule(new WebJackson2Module());
        mapper.registerModule(new PassportJackson2Module());
        mapper.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL, JsonTypeInfo.As.PROPERTY);
        mapper.disable(MapperFeature.AUTO_DETECT_SETTERS);
        RedisSerializer rs = new GenericJackson2JsonRedisSerializer(mapper);
        //template.setDefaultSerializer(new Jackson2JsonRedisSerializer(Object.class));
        template.setDefaultSerializer(rs);
        return template;
    }

    @Bean
    public PassportTokenStore passportTokenStore(RedisTemplate redisTemplate){
        RedisPassportTokenStore tokenStore  =new RedisPassportTokenStore();
        tokenStore.setRedisTemplate(redisTemplate);
        return tokenStore;
    }

    @Bean
    public PassportCookieServices passportCookieServices(PassportTokenStore passportTokenStore){
        DefaultPassportCookieServices cookieServices  =new DefaultPassportCookieServices();
        cookieServices.setPassportTokenStore(passportTokenStore);
        return cookieServices;
    }


}
