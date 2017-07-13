package com.cha.kim.wedding.web.api.share;

import com.cha.kim.wedding.core.share.ShareService;
import com.cha.kim.wedding.web.common.UniqueSessionId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
