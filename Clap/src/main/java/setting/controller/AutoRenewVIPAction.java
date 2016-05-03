package setting.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberService;
import member.model.MemberVO;
import payment.model.CreditCardService;

public class AutoRenewVIPAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private CreditCardService creditCardService;
	private MemberService memberService;
	private Boolean autorenew;

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	public void setCreditCardService(CreditCardService creditCardService) {
		this.creditCardService = creditCardService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public Boolean getAutorenew() {
		return autorenew;
	}

	public void setAutorenew(Boolean autorenew) {
		this.autorenew = autorenew;
	}

	@Override
	public String execute() throws Exception {
		
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("login");
		memberService.setAutoRenew(memberVO,autorenew);
		return "success";
	}

}
