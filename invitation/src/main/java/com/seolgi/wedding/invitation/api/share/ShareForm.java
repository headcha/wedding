package com.seolgi.wedding.invitation.api.share;

import com.seolgi.wedding.core.invitation.wedding.Wedding;
import com.seolgi.wedding.core.share.Share;
import com.seolgi.wedding.core.share.SnsType;
import lombok.Getter;

@Getter
public class ShareForm {
    private String snsType;
    private int weddingId;

    public Share create(String sessionId) {
        return Share.builder().wedding(Wedding.builder().id(weddingId).build()).snsType(SnsType.valueOf(snsType)).sessionId(sessionId).build();
    }
}
