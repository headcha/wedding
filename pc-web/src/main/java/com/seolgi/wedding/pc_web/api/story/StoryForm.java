package com.seolgi.wedding.pc_web.api.story;

import com.seolgi.wedding.core.invitation.wedding.Wedding;
import com.seolgi.wedding.core.story.Story;
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
