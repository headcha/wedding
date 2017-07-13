package com.cha.kim.wedding.admin.context;

import com.cha.kim.wedding.core.account.Account;
import com.cha.kim.wedding.core.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;


@Component
public class AccountContext {
    @Autowired
    private AccountService accountService;

    public Account getLoggedAccount() {
        return getAccount();
    }

    private Account getAccount() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String customerId = authentication.getName();
        return accountService.findOneById(customerId);
    }
}