package com.cha.kim.wedding.web.api.visitor;


import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import com.cha.kim.wedding.core.visit.Visitor;
import lombok.Getter;

@Getter
public class VisitorForm {
    private int weddingId;

    public Visitor create(String sessionId) {
        return Visitor.builder().wedding(Wedding.builder().id(weddingId).build()).sessionId(sessionId).build();
    }
}
