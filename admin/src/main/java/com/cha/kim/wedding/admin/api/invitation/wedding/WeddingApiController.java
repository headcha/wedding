package com.cha.kim.wedding.admin.api.invitation.wedding;

import com.cha.kim.wedding.admin.api.exceptionHandler.exception.ApplicationException;
import com.cha.kim.wedding.admin.context.AccountContext;
import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import com.cha.kim.wedding.core.invitation.wedding.WeddingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/invitation/wedding")
public class WeddingApiController {

    @Autowired
    private WeddingService weddingService;

    @Autowired
    private AccountContext adminContext;

    @RequestMapping(method = RequestMethod.POST)
    public void update(@RequestBody WeddingForm form) {
        weddingService.save(form.create(adminContext.getLoggedAccount()));
    }

    @RequestMapping(method = RequestMethod.DELETE , value = "/{id}")
    public void delete(@PathVariable int id) {
        weddingService.delete(id);
    }

    @RequestMapping(method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<Wedding> create(@RequestBody WeddingForm form) {
        Wedding newWedding = form.create(adminContext.getLoggedAccount());

        if (weddingService.isExistByUrl(newWedding.getUrl()))
            throw new ApplicationException("이미 존재하는 URL 입니다.");

        Wedding saved = weddingService.save(newWedding);
        return ResponseEntity.ok(saved);
    }

    @RequestMapping(method = RequestMethod.POST , value = "/enable")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<Wedding> enable(@RequestBody WeddingForm form) {
        Wedding wedding = form.create(adminContext.getLoggedAccount());
        Wedding saved = weddingService.enable(wedding);
        return ResponseEntity.ok(saved);
    }
}
