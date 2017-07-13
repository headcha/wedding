package com.cha.kim.wedding.admin.api.exceptionHandler;


import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.cha.kim.wedding.admin.api.AdminApiApplication;

@ControllerAdvice (basePackageClasses = AdminApiApplication.class)
public class RestResponseEntityExceptionHandler extends ResponseEntityExceptionHandler {

    public RestResponseEntityExceptionHandler() {
        super();
    }

    /**
     * 500 error
     * @param ex
     * @return error message json
     */
    @ExceptionHandler({Exception.class , RuntimeException.class})
    @ResponseBody
    public ResponseEntity handleInvalidRequest(Exception ex) {
        ex.printStackTrace();
        logger.error("InvalidResponseForApiException", ex);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity(ApiErrorMessage.create(ex.getMessage()) , headers , HttpStatus.INTERNAL_SERVER_ERROR);
    }
}