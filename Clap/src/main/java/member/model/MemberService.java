package member.model;

import java.util.Arrays;
import java.util.Map;
import java.util.function.IntPredicate;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import member.model.MemberVO;
import member.model.email.EmailconfirmCode;
import member.model.email.SendEmail;

public class MemberService {
	private MemberDAO dao;
	private SendEmail sendEmail;

	public void setSendEmail(SendEmail sendEmail) {
		this.sendEmail = sendEmail;
	}

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		MemberService ms = (MemberService) context.getBean("memberService");
//		System.out.println(ms.login("lala@gmail.com", "lala"));
		System.out.println(ms.login("andrew@gmail.com", "andrew"));
	}

	public MemberService() {

	}

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	public MemberVO login(String email, String password) {
		MemberVO result = null;
		MemberVO member = dao.selectByEmail(email);
		if (member != null) {
			byte[] temp = password.getBytes();
			byte[] memberPassword = member.getPassword();
			if (Arrays.equals(temp, memberPassword)) {
				result = member;
			}
		}
		return result;
	}


	public MemberVO signUp (String email, String password) {

		return dao.insert(email, password.getBytes());
	}


	public boolean setPassword(String email, String password) {
		return dao.update(email, password.getBytes());

	}
	public boolean changePassword(String email, String oldPassword, String newPassword){
		boolean result = false;
		if(this.login(email, oldPassword)!=null){
			result = dao.update(email, newPassword.getBytes());
		}
		return result;
	}

	public String sendComfirmEmail(String email) {
		Map<String, String> sendingInfo = sendEmail.sendEmail(email);
		String resultMessage = sendingInfo.get("resultMessage");
		return resultMessage;
	}

	public MemberVO findByEmail(String email) {
		MemberVO member = dao.selectByEmail(email);
		return member;
	}
	
	public boolean checkConfirmCode (String email, String confirmCode){
		String codeFromLink = confirmCode;
		return sendEmail.checkingConfirmCode(email, codeFromLink);
	}

}
