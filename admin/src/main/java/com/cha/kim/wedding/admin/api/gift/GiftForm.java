package com.cha.kim.wedding.admin.api.gift;

import com.cha.kim.wedding.core.gift.Gift;
import com.cha.kim.wedding.core.invitation.wedding.Wedding;
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
