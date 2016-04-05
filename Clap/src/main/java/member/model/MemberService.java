package member.model;

import java.io.File;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Map;
import java.util.function.IntPredicate;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import antlr.collections.List;
import member.model.MemberVO;
import member.model.email.EmailconfirmCode;
import member.model.email.SendEmail;

public class MemberService {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		MemberService ms = (MemberService) context.getBean("memberService");
		System.out.println(ms.login("andrew@gmail.com", "andrew".getBytes()));
	}

	private MemberDAO dao;
	private SendEmail sendEmail;

	public MemberService() {
	}

	public void setSendEmail(SendEmail sendEmail) {
		this.sendEmail = sendEmail;
	}

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	public MemberVO login(String email, byte[] password) {
		MemberVO result = null;
		MemberVO member = dao.selectByEmail(email);

		if (member != null) {
			byte[] temp = password;
			byte[] memberPassword = member.getPassword();

			if (Arrays.equals(temp, memberPassword)) {
				result = member;
			}
		}
		return result;
	}

	public void signUp(String email, String password) {
		if (findByEmail(email) == null) {
			dao.insert(email, password.getBytes());
		} else {
			dao.update(email, password.getBytes());
		}
	}

	public boolean changePassword(String email, byte[] oldPassword, String newPassword) {
		boolean result = false;
		if (this.login(email, oldPassword) != null) {
			result = dao.update(email, newPassword.getBytes());
		}
		return result;
	}

	public String sendComfirmEmail(String email) {
		Map<String, String> sendingInfo = sendEmail.sendEmail(email);
		String resultMessage = sendingInfo.get("resultMessage"); // sending
																	// Message(successful
																	// or
																	// failed)
		return resultMessage;
	}

	public MemberVO findByEmail(String email) {
		MemberVO member = dao.selectByEmail(email);
		return member;
	}

	public boolean checkConfirmCode(String email, String confirmCode) {
		String codeFromLink = confirmCode; // full string got from parameter
											// "cfr"
		return sendEmail.checkingConfirmCode(email, codeFromLink);
	}
	
	//如果有新圖片就改成新圖片、如果是null就不改
	//如果有新圖片就改成新圖片、如果是null就不改
	public boolean updateSetting(MemberVO memberVO,byte[] newpassword, File photo) {
		
		return false;
	}
	
	
	//如果oneclick是true就update所有資料、如果是false就只update onclick
	public boolean setOneClick (String email, String phone, Integer id, String number, Boolean oneclick){
		return false;
	}

}
