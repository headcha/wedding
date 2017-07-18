package com.seolgi.wedding.core.util.sms;

enum MessageType {
    SMS("SMS"), LMS("LMS"), MMS("MMS"), ATA("ATA");

    private String type;

    MessageType(String type) {
        this.type = type;
    }

    public String getType() {
        return this.type;
    }

}