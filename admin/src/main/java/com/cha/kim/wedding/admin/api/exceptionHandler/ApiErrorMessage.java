package com.cha.kim.wedding.admin.api.exceptionHandler;

import lombok.Getter;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Created by 1002610 on 2016. 3. 3..
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
public class ApiErrorMessage {
    private String message;

    ApiErrorMessage(){}

    public static ApiErrorMessage create(String message) {
        ApiErrorMessage apiErrorMessage = new ApiErrorMessage();
        apiErrorMessage.message = message;
        return apiErrorMessage;
    }
}
