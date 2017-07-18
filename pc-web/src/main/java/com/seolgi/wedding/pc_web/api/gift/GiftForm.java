package com.seolgi.wedding.pc_web.api.gift;

import com.seolgi.wedding.core.gift.Gift;
import com.seolgi.wedding.core.invitation.wedding.Wedding;
import lombok.Getter;

@Getter
public class GiftForm {
    private int id;

    private String imageUrl;

    private long price;

    private String name;


    public Gift create(Wedding wedding) {
        return Gift.builder()
                .id(this.id)
                .imageUrl(this.imageUrl)
                .price(this.price)
                .name(this.name)
                .wedding(wedding)
                .build();
    }
}
