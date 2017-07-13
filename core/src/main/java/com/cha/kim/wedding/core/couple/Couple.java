package com.cha.kim.wedding.core.couple;

import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity(name = "couple")
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Couple {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 11)
    private int id;

    @Column(length = 20, nullable = false)
    private String name;
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private SexType sexType;
    @Column(length = 3, nullable = false)
    private int age;
    @Column(length = 1000, nullable = false)
    private String introduction;

    @Column(length = 15)
    private String cellPhone;

    @Column(length = 255)
    private String imageUrl;

    @JsonIgnore
    @ManyToOne(optional = false)
    @JoinColumn(name = "weddingId", nullable = false)
    private Wedding wedding;

    public boolean isEqualsTo(SexType sexType) {
        return this.sexType.equals(sexType);
    }
}
