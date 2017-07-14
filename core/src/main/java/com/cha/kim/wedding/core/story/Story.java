package com.cha.kim.wedding.core.story;

import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "story")
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Story {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 100)
    private String title;

    @Column(length = 3)
    private int orderIndex;

    @Temporal(value = TemporalType.TIMESTAMP)
    @Column
    private Date storyDate;

    @Column(length = 400)
    private String description;
    @Column
    private String imageUrl;

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createAt;

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(insertable = false)
    private Date updateAt;

    @ManyToOne (optional = false)
    @JoinColumn(name = "weddingId", nullable = false)
    private Wedding wedding;


}
