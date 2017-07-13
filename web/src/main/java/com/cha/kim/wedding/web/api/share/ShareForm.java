package com.cha.kim.wedding.web.api.share;

import com.cha.kim.wedding.core.invitation.wedding.Wedding;
import com.cha.kim.wedding.core.share.Share;
import com.cha.kim.wedding.core.share.SnsType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;

import javax.persistence.*;

@Getter
public class ShareForm {
    private String snsType;
    private int weddingId;

    public Share create(String sessionId) {
        return Share.builder().wedding(Wedding.builder().id(weddingId).build()).snsType(SnsType.valueOf(snsType)).sessionId(sessionId).build();
    }
}
