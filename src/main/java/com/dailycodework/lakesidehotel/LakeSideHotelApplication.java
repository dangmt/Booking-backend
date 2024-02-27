package com.dailycodework.lakesidehotel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import io.github.cdimascio.dotenv.Dotenv;

// @EnableJpaRepositories
@SpringBootApplication
public class LakeSideHotelApplication {

    public static void main(String[] args) {
        // Dotenv dotenv = Dotenv.configure().filename("D://7D23v15/Booking
        // Java/Booking-backend/.env").load();
        // Dotenv dotenv = Dotenv.configure().filename("/Booking-backend/").load();

        // Dotenv dotenv = Dotenv.configure().load(); // Tự động tìm và load file .env
        // .env
        // Dotenv dotenv = Dotenv.load();
        // dotenv.entries().forEach(e -> System.setProperty(e.getKey(), e.getValue()));

        SpringApplication.run(LakeSideHotelApplication.class, args);
    }

}
