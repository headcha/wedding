package com.cha.kim.wedding.core.schedule;


import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "schedule")
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(length = 50 , nullable = false)
    private String title;
    @Column(nullable = false)
    private Date localDateTime;
    @Column(length = 200)
    private String introduction;

    @Column(length = 255)
    private String imageUrl;
    @JsonIgnore
    @ManyToOne (optional = false)
    @JoinColumn(name = "weddingId", nullable = false)
    private Wedding wedding;
}
