package com.cha.kim.wedding.core.account;

import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Builder
@Entity(name = "account")
@NoArgsConstructor
@AllArgsConstructor
public class Account {
    @Id
    @Column(length = 50 , unique = true , nullable = false)
    private String id;
    @Column(length = 100 , nullable = false)
    private String password;
    @Column(length = 20 , nullable = false)
    private String phoneNumber;

    @Column(length = 30 , nullable = false)
    private String name;
    @Column
    private boolean termsOfServiceConfirm;
    @Column
    private boolean privacyPolicyConfirm;

    @OneToMany(mappedBy = "account" , cascade = CascadeType.ALL , fetch = FetchType.LAZY)
    private List<Wedding> weddings = new ArrayList<>();

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createDate;

    @UpdateTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(insertable = false)
    private Date updateDate;
}
