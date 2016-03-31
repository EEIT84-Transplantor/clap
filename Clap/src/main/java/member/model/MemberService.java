package member.model;

import java.util.Arrays;
import java.util.function.IntPredicate;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import member.model.MemberVO;

public class MemberService {
	private MemberDAO dao;

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		MemberService ms = (MemberService) context.getBean("memberService");

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
		return dao.insert(email, password.getBytes(),null,null);
	}

	public boolean changePassword(String email, String password) {
		return dao.update(email, password.getBytes(),null,null);
	}

	 public boolean sendComfirmEmail (String email){
		 
		 return false;
	 }

	public MemberVO findByEmail(String email) {
		MemberVO member = dao.selectByEmail(email);
		return member;
	}

}
