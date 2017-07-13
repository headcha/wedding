package com.cha.kim.wedding.admin.api.account;

import com.cha.kim.wedding.admin.api.exceptionHandler.exception.ApplicationException;
import com.cha.kim.wedding.core.account.Account;
import com.cha.kim.wedding.core.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/account")
public class AccountApiController {
    @Autowired
    private AccountService accountService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity singUpProcess(@RequestBody  AccountForm accountForm) {

        if (accountForm.isNotValid())
            throw new ApplicationException(accountForm.getErrorMessage());

        Account newUser = accountForm.create(passwordEncoder);

        if (accountService.isExistsUser(newUser))
            throw new ApplicationException("존재하는 ID 입니다.");

        accountService.add(newUser);

        return ResponseEntity.ok().build();
    }
}
