package com.cha.kim.wedding.core.visit;

import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "visitor")
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Visitor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 100 , nullable = false)
    private String sessionId;


    @ManyToOne(optional = false , fetch = FetchType.LAZY)
    @JoinColumn(name = "weddingId", nullable = false)
    private Wedding wedding;

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createDateTime;
}


