package shopping.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;
import shopping.model.CartService;

public class DeleteCartAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private CartService cartService;

	private String productid;

	@Override
	public String execute() throws Exception {
		String email = ((MemberVO) request.getSession().getAttribute("login")).getEmail();
		cartService.removeCart(email, Integer.parseInt(productid));
		return super.execute();
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
