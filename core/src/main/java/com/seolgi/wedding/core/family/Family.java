package com.seolgi.wedding.core.family;

import com.seolgi.wedding.core.invitation.wedding.Wedding;
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
