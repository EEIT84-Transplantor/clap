package service;

import java.util.Arrays;
import java.util.function.IntPredicate;

import dao.MemberDAO;
import dao.MemberJdbcDAO;
import model.MemberVO;

public class MemberService {
	private MemberDAO dao;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MemberService ms= new MemberService();
		System.out.println(ms.login("andrew@gmail.com", "andrew"));
	}
	
	public MemberService(){
		dao = new MemberJdbcDAO();
	}
	
	public MemberVO login (String email, String password){
		MemberVO result=null;
		MemberVO member = dao.selectByEmail(email);
		if (member!= null){
			byte[] temp = password.getBytes();
			byte[] memberPassword = member.getPassword();
			if (Arrays.equals(temp, memberPassword)){
				result = member;
			}
		}
		return result;
	}
//	public MemberVO signUp (String email, String password) {
//		
//	}

	public boolean changePassword (String email, String password) {
		return dao.update(email, password.getBytes());
	}

//	public boolean sendComfirmEmail (String email){
//		
//	}

	public MemberVO findByEmail (String email){
		MemberVO member = dao.selectByEmail(email);
		return member;
	}

}
