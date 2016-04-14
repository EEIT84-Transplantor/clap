package shopping.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;
import shopping.model.OrderFormService;

public class OrderFormAction extends ActionSupport implements ServletRequestAware {

	private OrderFormService orderFormService;
	private HttpServletRequest request;

	
	
	public OrderFormService getOrderFormService() {
		return orderFormService;
	}

	public void setOrderFormService(OrderFormService orderFormService) {
		this.orderFormService = orderFormService;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	@Override
	public String execute() throws Exception {
		// 提供orderFormList
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("login");
		String email = memberVO.getEmail();
		request.setAttribute("orderList", orderFormService.getOrderList(email));
		return super.execute();
	}

}
