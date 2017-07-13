package com.cha.kim.wedding.admin.invitation.wedding;


import com.cha.kim.wedding.admin.api.invitation.wedding.DisplayWedding;
import com.cha.kim.wedding.admin.auth.Authority;
import com.cha.kim.wedding.admin.context.AccountContext;
import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import com.cha.kim.wedding.core.invitation.wedding.WeddingService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;

@Controller
@RequestMapping("/invitation/wedding")

public class InvitationWeddingController {

    @Autowired
    private WeddingService weddingService;

    @Autowired
    private AccountContext accountContext;

    @Secured({Authority.USER})
    @RequestMapping(method = RequestMethod.GET , value = "{id}")
    public String form(@PathVariable int id ,  Model model) {
        Wedding wedding = weddingService.findOneByIdAndAccountId(id , accountContext.getLoggedAccount().getId());

        if (wedding == null)
            return "error/404";

        model.addAttribute("wedding" , DisplayWedding.create(wedding));
        return "invitation/remind/index";
    }

    @Secured({Authority.USER})
    @RequestMapping(method = {RequestMethod.POST, RequestMethod.GET} , value = "/preview/{skinName}")
    public String preview(String previewJsonValue, @PathVariable String skinName, Model model) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        WeddingPreviewForm weddingPreviewForm = objectMapper.readValue(StringEscapeUtils.unescapeHtml(previewJsonValue), WeddingPreviewForm.class);
        weddingPreviewForm.previewGenerate();
        model.addAttribute("weddingPreviewForm", weddingPreviewForm);

        return "invitation/wedding/preview/" + skinName;
    }
}
