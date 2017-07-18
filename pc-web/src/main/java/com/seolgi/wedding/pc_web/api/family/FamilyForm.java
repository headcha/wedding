package com.seolgi.wedding.pc_web.api.family;

import com.seolgi.wedding.core.family.Family;
import com.seolgi.wedding.core.invitation.wedding.Wedding;
import lombok.Getter;


@Getter
public class FamilyForm {
    private int id;

    private String type;

    private String name;

    private String imageUrl;

    private String letter;

    public Family create(Wedding wedding) {
        Family family = Family.builder()
                .id(id)
                .type(type)
                .name(name)
                .imageUrl(imageUrl)
                .letter(letter)
                .wedding(wedding)
                .build();

        return family;
    }
}
