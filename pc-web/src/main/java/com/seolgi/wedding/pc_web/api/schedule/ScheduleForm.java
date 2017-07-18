package com.seolgi.wedding.pc_web.api.schedule;

import com.seolgi.wedding.core.invitation.wedding.Wedding;
import com.seolgi.wedding.core.schedule.Schedule;
import lombok.Getter;

import java.util.Date;

@Getter
public class ScheduleForm {
    private int id;
    private String title;
    private String introduction;
    private String imageUrl;
    private Date dateTime;

    public Schedule create(Wedding wedding) {
        return Schedule.builder()
                .wedding(wedding)
                .id(this.id)
                .title(this.title)
                .introduction(this.introduction)
                .imageUrl(this.imageUrl)
                .localDateTime(dateTime)
                .build();
    }
}
