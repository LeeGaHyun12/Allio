package org.example.pp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"controller.*","*.member","data.*","tiles.config","org.example.pp"}) //어노테이션 패키지들
@MapperScan("data.mapper")
public class PpApplication {

    public static void main(String[] args) {
        SpringApplication.run(PpApplication.class, args);
    }

}
