package com.seolgi.wedding.pc_web;


import com.seolgi.wedding.core.CoreApplication;
import com.seolgi.wedding.core.util.FullBeanNameGenerator;
import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.filter.CharacterEncodingFilter;

@SpringBootApplication
@EnableConfigurationProperties
@ComponentScan(nameGenerator = FullBeanNameGenerator.class)
@PropertySource(value = "classpath:properties/application-${spring.profiles.active}.pc-web.properties")
@Import(CoreApplication.class)
public class PcWebApplication extends SpringBootServletInitializer {


    public static void main(String[] args) {
        SpringApplication.run(PcWebApplication.class, args);
    }

    @Bean
    public FilterRegistrationBean characterEncodingFilter() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        registrationBean.setFilter(characterEncodingFilter);
        registrationBean.setOrder(1);
        registrationBean.addUrlPatterns("/*");
        return registrationBean;
    }

    @Bean
    public FilterRegistrationBean xssEscapeServletFilter() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(new XssEscapeServletFilter());
        registrationBean.addUrlPatterns("/*");
        return registrationBean;
    }
}
