package com.seolgi.wedding.invitation.story;

import com.seolgi.wedding.core.story.Story;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.Delegate;
import org.apache.commons.lang3.StringUtils;

@Getter
public class DisplayStory {
    @Delegate(excludes = Exclude.class)
    @Getter(AccessLevel.NONE)
    private Story story;

    private interface Exclude {
        String getDescription();
    }

    public static DisplayStory create(Story story) {
        DisplayStory displayStory = new DisplayStory();
        displayStory.story = story;
        return displayStory;
    }

    public String getDescription() {
        if (StringUtils.isEmpty(story.getDescription()))
            return StringUtils.EMPTY;
        return this.story.getDescription().replace("\n", "<br>");
    }
}
