package shopping.controller;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;
import payment.model.CreditCardVO;
import shopping.model.CartVO;
import shopping.model.OrderDetailService;
import shopping.model.OrderDetailVO;
import shopping.model.OrderFormVO;

public class OneClickBuyAction extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	private SessionFactory sessionFactory;
	private HttpSession session;
	private CartVO cartVO;
	private CreditCardVO creditCardVO;
	private OrderDetailService orderDetailService;
	private OrderFormVO orderFormVO;

	public OneClickBuyAction() {
	}

	public void setCartVO(CartVO cartVO) {
		this.cartVO = cartVO;
		System.out.println(cartVO.getProduct_id());
	}

	public void setCreditCardVO(CreditCardVO creditCardVO) {
		this.creditCardVO = creditCardVO;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}

	public CartVO getCartVO() {
		return cartVO;
	}

	public void setOrderFormVO(OrderFormVO orderFormVO) {
		this.orderFormVO = orderFormVO;
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
	
		MemberVO memberVO = (MemberVO)session.getAttribute("login");
		if(memberVO==null){
			//導回登入夜面
		}
         System.out.println(cartVO.getProduct_id()+","+cartVO.getQuantity());

		
		return SUCCESS;
	}
}
