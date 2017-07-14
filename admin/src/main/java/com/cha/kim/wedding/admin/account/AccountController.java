package com.cha.kim.wedding.admin.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/account")
public class AccountController {

    @GetMapping(value = "/signup")
    public String signup() {
        return "account/signup";
    }


}
