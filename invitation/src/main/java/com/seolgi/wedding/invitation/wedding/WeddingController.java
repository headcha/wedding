package com.seolgi.wedding.invitation.wedding;

import com.seolgi.wedding.core.gift.Gift;
import com.seolgi.wedding.core.gift.GiftService;
import com.seolgi.wedding.core.invitation.wedding.Wedding;
import com.seolgi.wedding.core.invitation.wedding.WeddingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/")
public class WeddingController {
    @Autowired
    private WeddingService weddingService;

    @Autowired
    private GiftService giftService;

    @RequestMapping(method = RequestMethod.GET , value = "{url}")
    public String get(@PathVariable String url , Model model) {

        Wedding wedding = weddingService.findOneByUrl(url);

        if (wedding == null)
            return "error/404";

        List<Gift> gifts = giftService.findListByWeddingId(wedding.getId());


        model.addAttribute("wedding" , DisplayWedding.create(wedding , gifts));
        return "wedding/home";
    }
}
