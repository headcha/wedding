package com.cha.kim.wedding.admin.interceptor.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cha.kim.wedding.admin.context.AccountContext;

/**
 * Created by 1002610 on 15. 9. 22..
 */
@Slf4j
public class LoggedUserInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private AccountContext accountContext;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        request.setAttribute("loggedUser", accountContext.getLoggedAccount());
        return super.preHandle(request, response, handler);
    }
}