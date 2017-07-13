package com.cha.kim.wedding.web.gift;

import com.cha.kim.wedding.core.gift.Gift;
import com.cha.kim.wedding.core.guest.Guest;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.Delegate;

import java.text.NumberFormat;

@Getter
public class DisplayGift {
    @Delegate
    @Getter(AccessLevel.NONE)
    private Gift gift;

    public static DisplayGift create(Gift gift) {
        DisplayGift displayGift = new DisplayGift();
        displayGift.gift = gift;
        return displayGift;
    }



}
