package com.cha.kim.wedding.admin.auth;//


import com.oakfusion.security.SecurityCookieService;
import org.springframework.security.core.Authentication;

import javax.servlet.http.Cookie;

public class CustomSecurityCookieService extends SecurityCookieService {

	private final String cookieDomain;

	public CustomSecurityCookieService(String cookieName, String key, String cookieDomain) {
		super(cookieName , key , "/");
		this.cookieDomain = cookieDomain;
	}

	@Override
	public Cookie createSecurityCookie(Authentication auth) {
		if (auth != null && auth.getPrincipal().equals("anonymousUser") == false) {
			Cookie cookie = super.createSecurityCookie(auth);
			cookie.setDomain(cookieDomain);
			return cookie;
		} else {
			return null;
		}
	}

	@Override
	public Cookie createLogoutCookie() {
		Cookie cookie = super.createLogoutCookie();
		cookie.setDomain(cookieDomain);
		return cookie;
	}



}
