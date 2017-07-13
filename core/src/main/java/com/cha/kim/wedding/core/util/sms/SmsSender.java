package com.cha.kim.wedding.core.util.sms;


import com.fasterxml.jackson.core.JsonProcessingException;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SmsSender {
    public static void send(Sms sms)  {
        Message message = new Message("NCS57A021B18D599" ,"D67A7C54C698A159F6D3C1DE37899351");
        try {
            message.send(sms.createMessage());
        } catch (CoolsmsException e) {
            throw new RuntimeException(e);
        }
    }
}
