package com.seolgi.wedding.core.util.validator;

import com.seolgi.wedding.core.util.PasswordUtil;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


public class PasswordValidator implements ConstraintValidator<CheckPassword, String> {

    public void initialize(CheckPassword constraintAnnotation) {

    }

    public boolean isValid(String value, ConstraintValidatorContext constraintContext) {
        return PasswordUtil.isValid(value);
    }
}
