package br.cspi.config;


import br.cspi.security.AutorizadorInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AppConfig {
    @Bean
    public WebMvcConfigurer mvcConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                registry.addInterceptor(new AutorizadorInterceptor())
                        .addPathPatterns("/**")
                        .excludePathPatterns(   // Exceto as listadas abaixo
                                "/login",       // Exclui a pĂ¡gina de login (GET e POST)
                                "/",            // Exclui a pĂ¡gina inicial/sobre
                                "/css/**",      // Exclui TUDO dentro da pasta /css
                                "/img/**",      // Exclui TUDO dentro da pasta /img
                                "/js/**"        // Exclui TUDO dentro da pasta /js (se vocĂŞ tiver)
                        );
            }
        };
    }


}
