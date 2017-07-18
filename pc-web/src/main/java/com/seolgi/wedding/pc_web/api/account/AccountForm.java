package com.seolgi.wedding.pc_web.api.account;


import com.seolgi.wedding.core.account.Account;
import com.seolgi.wedding.core.util.validator.CheckPassword;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotNull;
import java.util.Set;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AccountForm {
    @NotNull(message = "아이디를 입력해주세요.")
    @Length(min = 8 , max = 50 , message = "아이디는 8자 이상 50자 이하로 구성해주세요.")
    @Email(message = "이메일 형식과 다릅니다.")
    private String id;

    @NotNull(message = "비밀번호를 입력해 주세요.")
    @Length(min = 8 , max = 30 , message = "비밀번호는 8자 이상 50자 이하로 구성해주세요.")
    @CheckPassword(message = "비밀번호는 영어(대/소문자)와 특수문자 또는 숫자를 조합하여 구성해주세요.")
    private String password;

    @NotNull(message = "전화번호를 입력해 주세요.")
    private String phoneNumber;

    @NotNull(message = "이름을 입력해 주세요.")
    private String name;

    @AssertTrue(message = "서비스 이용약관에 동의해 주세요.")
    private boolean termsOfServiceConfirm;

    @AssertTrue(message = "개인정보 취급방침 에 동의해 주세요.")
    private boolean privacyPolicyConfirm;

    private static Validator validator = Validation.buildDefaultValidatorFactory().getValidator();


    public Account create(PasswordEncoder passwordEncoder) {
        return Account.builder()
                    .id(this.id)
                    .password(passwordEncoder.encode(this.password))
                    .phoneNumber(this.phoneNumber)
                    .name(this.name)
                    .termsOfServiceConfirm(this.termsOfServiceConfirm)
                    .privacyPolicyConfirm(this.privacyPolicyConfirm)
                .build();
    }

    public boolean isNotValid() {
        Set<ConstraintViolation<AccountForm>> constraintViolations = validator.validate( this );
        return constraintViolations.isEmpty() == false;
    }

    public String getErrorMessage() {
        Set<ConstraintViolation<AccountForm>> constraintViolations = validator.validate( this );
        return constraintViolations.iterator().next().getMessage();
    }
}
