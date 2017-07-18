package com.seolgi.wedding.invitation.gift;

import com.seolgi.wedding.core.gift.Gift;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.Delegate;

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
