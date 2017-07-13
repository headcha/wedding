package com.cha.kim.wedding.admin.api.story;

import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import com.cha.kim.wedding.core.story.Story;
import lombok.Getter;

import java.util.Date;

@Getter
public class StoryForm {
    private int id;
    private String title;
    private String description;
    private String imageUrl;
    private Date storyDate;
    private int orderIndex;
    public Story create(Wedding wedding) {
        return Story.builder()
                .wedding(wedding)
                .id(this.id)
                .orderIndex(this.orderIndex)
                .title(this.title)
                .description(this.description)
                .imageUrl(this.imageUrl)
                .storyDate(storyDate)
                .build();
    }
}
