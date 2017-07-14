package com.cha.kim.wedding.admin.config;

import com.cha.kim.wedding.admin.auth.CustomAuthenticationProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class AdminSecurityConfig extends WebSecurityConfigurerAdapter {


	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
                .authorizeRequests()
					.antMatchers("/","/lib/**", "/**/**.js",  "/**/**.css", "/**.ico" ,"/**/**.map", "/**.html" , "/webjars/**" , "/swagger-resources/**" , "/v2/api-docs/**", "/configuration/**", "/images/**", "/resources/**").permitAll()
                	.anyRequest()
					.authenticated()
                .and().authenticationProvider(customAuthenticationProvider())
                .formLogin()
                .loginPage("/")
                .loginProcessingUrl("/auth/process")
                .defaultSuccessUrl("/")
                .failureUrl("/?login=error")
                .usernameParameter("id")
                .passwordParameter("password")
                .permitAll()
            .and().logout()
                .logoutUrl("/auth/logout")
                .logoutSuccessUrl("/")
                .deleteCookies("JSESSIONID")
                .invalidateHttpSession(true)
                .permitAll()
                .and().csrf()
                .disable()
                .httpBasic()
            .and().sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.NEVER)
        ;
	}


    @Bean
    public CustomAuthenticationProvider customAuthenticationProvider() {
        return new CustomAuthenticationProvider();
    }


    @Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
