package com.seolgi.wedding.pc_web.api.account;

import org.junit.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class AccountFormTest {

    @Test
    public void testIsValid() {
        AccountForm accountForm = AccountForm.builder().id("headcha@naver.com").password("ckwjdgus1").name("차정현").phoneNumber("010-6702-1755").privacyPolicyConfirm(true).termsOfServiceConfirm(true).build();
        assertThat(accountForm.isNotValid()).isFalse();
    }
}