package com.seolgi.wedding.invitation.api.share;

import com.seolgi.wedding.core.share.ShareService;
import com.seolgi.wedding.invitation.common.UniqueSessionId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/share")
public class ShareApiController {
    @Autowired
    private ShareService shareService;

    @RequestMapping(method = RequestMethod.PUT)
    public void add(@RequestBody ShareForm shareForm , @CookieValue(name = UniqueSessionId.KEY) String sessionId) {
        shareService.add(shareForm.create(sessionId));
    }
}
