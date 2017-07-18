package com.seolgi.wedding.invitation.api.gift.guest;

import com.seolgi.wedding.core.guest.GuestService;
import com.seolgi.wedding.invitation.common.UniqueSessionId;
import com.fasterxml.jackson.core.JsonProcessingException;
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
