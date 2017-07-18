package com.seolgi.wedding.pc_web.api.invitation.wedding;


import com.seolgi.wedding.pc_web.api.couple.CoupleForm;
import com.seolgi.wedding.pc_web.api.family.FamilyForm;
import com.seolgi.wedding.pc_web.api.gallery.GalleryForm;
import com.seolgi.wedding.pc_web.api.gift.GiftForm;
import com.seolgi.wedding.pc_web.api.schedule.ScheduleForm;
import com.seolgi.wedding.pc_web.api.story.StoryForm;
import com.seolgi.wedding.core.account.Account;
import com.seolgi.wedding.core.invitation.wedding.Wedding;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
public class WeddingForm {
    private int id;
    private String city;
    private String country;
    private String location;
    private String title;
    private Date dateTime;
    private String introduction;
    private String greetings;
    private String giftSmsGreetings;
    private String imageUrl;
    private GalleryForm gallery;
    private float latitude;
    private float longitude;
    private String hallImageUrl;
    private String url;
    private boolean enable;
    private List<FamilyForm> families = new ArrayList<>();
    private List<CoupleForm> couples = new ArrayList<>();
    private List<ScheduleForm> schedules = new ArrayList<>();
    private List<StoryForm> stories = new ArrayList<>();
    private List<GiftForm> gifts = new ArrayList<>();
    public Wedding create(Account account) {

        Wedding wedding = Wedding.builder()
                .id(this.id)
                .url(this.url)
                .account(account)
                .giftSmsGreetings(giftSmsGreetings)
                .enable(this.enable)
                .city(this.city)
                .greetings(this.greetings)
                .location(this.location)
                .hallImageUrl(this.hallImageUrl)
                .couples(new ArrayList<>())
                .schedules(new ArrayList<>())
                .families(new ArrayList<>())
                .stories(new ArrayList<>())
                .gifts(new ArrayList<>())
                .weddingDate(this.dateTime)
                .country(this.country)
                .title(this.title)
                .latitude(this.latitude)
                .longitude(this.longitude)
                .introduction(this.introduction)
                .imageUrl(this.imageUrl)
                .build();

        wedding.addGallery(gallery.create(wedding));
        families.forEach(familyForm -> wedding.addFamily(familyForm.create(wedding)));
        gifts.forEach(giftForm -> wedding.addGift(giftForm.create(wedding)));
        couples.forEach(coupleForm -> wedding.addCouple(coupleForm.create(wedding)));
        schedules.forEach(scheduleForm -> wedding.addSchedule(scheduleForm.create(wedding)));
        stories.forEach(storyForm -> wedding.addStory(storyForm.create(wedding)));
        return wedding;
    }
}
