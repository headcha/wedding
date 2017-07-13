package com.cha.kim.wedding.core.invitation.wedding;

import com.cha.kim.wedding.core.account.Account;
import com.cha.kim.wedding.core.couple.Couple;
import com.cha.kim.wedding.core.family.Family;
import com.cha.kim.wedding.core.gallery.Gallery;
import com.cha.kim.wedding.core.gift.Gift;
import com.cha.kim.wedding.core.schedule.Schedule;
import com.cha.kim.wedding.core.share.Share;
import com.cha.kim.wedding.core.story.Story;
import com.cha.kim.wedding.core.visit.Visitor;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity(name = "wedding")
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Wedding {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 255 , unique = true)
    private String url;

    @Column
    private boolean enable;

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createDate;

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(insertable = false)
    private Date updateDate;

    @Temporal(value = TemporalType.TIMESTAMP)
    @Column
    private Date weddingDate;

    @Column(length = 20)
    private String country;

    @Column(length = 20)
    private String city;

    @Column(length = 200)
    private String location;

    @Column
    private float latitude;

    @Column
    private float longitude;

    @Column(length = 255)
    private String hallImageUrl;

    @Column(length = 100, nullable = false)
    private String title;

    @Column(length = 1000 , nullable = false)
    private String introduction;
    @Column(length = 255)
    private String imageUrl;

    @Column(length = 1000)
    private String greetings;

    @Column(length = 1000)
    private String giftSmsGreetings;

    @OneToMany(mappedBy = "wedding" ,cascade = CascadeType.ALL , orphanRemoval = true)
    private List<Couple> couples = new ArrayList<>();

    @OneToMany(mappedBy = "wedding" ,cascade = CascadeType.ALL , orphanRemoval = true)
    private List<Family> families = new ArrayList<>();

    @OneToOne(mappedBy = "wedding" , cascade = CascadeType.ALL )
    private Gallery gallery = new Gallery();

    @OneToMany(mappedBy = "wedding" , cascade = CascadeType.ALL , orphanRemoval = true)
    private List<Schedule> schedules = new ArrayList<>();

    @OneToMany(mappedBy = "wedding" , cascade = CascadeType.ALL)
    private List<Share> shares = new ArrayList<>();

    @OneToMany(mappedBy = "wedding" , cascade = CascadeType.ALL , orphanRemoval = true)
    @OrderBy("orderIndex ASC")
    private List<Story> stories = new ArrayList<>();

    @OneToMany(mappedBy = "wedding" , cascade = CascadeType.ALL , orphanRemoval = true)
    private List<Gift> gifts = new ArrayList<>();

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accountId" , referencedColumnName = "id")
    private Account account = new Account();

    @OneToMany(mappedBy = "wedding" , fetch = FetchType.LAZY ,cascade = CascadeType.ALL)
    private List<Visitor> visitors = new ArrayList<>();

    public void addGallery(Gallery gallery) {
        this.gallery = gallery;
    }

    public void addCouple(Couple couple) {
        this.couples.add(couple);
    }


    public void addSchedule(Schedule schedule) {
        this.schedules.add(schedule);
    }

    public void updateEnable(boolean enable) {
        this.enable = enable;
    }

    public void addStory(Story story) {
        this.stories.add(story);
    }

    public void addGift(Gift gift) {
        this.gifts.add(gift);
    }

    public void addFamily(Family family) {
        this.families.add(family);
    }
}
