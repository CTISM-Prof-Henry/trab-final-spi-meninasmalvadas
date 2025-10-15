package br.cspi;

// Importação necessária

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
// Adicione a implementação de CommandLineRunner
public class ProjetoSpringBootApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(ProjetoSpringBootApplication.class);
    }


    public static void main(String[] args) {
        SpringApplication.run(ProjetoSpringBootApplication.class, args);
    }


}