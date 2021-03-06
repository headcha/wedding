package com.seolgi.wedding.core.schedule;


import com.seolgi.wedding.core.invitation.wedding.Wedding;
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
    @ManyToOne (optional = false)
    @JoinColumn(name = "weddingId", nullable = false)
    private Wedding wedding;
}
