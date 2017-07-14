package com.cha.kim.wedding.core;

import com.cha.kim.wedding.core.util.FullBeanNameGenerator;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource(value = "classpath:application-${spring.profiles.active}.core.properties")
@ComponentScan(basePackageClasses = CoreApplication.class , nameGenerator = FullBeanNameGenerator.class)
@EnableAutoConfiguration
public class CoreApplication {
}
