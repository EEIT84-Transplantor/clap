package setting.controller;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberDAOHibernate;
import member.model.MemberService;
import member.model.MemberVO;

public class OnClickAction extends ActionSupport {

	private MemberVO memberVO;
	private MemberService memberService;
	private MemberDAOHibernate memberDAOHibernate;

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setMemberDAOHibernate(MemberDAOHibernate memberDAOHibernate) {
		this.memberDAOHibernate = memberDAOHibernate;
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

}
