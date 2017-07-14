package com.cha.kim.wedding.core.share;

import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "share")
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Share {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 50)
    private String sessionId;

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createDate;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private SnsType snsType;

    @ManyToOne(optional = false , fetch = FetchType.LAZY)
    @JoinColumn(name = "weddingId" , referencedColumnName = "id" , nullable = false)
    private Wedding wedding;
}
