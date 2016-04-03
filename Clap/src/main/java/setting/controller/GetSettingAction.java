package setting.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberService;

public class GetSettingAction extends ActionSupport implements ServletRequestAware{
	
	private MemberService memberService;
	private HttpServletRequest request;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

	public String execute() {
		request.setAttribute("login", memberService.findByEmail("poan@gmail.com"));
		return SUCCESS;
		
	}




}
