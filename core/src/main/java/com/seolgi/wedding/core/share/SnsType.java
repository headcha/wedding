package com.seolgi.wedding.core.share;


public enum SnsType {
    FACEBOOK("FACEBOOK") , KAKAO_TALK("KAKAO_TALK") , KAKAO_STORY("KAKAO_STORY");

    private String value;

    SnsType(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
