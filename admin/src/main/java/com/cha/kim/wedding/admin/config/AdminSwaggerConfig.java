package com.cha.kim.wedding.admin.config;

import com.google.common.base.Predicate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


import static com.google.common.base.Predicates.containsPattern;
import static com.google.common.base.Predicates.or;

@Configuration
@EnableSwagger2
public class AdminSwaggerConfig {
    @Bean
    public Docket customImplementation() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .paths(paths())
                .build()
                .apiInfo(apiInfo());
    }

    private ApiInfo apiInfo() {
        ApiInfo apiInfo = new ApiInfo(
                "Seolgi Api",
                "Api Test Tool",
                "",
                "",
                "",
                "",
                ""
        );
        return apiInfo;
    }

    private Predicate<String> paths() {
        return or(containsPattern("/api/*"));
    }
}