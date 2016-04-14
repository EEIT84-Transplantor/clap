package shopping.controller;

import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import payment.model.CreditCardService;
import shopping.model.OrderFormService;

public class CheckOutAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private HttpSession session;
	private CreditCardService creditCardService;
	private OrderFormService orderFormService;
	private String productArray;
	private String promoTitle;

	public CreditCardService getCreditCardService() {
		return creditCardService;
	}

	public void setCreditCardService(CreditCardService creditCardService) {
		this.creditCardService = creditCardService;
	}

	public OrderFormService getOrderFormService() {
		return orderFormService;
	}

	public void setOrderFormService(OrderFormService orderFormService) {
		this.orderFormService = orderFormService;
	}

	public String getPromoTitle() {
		return promoTitle;
	}

	public void setPromoTitle(String promoTitle) {
		this.promoTitle = promoTitle;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
		session = request.getSession();
	}

	public String getProductArray() {
		return productArray;
	}

	public void setProductArray(String productArray) {
		this.productArray = productArray;
	}

	@Override
	public String execute() throws Exception {
		
		
		String[] productArray = request.getParameterValues("productArray[]");
		System.out.println(productArray[0]);
		System.out.println(productArray[1]);
		System.out.println(productArray[2]);
		
		JSONObject object = new JSONObject("{"+productArray+"}");
		System.out.println(object);
		System.out.println(promoTitle);

		// MemberVO memberVO = (MemberVO) session.getAttribute("login");
		// List<CreditCardVO> creditCardList =
		// creditCardService.getCards(memberVO.getEmail());
		//
		// request.setAttribute("creditCardList", creditCardList);
		// request.setAttribute("total", total);
		return super.execute();
	}

}
