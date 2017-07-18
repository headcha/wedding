package com.seolgi.wedding.pc_web.invitation;

import com.seolgi.wedding.pc_web.api.invitation.wedding.DisplayWedding;
import com.seolgi.wedding.pc_web.context.AccountContext;
import com.seolgi.wedding.core.account.AccountService;
import com.seolgi.wedding.core.invitation.wedding.WeddingService;
import com.seolgi.wedding.core.share.ShareService;
import com.seolgi.wedding.core.util.CollectionConverter;
import com.seolgi.wedding.core.visit.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
