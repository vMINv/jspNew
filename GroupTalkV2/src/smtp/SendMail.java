package smtp;

import java.util.HashMap;
import java.util.Map;

public class SendMail {

	public static void sending(String id, String name) {

		Map<String, String> emailInfo = new HashMap<String, String>();
		
		emailInfo.put("from", "austiny@naver.com"); //보내는 사람 , 변동 불가, 반드시 본인의 네이버 메일주소
		emailInfo.put("to", id); //받는 사람
		emailInfo.put("subject", "회원 가입을 축하합니다.");// 메일 제목
		emailInfo.put("content", name + "님 저희 사이트에 가입해 주셔서 감사합니다.");// 메일 내용
		
		emailInfo.put("format", "text/plain;charset=UTF-8");// 메일의 형식을 설정 일단 text 로 고정

		try {
			NaverSMTP smtpServer = new NaverSMTP(); //메일 전송 객체 생성
			smtpServer.emailSending(emailInfo);

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
