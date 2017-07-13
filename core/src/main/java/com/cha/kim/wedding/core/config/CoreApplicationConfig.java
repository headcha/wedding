package com.cha.kim.wedding.core.config;

import com.cha.kim.wedding.core.CoreApplication;
import com.cha.kim.wedding.core.util.FullBeanNameGenerator;
import com.google.common.cache.CacheBuilder;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.guava.GuavaCacheManager;
import org.springframework.context.annotation.*;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

import java.util.concurrent.TimeUnit;

@Configuration
@ComponentScan(basePackageClasses = CoreApplication.class , nameGenerator = FullBeanNameGenerator.class)
@PropertySource( value = "classpath:properties/${env}.core.properties" )
@Import({CoreDataBaseConfig.class})
public class CoreApplicationConfig {
	@Bean
	public static PropertySourcesPlaceholderConfigurer placeHolderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
}
