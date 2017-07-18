package com.seolgi.wedding.invitation.api.visitor;


import com.seolgi.wedding.core.invitation.wedding.Wedding;
import com.seolgi.wedding.core.visit.Visitor;
import lombok.Getter;

@Getter
public class VisitorForm {
    private int weddingId;

    public Visitor create(String sessionId) {
        return Visitor.builder().wedding(Wedding.builder().id(weddingId).build()).sessionId(sessionId).build();
    }
}
