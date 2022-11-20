package ego.wear.util;

import java.util.Date;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class SendMailUtil {
	public static final String MY_EMAIL = "lcao4568@gmail.com";
	public static final String MY_PASSWORD = "huqzgtiwfpyvznay";
	public static SendMailUtil sendmail;
	public static SendMailUtil getInstance() {
		if(sendmail != null ) {
			sendmail = new SendMailUtil();
		}
		return sendmail;
	}
	public SendMailUtil() {}
	public void sendRegisterSuccess(String emailReicieve) {
		String subject = "Đăng ký tài khoản Ego.wear";
		String content = "Chúc mừng bạn đăng ký tài khoản thành công";
		
		try {
			Email email = new SimpleEmail();
			email.setHostName("smtp.googlemail.com");
			email.setSmtpPort(587);
			email.setAuthenticator(new DefaultAuthenticator(MY_EMAIL, MY_PASSWORD));
			
			email.setSSLOnConnect(true);
			
			email.setFrom(MY_EMAIL);
			email.setSentDate(new Date(System.currentTimeMillis()));
			
			email.setCharset("UTF-8");
			email.setSubject(subject);
			
			email.setMsg(content);
			
			email.addTo(emailReicieve);
			email.send();
			System.out.println("Send..");
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			System.out.println("Fail...");
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		SendMailUtil sendMail = new SendMailUtil();
		sendMail.sendRegisterSuccess("ttruong4568@gmail.com");
	}
}
