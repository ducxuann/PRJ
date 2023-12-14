/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;



import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;


public class SendMail {
    
    public String generateOTP() 
    {  //int randomPin declared to store the otp
        //since we using Math.random() hence we have to type cast it int
        //because Math.random() returns decimal value
        String otp;
        int randomPin   =(int) (Math.random()*9000)+1000;
        otp  = String.valueOf(randomPin);
        return otp; //returning value of otp
    }

    public boolean send(AccountRg arg) {
        boolean test = false;
        String toEmail = arg.getEmail();
        String username = "hieutlthe161328@fpt.edu.vn";
        String password = "idlnsrquwgkkeucn";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS


        Session session = Session.getInstance(prop,
                new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toEmail)
            );
            message.setSubject("Verification Account");
            message.setText("Register successfully. Please verify your account using the code: "+arg.getOtp());

            Transport.send(message);
            
            test = true;
            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return test;
    }

}
