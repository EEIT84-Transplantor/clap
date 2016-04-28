package shopping.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;
import payment.model.CreditCardService;
import payment.model.CreditCardVO;
import product.model.ProductVO;
import shopping.model.CartService;
import shopping.model.CartVO;
import shopping.model.OrderDetailService;
import shopping.model.OrderDetailVO;
import shopping.model.OrderFormService;
import shopping.model.OrderFormVO;

public class OneClickBuyAction extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	private SessionFactory sessionFactory;
	private HttpSession session;
	private CartVO cartVO;
	private CartService cartService;
	private CreditCardService creditCardService;
	private OrderDetailService orderDetailService;
	private OrderFormService orderFormService;

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public OrderFormService getOrderFormService() {
		return orderFormService;
	}

	public void setOrderFormService(OrderFormService orderFormService) {
		this.orderFormService = orderFormService;
	}

	public OrderDetailService getOrderDetailService() {
		return orderDetailService;
	}

	public OneClickBuyAction() {
	}

	public void setCartVO(CartVO cartVO) {
		this.cartVO = cartVO;
	}

	public CreditCardService getCreditCardService() {
		return creditCardService;
	}

	public void setCreditCardService(CreditCardService creditCardService) {
		this.creditCardService = creditCardService;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}

	public CartVO getCartVO() {
		return cartVO;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		session = request.getSession();

	}

	@Override
	public String execute() throws Exception {

		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		if (memberVO != null) {
			// 會員信箱
			String email = memberVO.getEmail();
			cartVO.setEmail(email);
			// 放入購物車
			cartService.setCart(cartVO);
			// 取出
			List<Map<String, String>> maps = cartService.getCartList(email);
			// 算總額
			Double total = 0.0;
			for (Map<String, String> map : maps) {
				String temp1 = map.get("price");
				String temp2 = map.get("quantity");
				Double price = Double.parseDouble(temp1);
				Double quantity = Double.parseDouble(temp2);
				total += price * quantity;
			}
			session.setAttribute("total", total);
		}
		return SUCCESS;
	}
}
