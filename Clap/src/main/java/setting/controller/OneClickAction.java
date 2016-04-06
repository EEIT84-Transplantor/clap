package setting.controller;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberDAOHibernate;
import member.model.MemberService;
import member.model.MemberVO;
import payment.model.PromoService;

public class OneClickAction extends ActionSupport {

	private String email;
	private String phone;
	private Integer id;
	private String number;
	private Boolean oneclick;
	private MemberService memberService;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public Boolean getOneclick() {
		return oneclick;
	}

	public void setOneclick(Boolean oneclick) {
		this.oneclick = oneclick;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public String execute() throws Exception {
		memberService.setOneClick(email, phone, id, number, oneclick);
		return SUCCESS;
	}

}
