package com.cha.kim.wedding.core.guest;

import com.cha.kim.wedding.core.gift.Gift;
import com.cha.kim.wedding.core.gift.GiftService;
import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import com.cha.kim.wedding.core.invitation.wedding.WeddingService;
import com.cha.kim.wedding.core.util.sms.Sms;
import com.cha.kim.wedding.core.util.sms.SmsSender;
import com.fasterxml.jackson.core.JsonProcessingException;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
