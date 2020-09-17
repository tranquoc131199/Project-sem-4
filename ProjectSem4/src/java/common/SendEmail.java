/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Acer Nitro 5
 */
public class SendEmail {

    public static void sendMail(String recipent, String subject, String message) throws AddressException, MessagingException {
        // set cac thuoc tinh
        Properties properties = new Properties();
        properties.put("mail.smtp.host", EmailInfo.HOST_NAME);
        properties.put("mail.smtp.port", EmailInfo.SMTP_PORT);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.user", EmailInfo.MY_EMAIL);
        properties.put("mail.passwword", EmailInfo.MY_PASSWORD);

        // tạo 1 session để xác thực mail gửi
        Authenticator auth = new Authenticator() {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailInfo.MY_EMAIL, EmailInfo.MY_PASSWORD);
            }
        };
        Session session = Session.getInstance(properties, auth);
        // tạo một mail mới
        MimeMessage msg = new MimeMessage(session);
        msg.setHeader("Context-Type", "text/plain; charset=UTF-8");
        msg.setFrom(new InternetAddress(EmailInfo.MY_EMAIL));
        InternetAddress[] toAddresses = {new InternetAddress(recipent)};
        msg.setRecipients(javax.mail.Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject, "UTF-8");
        msg.setSentDate(new Date());
        msg.setContent(message, "text/html; charset=utf-8");

        // gửi mail
        Transport.send(msg);
    }
}
