package com.iit.uni.miskolc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@SpringBootApplication
@Configuration
@ComponentScan
public class TesztSpringApplication {
	@Bean
	B mockB() {
		return new BImpl();
	}

	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(TesztSpringApplication.class);

		A a = context.getBean(A.class);
		a.hello();
	}
}
