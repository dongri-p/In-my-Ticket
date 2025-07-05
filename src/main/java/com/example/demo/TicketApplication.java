package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;
import java.util.Collections;

@SpringBootApplication
public class TicketApplication {

	public static void main(String[] args) {
		SpringApplication.run(TicketApplication.class, args);
	}
	
	@Bean
	public FilterRegistrationBean<SitemeshConfig> sitemeshbean() {
		FilterRegistrationBean<SitemeshConfig> bean=new FilterRegistrationBean<>();
		bean.setFilter(new SitemeshConfig());
		return bean;
	}

	// RestTemplate에 UTF-8 인코딩 설정 추가
	@Bean
	public RestTemplate restTemplate() {
		HttpMessageConverter<String> converter=new StringHttpMessageConverter(StandardCharsets.UTF_8);
		RestTemplate restTemplate=new RestTemplate();
		restTemplate.getMessageConverters().add(0, converter); // UTF-8 우선 적용
		return restTemplate;
	}
}
