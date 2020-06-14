package eggMail;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public static void main(String[] args) throws UnsupportedEncodingException {
		Properties props = new Properties();
		String host = System.getenv("EGGOBASE_EMAIL_HOST");
		String port = System.getenv("EGGOBASE_EMAIL_PORT");
		String sender = System.getenv("EGGOBASE_EMAIL_SENDER");
		String senderPrettyName = System.getenv("EGGOBASE_EMAIL_SENDER_PRETTY_NAME");
		String senderPw = System.getenv("EGGOBASE_EMAIL_SENDER_PW");
		
		props.setProperty("mail.host", host);
		props.setProperty("mail.smtp.port", port);
		props.setProperty("mail.smtp.auth", "true");

		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(sender, senderPw);
			}

		};

		Session session = Session.getDefaultInstance(props, auth);

		Message msg = new MimeMessage(session);
		
		System.out.println("Sending email...");
		
		try {
			msg.setSubject("Hello from the Eggobase!");
			msg.setText("You are 100% egg!");
			msg.setFrom(new InternetAddress(sender, senderPrettyName));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress("jason.brewer101@gmail.com"));
			Transport.send(msg);
		} catch (UnsupportedEncodingException | MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
