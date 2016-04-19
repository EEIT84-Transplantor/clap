package shopping.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import payment.model.CreditCardPK;
import payment.model.CreditCardService;
import payment.model.CreditCardVO;

//判斷信用卡是否有效 回傳true false
public class SetCreditCardAction extends ActionSupport implements ServletRequestAware {

	private InputStream inputStream;
	private CreditCardService creditCardService;
	private HttpServletRequest request;
	private String mb_email;
	private String cc_number;
	private String cc_goodthru;
	private String cc_cvv;

	public String getCc_number() {
		return cc_number;
	}

	public void setCc_number(String cc_number) {
		this.cc_number = cc_number;
	}

	public String getCc_goodthru() {
		return cc_goodthru;
	}

	public void setCc_goodthru(String cc_goodthru) {
		this.cc_goodthru = cc_goodthru;
	}

	public String getCc_cvv() {
		return cc_cvv;
	}

	public void setCc_cvv(String cc_cvv) {
		this.cc_cvv = cc_cvv;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public CreditCardService getCreditCardService() {
		return creditCardService;
	}

	public void setCreditCardService(CreditCardService creditCardService) {
		this.creditCardService = creditCardService;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	@Override
	public String execute() throws Exception {
		CreditCardPK creditCardPK = new CreditCardPK();
		creditCardPK.setCc_number(cc_number);
		creditCardPK.setMb_email(mb_email);
		CreditCardVO creditCardVO = new CreditCardVO();
		creditCardVO.setCreditCardPK(creditCardPK);
		creditCardVO.setCc_goodthru(cc_goodthru);
		creditCardVO.setCc_cvv(cc_cvv);

		creditCardService.setCard(creditCardVO);
		inputStream = new ByteArrayInputStream("true".getBytes("UTF-8"));
		return super.execute();
	}

}
