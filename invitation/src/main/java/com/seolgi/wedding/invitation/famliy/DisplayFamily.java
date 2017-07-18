package com.seolgi.wedding.invitation.famliy;

import com.seolgi.wedding.core.family.Family;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.Delegate;
import org.apache.commons.lang3.StringUtils;

@Getter
public class DisplayFamily {
    @Delegate(excludes = Exclude.class)
    @Getter(AccessLevel.NONE)
    private Family family;

    private interface Exclude {
        String getLetter();
    }

    public static DisplayFamily create(Family family) {
        DisplayFamily displayFamily = new DisplayFamily();
        displayFamily.family = family;
        return displayFamily;
    }

    public String getLetter() {
        if (StringUtils.isEmpty(family.getLetter()))
            return StringUtils.EMPTY;
        return this.family.getLetter().replace("\n", "<br>");
    }
}
