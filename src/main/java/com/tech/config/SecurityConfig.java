package com.tech.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.tech.service.CustomOAuth2UserService;
import com.tech.service.customAuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	
	private AuthenticationSuccessHandler customAuthenticationSuccessHandler() {
		return new customAuthenticationSuccessHandler();
	}
	private final CustomOAuth2UserService customOAuth2UserService;
	
	public SecurityConfig(CustomOAuth2UserService customOAuth2UserService) {
        this.customOAuth2UserService = customOAuth2UserService;
    }

	@Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

	@Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(authz -> authz
            	.requestMatchers("/WEB-INF/views/**", 
            			"/user/css/**", 
            			"/user/js/**", 
            			"/user/img/**", 
            			"/public/**",
            			"/static/**",
            			"/webjars/**",
            			"/signup",
            			"/verifyOtp",
            			"/images/**",
            			"/login/admin"
            			
            			)
            	.permitAll()
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .requestMatchers("/applicant/**").hasRole("APPLICANT")
                .requestMatchers("/employer/**").hasRole("EMPLOYER")
                .anyRequest().authenticated()
            )
	            .oauth2Login(oauth2Login -> oauth2Login
                .loginPage("/login")
                .userInfoEndpoint(userInfoEndpoint ->
                		userInfoEndpoint.userService(customOAuth2UserService)
            )
                .defaultSuccessUrl("/public/index", true)
                .failureUrl("/login?error=true")
        )
            .formLogin(form -> form
            	.loginPage("/login")
            	.successHandler(customAuthenticationSuccessHandler())
                .permitAll()
            )
            .logout(logout -> logout
            		.invalidateHttpSession(true)
            		.logoutSuccessUrl("/login?logout=true")
            		.permitAll());
        return http.build();
    }
}

