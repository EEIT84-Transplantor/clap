package shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;
import payment.model.PromoCodeService;
import payment.model.PromoVO;
import shopping.model.CartService;
import shopping.model.CartVO;

public class CartAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private HttpSession session;
	private CartService cartService;
	private PromoCodeService promoCodeService;

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		session = request.getSession();
	}

	@Override
	public String execute() throws Exception {
		List<CartVO> cartList;
		List<PromoVO> promoList;
		MemberVO memberVO = (MemberVO) session.getAttribute("login");

		if (memberVO != null) {
			cartList = cartService.getCart(memberVO.getEmail());
			promoList = promoCodeService.getPromos(memberVO.getEmail());
		} else {
			cartList = (List<CartVO>) session.getAttribute("cartList");
			promoList = (List<PromoVO>) session.getAttribute("promoList");
		}

		request.setAttribute("cartList", cartList);
		request.setAttribute("promoList", promoList);
		return SUCCESS;
	}

}
