package com.cha.kim.wedding.web.api.gift.guest;

import com.cha.kim.wedding.core.gift.Gift;
import com.cha.kim.wedding.core.gift.GiftService;
import com.cha.kim.wedding.core.guest.GuestService;
import com.cha.kim.wedding.core.util.sms.Sms;
import com.cha.kim.wedding.core.util.sms.SmsSender;
import com.cha.kim.wedding.core.util.sms.To;
import com.cha.kim.wedding.web.common.UniqueSessionId;
import com.fasterxml.jackson.core.JsonProcessingException;
import edu.emory.mathcs.backport.java.util.Arrays;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/gift/guest")
public class GuestApiController {
    @Autowired
    private GuestService guestService;

    @RequestMapping(method = RequestMethod.PUT)
    public void add(@RequestBody GuestForm guestForm , @CookieValue(name = UniqueSessionId.KEY) String sessionId) throws CoolsmsException, JsonProcessingException {

        guestService.add(guestForm.create(sessionId));

    }
}
