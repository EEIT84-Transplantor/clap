package member.model;

import java.util.Arrays;
import java.util.function.IntPredicate;
import member.model.MemberVO;
import member.model.email.EmailconfirmCode;

public class MemberService {
	private MemberDAO dao;
	private EmailconfirmCode emailConfirm;

	public void setEmailConfirm(EmailconfirmCode emailConfirm) {
		this.emailConfirm = emailConfirm;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MemberService ms = new MemberService();
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

	public boolean changePassword(String email, String password) {
		return dao.update(email, password.getBytes());
	}

	 public boolean sendComfirmEmail (String email){
		 emailConfirm.generateEmailCfmCode(email);
		 
		 
		 return false;
	 }

	public MemberVO findByEmail(String email) {
		MemberVO member = dao.selectByEmail(email);
		return member;
	}

}
