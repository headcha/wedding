package com.cha.kim.wedding.admin.auth;

import com.cha.kim.wedding.core.account.Account;
import com.cha.kim.wedding.core.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;

@Service
public class AuthSecurityService implements UserDetailsService {

	@Autowired
	private AccountService accountService;
	
	@Override
	public UserDetails loadUserByUsername(final String id) throws UsernameNotFoundException {

		Account account = accountService.findOneById(id);
		if (account == null)
			return null;
		return createUser(account.getId() , account.getPassword());
	}

	private User createUser(String id, String password) {
		Collection<SimpleGrantedAuthority> roles = new ArrayList<>();
		roles.add(new SimpleGrantedAuthority(Authority.USER));

		return new User(id, password , roles);
	}

}
