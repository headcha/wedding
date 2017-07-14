package com.cha.kim.wedding.admin.config;

import com.cha.kim.wedding.admin.config.helper.EqualsHelper;
import com.cha.kim.wedding.admin.config.xss.XssModule;
import com.cha.kim.wedding.admin.interceptor.commonCode.CommonCodeInterceptor;
import com.cha.kim.wedding.admin.interceptor.user.LoggedUserInterceptor;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.jknack.handlebars.springmvc.HandlebarsViewResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import java.io.IOException;
import java.util.List;

@Configuration
public class AdminApplicationConfig extends WebMvcConfigurerAdapter {


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
    public CommonsMultipartResolver multipartResolver() throws IOException {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setDefaultEncoding("UTF-8");
        resolver.setUploadTempDir(new FileSystemResource("/tmp"));
        resolver.setMaxInMemorySize(2048000);
        resolver.setMaxUploadSize(10240000);
        resolver.setMaxUploadSizePerFile(20480000);//20MB

        return resolver;
    }

    @Bean
    public HandlebarsViewResolver viewResolver() {
        HandlebarsViewResolver viewResolver = new HandlebarsViewResolver();
        viewResolver.setPrefix("classpath:/templates/");
        viewResolver.setSuffix(".hbs");
        viewResolver.setExposeRequestAttributes(true);
        viewResolver.setExposeSessionAttributes(true);
        viewResolver.setCache(false);

        viewResolver.registerHelper("equals", new EqualsHelper());
        return viewResolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("swagger-ui.html")
                .addResourceLocations("classpath:/META-INF/resources/");

        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");


        registry.addResourceHandler("/resources/**")
                .addResourceLocations( "/resources/");
    }


    @Bean
    public CommonCodeInterceptor commonCodeInterceptor() {
        return new CommonCodeInterceptor();
    }

    @Bean
    public LoggedUserInterceptor loggedUserInterceptor() {
        return new LoggedUserInterceptor();
    }
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(commonCodeInterceptor());
        registry.addInterceptor(loggedUserInterceptor());
    }
}
