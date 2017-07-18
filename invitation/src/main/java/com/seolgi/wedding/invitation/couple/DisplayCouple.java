package com.seolgi.wedding.invitation.couple;

import com.seolgi.wedding.core.couple.Couple;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.Delegate;
import org.apache.commons.lang3.StringUtils;

@Getter
public class DisplayCouple {
    @Delegate(excludes = Exclude.class)
    @Getter(AccessLevel.NONE)
    private Couple couple;

    public static DisplayCouple create(Couple couple) {
        DisplayCouple displayCouple = new DisplayCouple();
        displayCouple.couple = couple;
        return displayCouple;
    }


    private interface Exclude {
        String getIntroduction();
    }

    public String getIntroduction() {
        if (couple == null)
            return StringUtils.EMPTY;

        if (StringUtils.isEmpty(couple.getIntroduction()))
            return StringUtils.EMPTY;
        return this.couple.getIntroduction().replace("\n", "<br>");
    }
}
