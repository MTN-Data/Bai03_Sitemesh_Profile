package vn.iotstar.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

    private static final String FROM_EMAIL =
            System.getenv("OTP_EMAIL");

    private static final String APP_PASSWORD =
            System.getenv("OTP_EMAIL_PASSWORD");

    public static boolean sendOtp(String toEmail, String otp) {

        if (FROM_EMAIL == null || APP_PASSWORD == null) {
            System.out.println("Chua cau hinh email gui OTP");
            return false;
        }

        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(
                props,
                new Authenticator() {

                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {

                        return new PasswordAuthentication(
                                FROM_EMAIL,
                                APP_PASSWORD
                        );
                    }
                }
        );

        try {

            Message message = new MimeMessage(session);

            message.setFrom(
                    new InternetAddress(FROM_EMAIL)
            );

            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toEmail)
            );

            message.setSubject(
                    "Ma OTP kich hoat tai khoan"
            );

            message.setText(
                    "Ma OTP kich hoat tai khoan cua ban la: "
                            + otp
                            + "\n\nMa OTP co hieu luc trong 5 phut."
            );

            Transport.send(message);

            System.out.println(
                    "GUI OTP THANH CONG DEN: " + toEmail
            );

            return true;

        } catch (MessagingException e) {

            System.out.println("GUI OTP THAT BAI");
            e.printStackTrace();

            return false;
        }
    }
}

   