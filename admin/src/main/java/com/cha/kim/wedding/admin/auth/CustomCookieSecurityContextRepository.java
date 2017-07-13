package com.cha.kim.wedding.admin.auth;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpRequestResponseHolder;
import org.springframework.security.web.context.SaveContextOnUpdateOrErrorResponseWrapper;
import org.springframework.security.web.context.SecurityContextRepository;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CustomCookieSecurityContextRepository  implements SecurityContextRepository {
    private final CustomSecurityCookieService securityCookieService;

    public CustomCookieSecurityContextRepository(CustomSecurityCookieService securityCookieService) {
        this.securityCookieService = securityCookieService;
    }

    public SecurityContext loadContext(HttpRequestResponseHolder requestResponseHolder) {
        HttpServletRequest request = requestResponseHolder.getRequest();
        CustomCookieSecurityContextRepository.SaveToCookieResponseWrapper response = new CustomCookieSecurityContextRepository.SaveToCookieResponseWrapper(requestResponseHolder.getResponse(), false);
        requestResponseHolder.setResponse(response);
        SecurityContext context = SecurityContextHolder.createEmptyContext();
        if(request.getCookies() != null) {
            Cookie securityCookie = this.securityCookieService.getSecurityCookieFrom(request);
            if(securityCookie != null) {
                Authentication authentication = this.securityCookieService.getAuthenticationFrom(securityCookie);
                if(authentication == null || authentication.getPrincipal().equals("anonymousUser")) {
                    Cookie cookie = this.securityCookieService.createLogoutCookie();
                    requestResponseHolder.getResponse().addCookie(cookie);
                }

                context.setAuthentication(authentication);
                return context;
            }
        }

        return context;
    }

    public void saveContext(SecurityContext context, HttpServletRequest request, HttpServletResponse response) {
        CustomCookieSecurityContextRepository.SaveToCookieResponseWrapper responseWrapper = (CustomCookieSecurityContextRepository.SaveToCookieResponseWrapper)response;
        if(!responseWrapper.isContextSaved()) {
            responseWrapper.saveContext(context);
        }

    }

    public boolean containsContext(HttpServletRequest request) {
        return this.securityCookieService.containsSecurityCookie(request);
    }

    final class SaveToCookieResponseWrapper extends SaveContextOnUpdateOrErrorResponseWrapper {
        public SaveToCookieResponseWrapper(HttpServletResponse response, boolean disableUrlRewriting) {
            super(response, disableUrlRewriting);
        }

        protected void saveContext(SecurityContext context) {

            Cookie securityCookie = CustomCookieSecurityContextRepository.this.securityCookieService.createSecurityCookie(context.getAuthentication());
            if(securityCookie != null) {
                if(!this.isContextSaved()) {
                    this.addCookie(securityCookie);
                }
            } else {
                this.addCookie(CustomCookieSecurityContextRepository.this.securityCookieService.createLogoutCookie());
            }

        }
    }
}
