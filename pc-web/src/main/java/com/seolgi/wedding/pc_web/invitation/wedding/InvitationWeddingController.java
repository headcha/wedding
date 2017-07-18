package com.seolgi.wedding.pc_web.invitation.wedding;


import com.seolgi.wedding.pc_web.api.invitation.wedding.DisplayWedding;
import com.seolgi.wedding.pc_web.context.AccountContext;
import com.seolgi.wedding.core.invitation.wedding.Wedding;
import com.seolgi.wedding.core.invitation.wedding.WeddingService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("/{id}")
    public String form(@PathVariable int id ,  Model model) {
        Wedding wedding = weddingService.findOneByIdAndAccountId(id , accountContext.getLoggedAccount().getId());

        if (wedding == null)
            return "error/404";

        model.addAttribute("wedding" , DisplayWedding.create(wedding));
        return "invitation/wedding/index";
    }

    @RequestMapping(method = {RequestMethod.POST, RequestMethod.GET} , value = "/preview/{skinName}")
    public String preview(String previewJsonValue, @PathVariable String skinName, Model model) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        WeddingPreviewForm weddingPreviewForm = objectMapper.readValue(StringEscapeUtils.unescapeHtml(previewJsonValue), WeddingPreviewForm.class);
        weddingPreviewForm.previewGenerate();
        model.addAttribute("weddingPreviewForm", weddingPreviewForm);

        return "invitation/wedding/preview/" + skinName;
    }
}
