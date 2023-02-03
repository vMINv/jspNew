package smtp;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;

public class SendMail {
	public static void sending(String id, String name) {
		Map<String, String> emailInfo = new HashMap<String, String>();
		emailInfo.put("from", "hyunmin04050@gmail.com");
		emailInfo.put("to", id);
		emailInfo.put("subject", "회원가입을 환영합니다.");
		emailInfo.put("content", name + "님 저희 사이트에 가입해주셔서 감사합니다.");//내용
		emailInfo.put("format", "text/html;charset=UTF-8");//메일의 형식
		
		try {
			Mail smtpServer = new Mail();//메일 전송 객체 생성 
			smtpServer.emailSending(emailInfo);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
