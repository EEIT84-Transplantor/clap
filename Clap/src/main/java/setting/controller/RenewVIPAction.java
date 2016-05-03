package setting.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.junit.runner.Request;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberService;
import member.model.MemberVO;
import payment.model.CreditCardService;

public class RenewVIPAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private CreditCardService creditCardService;
	private MemberService memberService;

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

	@Override
	public String execute() throws Exception {
		
		
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("login");
		// 扣款
		if (creditCardService.payBill(memberVO, CreditCardService.vip)) {
			// 設定vip expire
			memberService.updateVIP(memberVO, 12);
			request.setAttribute("pay", super.getText("pay.success"));
		} else {
			request.setAttribute("pay", super.getText("pay.failure"));
		}

		return SUCCESS;
	}

}
