package com.cha.kim.wedding.admin.config;

import com.cha.kim.wedding.admin.auth.CustomCookieSecurityContextRepository;
import com.cha.kim.wedding.admin.auth.CustomSecurityCookieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cha.kim.wedding.admin.auth.CustomAuthenticationProvider;
import org.springframework.security.web.context.SecurityContextRepository;


@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class AdminSecurityConfig extends WebSecurityConfigurerAdapter {

    @Value("${admin.cookie.domain}")
    private String cookieDomain;

    @Value("${admin.cookie.secure.key}")
    private String cookieSecureKey;


    private static final String COOKIE_NAME = "seolgi-admin-sid";

    @Autowired
	private CustomAuthenticationProvider customAuthenticationProvider;


    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(customAuthenticationProvider);
    }

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.headers().frameOptions().sameOrigin()
                .httpStrictTransportSecurity().disable()
            .and()
                .authorizeRequests()
                .anyRequest().permitAll()
                .and().authenticationProvider(customAuthenticationProvider)
                .securityContext().securityContextRepository(securityContextRepository())
            .and().formLogin()
                .loginPage("/?login=form")
                .loginProcessingUrl("/auth/process")
                .defaultSuccessUrl("/")
                .failureUrl("/?login=error")
                .usernameParameter("id")
                .passwordParameter("password")
                .permitAll()
            .and().logout()
                .logoutUrl("/auth/logout")
                .logoutSuccessUrl("/")
                .deleteCookies(COOKIE_NAME , "JSESSIONID")
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
    public SecurityContextRepository securityContextRepository() {
        CustomSecurityCookieService service = new CustomSecurityCookieService(COOKIE_NAME, cookieSecureKey , cookieDomain);
        return new CustomCookieSecurityContextRepository(service);
    }

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
