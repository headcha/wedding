package com.seolgi.wedding.invitation.api.gift.guest;

import com.seolgi.wedding.core.gift.Gift;
import com.seolgi.wedding.core.guest.Guest;
import com.seolgi.wedding.core.invitation.wedding.Wedding;
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
