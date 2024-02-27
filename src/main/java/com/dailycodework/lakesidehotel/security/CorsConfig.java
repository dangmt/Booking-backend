package com.dailycodework.lakesidehotel.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import java.util.Arrays;

@Configuration
public class CorsConfig {

    private static final Long MAX_AGE = 3600L;
    @Value("${CORS_ALLOWED_ORIGIN}")
    private String allowedOrigin;
    @Value("${CORS_ALLOWED_ORIGIN1}")
    private String allowedOrigin1;

    @Bean
    public CorsFilter corsFilter() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true); // Cho phép credentials
        config.addAllowedOrigin(allowedOrigin); // Cho phép Origin này
        config.addAllowedOrigin(allowedOrigin1); // Cho phép Origin này
        config.setAllowedHeaders(Arrays.asList(
                HttpHeaders.AUTHORIZATION,
                HttpHeaders.CONTENT_TYPE,
                HttpHeaders.ACCEPT)); // Cho phép các Header này
        config.setAllowedMethods(Arrays.asList(
                HttpMethod.GET.name(),
                HttpMethod.POST.name(),
                HttpMethod.PUT.name(),
                HttpMethod.DELETE.name())); // Cho phép các Method này
        config.setMaxAge(MAX_AGE); // Đặt max age cho pre-flight request

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config); // Áp dụng cấu hình cho tất cả các đường dẫn

        return new CorsFilter(source);
    }
}
