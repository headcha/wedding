package com.cha.kim.wedding.web.config;

import com.cha.kim.wedding.core.config.CoreApplicationConfig;
import com.cha.kim.wedding.core.util.FullBeanNameGenerator;
import com.cha.kim.wedding.web.WebApplication;
import com.cha.kim.wedding.web.config.xss.XssModule;
import com.cha.kim.wedding.web.interceptor.CommonCodeInterceptor;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.support.OpenEntityManagerInViewInterceptor;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import java.util.List;

@Configuration
@EnableWebMvc
@ComponentScan(basePackageClasses = WebApplication.class , nameGenerator = FullBeanNameGenerator.class)
@Import({CoreApplicationConfig.class })
@PropertySource( value = "classpath:properties/${env}.web.properties" )
public class WebApplicationConfig extends WebMvcConfigurerAdapter {
    @Value("${web.build.timestamp}")
    private String buileTimestamp;

    @Autowired
    private LocalContainerEntityManagerFactoryBean entityManagerFactory;

    @Override
    public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new XssModule());
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        converters.stream()
                .filter(converter -> converter instanceof MappingJackson2HttpMessageConverter)
                .map(converter -> (MappingJackson2HttpMessageConverter) converter)
                .forEach(converter -> converter.setObjectMapper(mapper));
    }

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");

        return viewResolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/" +  buileTimestamp + "/resources/**")
                .addResourceLocations( "/resources/");

        registry.addResourceHandler("/resources/**")
                .addResourceLocations( "/resources/");
    }

    @Bean
    public CommonCodeInterceptor commonCodeInterceptor() {
        return new CommonCodeInterceptor();
    }

    @Bean
    public OpenEntityManagerInViewInterceptor openEntityManagerInViewInterceptor() {
        OpenEntityManagerInViewInterceptor result = new OpenEntityManagerInViewInterceptor();
        result.setEntityManagerFactory(entityManagerFactory.getObject());
        return result;
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addWebRequestInterceptor(openEntityManagerInViewInterceptor());
        registry.addInterceptor(commonCodeInterceptor());
    }
}
