package setting.controller;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;

public class OnClickAction extends ActionSupport{

	private MemberVO memberVO;
	
	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String execute() throws Exception {
		System.out.println(123);
		return super.execute();
	}

}
