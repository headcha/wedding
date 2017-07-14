package com.cha.kim.wedding.admin.invitation;

import com.cha.kim.wedding.admin.api.invitation.wedding.DisplayWedding;
import com.cha.kim.wedding.admin.auth.Authority;
import com.cha.kim.wedding.admin.context.AccountContext;
import com.cha.kim.wedding.core.account.AccountService;
import com.cha.kim.wedding.core.guest.GuestService;
import com.cha.kim.wedding.core.invitation.wedding.WeddingService;
import com.cha.kim.wedding.core.share.ShareService;
import com.cha.kim.wedding.core.util.CollectionConverter;
import com.cha.kim.wedding.core.visit.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/invitation")
public class InvitationController {

    @Autowired
    private AccountContext adminContext;


    @Autowired
    private VisitorService visitorService;

    @Autowired
    private WeddingService weddingService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private ShareService shareService;

    @GetMapping
    public String form(Model model) {

        List<DisplayWedding> displayWeddings = CollectionConverter.getInstance().convert(adminContext.getLoggedAccount().getWeddings(), DisplayWedding.class, "create");

        for (DisplayWedding wedding : displayWeddings) {
            wedding.setAllVisitorCount(visitorService.countByWeddingId(wedding.getId()));
            wedding.setAllShareCount(shareService.countByWeddingId(wedding.getId()));
        }

        DisplayInvitation displayInvitation = DisplayInvitation.builder()
                .weddings(displayWeddings)
                .allInvitationCount(weddingService.count())
                .allVisitorCount(visitorService.count())
                .allAccountCount(accountService.count())
                .allShareCount(shareService.count())
                .build();

        model.addAttribute("invitation", displayInvitation);

        return "invitation/index";
    }
}
