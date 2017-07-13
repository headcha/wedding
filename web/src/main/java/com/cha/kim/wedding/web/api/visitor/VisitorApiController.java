package com.cha.kim.wedding.web.api.visitor;

import com.cha.kim.wedding.core.visit.Visitor;
import com.cha.kim.wedding.core.visit.VisitorService;
import com.cha.kim.wedding.web.common.UniqueSessionId;
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
