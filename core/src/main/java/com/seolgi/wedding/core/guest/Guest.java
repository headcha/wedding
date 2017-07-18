package com.seolgi.wedding.core.guest;

import com.seolgi.wedding.core.gift.Gift;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "guest")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Guest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 20 , nullable = false)
    private String phoneNumber;

    @Column(length = 50 , nullable = false)
    private String name;

    @Column(length = 1000 , nullable = false)
    private String message;

    @Column(length = 100)
    private String sessionId;

    @ManyToOne
    @JoinColumn(name = "giftId" , referencedColumnName = "id")
    private Gift gift;

    @Column
    private long price;

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createDate;

    public void merge(Guest guest) {
        this.sessionId = guest.getSessionId();
    }
}
