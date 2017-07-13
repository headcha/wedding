package com.cha.kim.wedding.core.family;

import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "family")
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Family {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 10)
    private String type;

    @Column(length = 10)
    private String name;

    @Column
    private String imageUrl;

    @Column(length = 5000)
    private String letter;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "weddingId" , referencedColumnName = "id")
    private Wedding wedding;

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createDate;

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(insertable = false)
    private Date updateDate;

}
