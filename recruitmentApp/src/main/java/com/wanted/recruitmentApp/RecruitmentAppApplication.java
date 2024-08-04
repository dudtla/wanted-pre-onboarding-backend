package com.wanted.recruitmentApp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@MapperScan
@SpringBootApplication
public class RecruitmentAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(RecruitmentAppApplication.class, args);
	}

}
