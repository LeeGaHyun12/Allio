package data.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

public interface MailServiceInter {
    // 이메일 메시지 생성 메서드
    MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException;

    // 인증 키 생성 메서드
    String createKey();

    // 간단한 이메일 메시지 전송 메서드
    String sendSimpleMessage(String to) throws Exception;
}
