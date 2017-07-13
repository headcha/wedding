package com.cha.kim.wedding.admin.interceptor.commonCode;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CommonCodeInterceptor extends HandlerInterceptorAdapter {

    @Value("${admin.build.timestamp}")
    private String buildTimestamp;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        request.setAttribute("buildTimestamp", buildTimestamp);
        return super.preHandle(request, response, handler);
    }
}