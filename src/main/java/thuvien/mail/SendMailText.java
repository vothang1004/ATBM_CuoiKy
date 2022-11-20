package thuvien.mail;

import java.util.Date;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;

public class SendMailText {
	public static SendMailText sendMail = null;
	public static SendMailText getInstance() {
		if(sendMail == null) {
			sendMail = new SendMailText();
		}
		return sendMail;
	}
	public void sendRegisterSuccess(String emailReicieve, String userName) {
		String subject = "Đăng ký tài khoản Ego.Wear";
		String content = "Bạn đã đăng ký thành công tài khoản với tên đăng nhập là " + userName;
		try {
			 Email email = new SimpleEmail();

	           // Cấu hình thông tin Email Server
	           email.setHostName("smtp.googlemail.com");
	           email.setSmtpPort(465);
	           email.setAuthenticator(new DefaultAuthenticator(Constants.MY_EMAIL,
	                   Constants.MY_PASSWORD));
	           
	           // Với gmail cái này là bắt buộc.
	           email.setSSLOnConnect(true);
	           
	           // Người gửi
	           email.setFrom(Constants.MY_EMAIL);
	           email.setSentDate(new Date(System.currentTimeMillis()));
	           
	           // Tiêu đề
	           email.setCharset("UTF-8");
	           email.setSubject(subject);
	           
	           // Nội dung email
	           email.setMsg(content);
	           
	           // Người nhận
	           email.addTo(emailReicieve);    
	           email.send();
	           System.out.println("send...");
		} catch (Exception e) {
			System.out.println("faild...");
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		String email = "lcao4568@gmail.com";
		SendMailText.getInstance().sendRegisterSuccess(email, "vothang");
	}
}
