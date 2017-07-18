package com.seolgi.wedding.core.util.sms;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.HashMap;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Sms {
    private String from;
    private String toList;
    private String message;

    public HashMap<String, String> createMessage() {
        HashMap<String, String> params = new HashMap<>();
        params.put("to", toList); // 수신번호
        params.put("from", from); // 발신번호
        params.put("type", MessageType.LMS.getType()); // Message type ( SMS, LMS, MMS, ATA )
        params.put("text", message); // 문자내용

        return params;
    }
}
