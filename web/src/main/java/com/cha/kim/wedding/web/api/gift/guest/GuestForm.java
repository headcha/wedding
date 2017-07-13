package com.cha.kim.wedding.web.api.gift.guest;

import com.cha.kim.wedding.core.gift.Gift;
import com.cha.kim.wedding.core.guest.Guest;
import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import lombok.Getter;

@Getter
public class GuestForm {
    private int giftId;
    private String name;
    private String phoneNumber;
    private String message;
    private long price;
    private int weddingId;
    private String weddingUrl;

    public Guest create(String sessionId) {
        Wedding wedding = Wedding.builder().id(weddingId).url(weddingUrl).build();
        return Guest.builder()
                .name(name)
                .gift(Gift.builder().id(giftId).wedding(wedding).build())
                .price(price)
                .message(message)
                .sessionId(sessionId)
                .phoneNumber(phoneNumber.replaceAll("[^0-9]", ""))
                .build();
    }
}
