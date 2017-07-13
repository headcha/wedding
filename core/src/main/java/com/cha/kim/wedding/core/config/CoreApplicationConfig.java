package com.cha.kim.wedding.core.config;

import com.cha.kim.wedding.core.CoreApplication;
import com.cha.kim.wedding.core.util.FullBeanNameGenerator;
import org.springframework.context.annotation.*;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@ComponentScan(basePackageClasses = CoreApplication.class , nameGenerator = FullBeanNameGenerator.class)
@EnableJpaRepositories(basePackageClasses = CoreApplication.class)
public class CoreApplicationConfig {
	@Bean
	public static PropertySourcesPlaceholderConfigurer placeHolderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
}
