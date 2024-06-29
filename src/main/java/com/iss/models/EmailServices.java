package com.iss.models;

import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailServices {

    private String username, password, host, port;

    public EmailServices(String username, String password, String host, String port) {
        this.username = username;
        this.password = password;
        this.host = host;
        this.port = port;
    }

    public String messageContent(Customers customer) {
        return "Dear " + customer.getName() + ",\r\n"
                + "\r\n"
                + "We are excited to welcome you to InnovativeCarRentals!\r\n"
                + "\r\n"
                + "Thank you for registering with us. Your account has been successfully created, and you are now a valued member of our community. Here are your registration details:\r\n"
                + "\r\n"
                + "Username: " + customer.getUsername() + "\r\n"
                + "Email: " + customer.getEmailAddress() + "\r\n"
                + "\r\n"
                + "What’s Next?\r\n"
                + "Explore Our Services:\r\n"
                + "Discover the wide range of services and products we offer by visiting our website at http://localhost:8080/CarRental/UserManual/Homepage.jsp.\r\n"
                + "\r\n"
                + "Personalize Your Profile:\r\n"
                + "Log in to your account to update your profile, set your preferences, and explore personalized features.\r\n"
                + "\r\n"
                + "Stay Updated:\r\n"
                + "Keep an eye on your inbox for exciting updates, special offers, and exclusive deals.\r\n"
                + "\r\n"
                + "Need Help?\r\n"
                + "If you have any questions or need assistance, our support team is here to help. Feel free to reach out to us at [Support Email] or call us at [Support Phone Number].\r\n"
                + "\r\n"
                + "Follow Us:\r\n"
                + "Stay connected and follow us on [Social Media Platforms] for the latest news and updates.\r\n"
                + "\r\n"
                + "We are thrilled to have you on board and look forward to providing you with the best possible experience.\r\n"
                + "\r\n"
                + "Best regards,\r\n"
                + "\r\n"
                + customer.getName() + "\r\n"
                + "New Login Successful\r\n"
                + "InnovativeCarRentals\r\n"
                + "7671040125\r\n"
                + "\r\n"
                + "Note: For your security, please do not share your login credentials with anyone. If you did not register for this account, please contact us immediately.\r\n"
                + "\r\n"
                + "";
    }

    public EmailServices() {
		super();
	}

	public void sendEmail(String toAddress, String subject, String messageContent) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress));
        message.setSubject(subject);
        message.setText(messageContent);
        
	    message.setReplyTo(InternetAddress.parse("no_reply@example.com", false));

	    message.setSentDate(new Date());
        

        Transport.send(message);

        System.out.println("Email sent successfully");
    }


    /*public static void main(String[] args) {
    String username = "your-email@example.com";
    String password = "your-email-password";
    String host = "smtp.example.com";
    String port = "587";

    EmailServices emailService = new EmailServices(username, password, host, port);
    try {
        emailService.sendEmail("mr.vikra.m7671@gmail.com", "Test Subject", "Test email message");
    } catch (MessagingException e) {
        e.printStackTrace();
    }
	}*/
}
