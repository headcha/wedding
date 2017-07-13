package com.cha.kim.wedding.admin.api.couple;

import com.cha.kim.wedding.core.couple.Couple;
import com.cha.kim.wedding.core.couple.SexType;
import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import lombok.Getter;

@Getter
public class CoupleForm {
    private int id;
    private String name;
    private String introduction;
    private String imageUrl;
    private String sexType;

    public Couple create(Wedding wedding) {
        return Couple.builder()
                .id(this.id)
                .imageUrl(this.imageUrl)
                .name(this.name)
                .introduction(this.introduction)
                .sexType(SexType.valueOf(sexType))
                .wedding(wedding).build();
    }
}
