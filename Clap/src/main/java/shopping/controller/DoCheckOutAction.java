package shopping.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberService;
import member.model.MemberVO;
import payment.model.CreditCardService;
import shopping.model.CartService;
import shopping.model.CartVO;
import shopping.model.OrderDetailService;
import shopping.model.OrderFormService;

public class DoCheckOutAction extends ActionSupport implements ServletRequestAware {

	private OrderFormService orderFormService;
	private OrderDetailService orderDetailService;
	private CartService cartService;
	private MemberService memberService;
	private HttpSession session;
	private HttpServletRequest request;

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
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

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	@Override
	public String execute() throws Exception {

		// 計算購物金
		Integer total = (Integer) session.getAttribute("total");
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		String email = memberVO.getEmail();
		Double amount = memberService.getAmount(email);
		if (total > amount) {
			memberService.setAmount(email, 0.0);
		} else {
			memberService.setAmount(email, amount - total);
		}

		 // 成功後新增一筆訂單
		 Integer orderform_id = orderFormService.setOrderForm(total, email);
		
		 // 新增訂單明細 清空購物車
		 List<CartVO> cardList = cartService.getCart(email);
		 for (CartVO cardVO : cardList) {
		 orderDetailService.setOrderDetail(orderform_id,cardVO);
		 }
		 cartService.removeCart(email);

		return super.execute();
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		
		this.request= request;
		session = request.getSession();

	}

}
