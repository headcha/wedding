package com.seolgi.wedding.core.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService {
    @Autowired
    private AccountRepository accountRepository;
    public Account findOneById(String id) {
        return accountRepository.findOne(id);
    }


    public void add(Account newUser) {
        this.accountRepository.save(newUser);
    }

    public boolean isExistsUser(Account account) {
        return this.accountRepository.exists(account.getId());
    }

    public long count() {
        return accountRepository.count();
    }
}
