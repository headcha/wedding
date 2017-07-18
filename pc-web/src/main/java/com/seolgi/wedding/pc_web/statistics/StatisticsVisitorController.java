package com.seolgi.wedding.pc_web.statistics;

import com.seolgi.wedding.pc_web.api.invitation.wedding.DisplayWedding;
import com.seolgi.wedding.pc_web.context.AccountContext;
import com.seolgi.wedding.core.invitation.wedding.Wedding;
import com.seolgi.wedding.core.invitation.wedding.WeddingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/statistics/visitor")
public class StatisticsVisitorController {
    @Autowired
    private WeddingService weddingService;

    @Autowired
    private AccountContext accountContext;

    @RequestMapping(method = RequestMethod.GET , value = "/{id}")
    public String index(@PathVariable int id , Model model) {
        Wedding wedding = weddingService.findOneByIdAndAccountId(id , accountContext.getLoggedAccount().getId());

        if (wedding == null)
            return "error/404";

        model.addAttribute("wedding" , DisplayWedding.create(wedding));
        return "statistics/visitor";
    }
}
