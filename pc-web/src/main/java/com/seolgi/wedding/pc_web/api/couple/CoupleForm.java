package com.seolgi.wedding.pc_web.api.couple;

import com.seolgi.wedding.core.couple.Couple;
import com.seolgi.wedding.core.couple.SexType;
import com.seolgi.wedding.core.invitation.wedding.Wedding;
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
