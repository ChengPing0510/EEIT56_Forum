package sixteam.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import sixteam.t6_10.model.MyAuthenticationProvider;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsService userDetailsService;

//    @Autowired
//    private MyAuthenticationProvider myAuthenticationProvider;

//    @Autowired
//    private MyAuthenticationSuccessHandler myAuthenticationSuccessHandler;
//
//    @Autowired
//    private MyAuthenticationFailureHandler myAuthenticationFailureHandler;
//
//    @Autowired
//    private MyLogoutSuccessHandler myLogoutSuccessHandler;

//    @Autowired
//    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        auth.authenticationProvider(myAuthenticationProvider);
//    }
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
        	.userDetailsService(userDetailsService)
        	.passwordEncoder(new BCryptPasswordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
        	.csrf().disable()
//        	.authenticationProvider(myAuthenticationProvider)
        	.authorizeRequests()
//            .antMatchers(HttpMethod.POST,"/users/**").authenticated()
//            .antMatchers(HttpMethod.POST).permitAll()
        	.antMatchers("/background_index/**").permitAll() //開這個登入畫面才能讀到CSS、JS
        	.antMatchers("/login/**").permitAll()
        	.antMatchers("/forgot.controller").permitAll()
        	.antMatchers("/checkAccountEmail.controller").permitAll()
        	.antMatchers("/sendmailforverify.controller").permitAll()
        	.antMatchers("/findaccountnumber.controller").permitAll()
        	.antMatchers("/changepassword.controller").permitAll()
        	.antMatchers("/t6_10_showNowImg.controller").permitAll()
        	.antMatchers("/who").permitAll()
        	
		    .antMatchers("/admin/**").hasRole("ADMIN")
		    .antMatchers("/user/**").hasAnyRole("ADMIN", "USER")
//	        .anyRequest().authenticated()
		    .and()
	        .rememberMe().tokenValiditySeconds(3600).key("rememberMe-key")
		    .and()
		    .formLogin()
		    .loginPage("/login")
		    .defaultSuccessUrl("/loginToIndex")
		    .and()
		    .logout()
		    .logoutSuccessUrl("/logout-success")
		    .permitAll()
		    
		    ;    

    }

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }
}