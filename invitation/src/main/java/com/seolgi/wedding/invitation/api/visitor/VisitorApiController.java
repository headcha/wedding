package com.seolgi.wedding.invitation.api.visitor;

import com.seolgi.wedding.core.visit.VisitorService;
import com.seolgi.wedding.invitation.common.UniqueSessionId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/visitor")
public class VisitorApiController {
    @Autowired
    private VisitorService visitorService;
    @RequestMapping(method = RequestMethod.PUT)
    public void add(@RequestBody VisitorForm visitorForm , @CookieValue(name = UniqueSessionId.KEY) String sessionId) {
        visitorService.add(visitorForm.create(sessionId));
    }
}
