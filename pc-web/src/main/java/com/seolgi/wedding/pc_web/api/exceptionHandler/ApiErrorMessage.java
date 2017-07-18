package com.seolgi.wedding.pc_web.api.exceptionHandler;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;

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
