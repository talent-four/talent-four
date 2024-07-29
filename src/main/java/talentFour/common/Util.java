package talentFour.common;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Util {

	// 개행 문자-> <br> 변경 메소드
	public static String newLineHandling(String content) {		
		return content.replaceAll("(\r\n|\n\r|\n|\r)", "<br>");
		//textarea의 엔터 : \r\n
		// \r : 캐리지 리턴(첫 번째로 돌아가기)
		// \n : new line(다음줄로 이동)
	}
	
	// Cross Site Scripting(XSS , 크로스 사이트 스크립팅) 공격 방지 메소드
	public static String XSSHandling(String content) {
		content = content.replaceAll("&", "&amp;"); // 제일 위로가야함.. 순서 중요 <h1>
		content = content.replaceAll("<", "&lt;"); // &lt;h1> 
		content = content.replaceAll(">", "&gt;"); // &lt;h1&gt;
		content = content.replaceAll("\"", "&quot;"); 
		
		return content;
	}
	
	// HTML 표기를 위한, XSS 해제
	public static String unescapeXSS(String content) {
	    content = content.replaceAll("&quot;", "\"");
	    content = content.replaceAll("&gt;", ">");
	    content = content.replaceAll("&lt;", "<");
	    content = content.replaceAll("&amp;", "&");
	    
	    return content;
	}


	// PW 인코딩 메소드
	public static String encodingPw(String pw) {
		
		// 매개변수 pw는 암호화 되기 전 비밀번호
		
		String encryptPw = null; // 암호화 된 비밀번호를 저장
		
		// 1. 해시 함수를 수행할 객체를 참조할 변수 선언
		MessageDigest md = null;
		
		try {
			
			// 2. SHA-512방식의 해시 함수를 수행할 수 있는 객체를 얻어옴
			md = MessageDigest.getInstance("SHA-512");
			
			// 3. md를 이용해서 암호화를 진행할 수 있도록 pw를 byte[] 형태로 변환(2진법으로 변환)
			byte[] bytes = pw.getBytes(Charset.forName("UTF-8"));
										 // 인코딩 utf-8이라 감안해서 인코딩하라는 뜻
			// 4. 암호화 진행 -> 암호화 결과가 md 내부에 저장됨
			md.update(bytes);
			
			// 5. 암호화 된 비밀번호를 encryptPw에 대입 
			// -> byte[] 을 String으로 변환해야함
			//    Base64 : byte 코드를 문자열로 변환하는 객체
			encryptPw = Base64.getEncoder().encodeToString(md.digest());
			
			System.out.println("암호화 전 : " + pw);
			
			System.out.println("암호화 후 : " + encryptPw);
			
		} catch(NoSuchAlgorithmException e) {
			// SHA-512 해시 함수가 존재하지 않을 때 예외 발생
			e.printStackTrace();
		}
		
		return encryptPw;
	}

    public static String getClientIdFromQuery(String query) {
        if (query != null) {
            String[] params = query.split("&");
            for (String param : params) {
                String[] keyValue = param.split("=");
                if (keyValue.length == 2 && "clientId".equals(keyValue[0])) {
                    return keyValue[1];
                }
            }
        }
        return null;
    }
	
	
}
