package com.seolgi.wedding.core.guest;

import com.seolgi.wedding.core.invitation.wedding.Wedding;
import com.seolgi.wedding.core.invitation.wedding.WeddingService;
import com.seolgi.wedding.core.util.sms.Sms;
import com.seolgi.wedding.core.util.sms.SmsSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class GuestService {
    @Autowired
    private GuestRepository guestRepository;

    @Autowired
    private WeddingService weddingService;

    public void add(Guest guest) {

        guestRepository.save(guest);

        Wedding wedding = weddingService.findOneByUrl(guest.getGift().getWedding().getUrl());
        SmsSender.send(Sms.builder().from(wedding.getAccount().getPhoneNumber()).toList(guest.getPhoneNumber()).message(wedding.getGiftSmsGreetings()).build());
    }
}
