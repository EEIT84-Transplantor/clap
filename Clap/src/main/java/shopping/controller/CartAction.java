package shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.mail.handlers.multipart_mixed;

import inventory.model.InventoryService;
import member.model.MemberVO;
import payment.model.PromoCodeService;
import payment.model.PromoVO;
import product.model.ProductVO;
import shopping.model.CartService;
import shopping.model.CartVO;

public class CartAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private HttpSession session;
	private CartService cartService;
	private PromoCodeService promoCodeService;
	private InventoryService inventoryService;

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public PromoCodeService getPromoCodeService() {
		return promoCodeService;
	}

	public void setPromoCodeService(PromoCodeService promoCodeService) {
		this.promoCodeService = promoCodeService;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
		session = request.getSession();
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	@Override
	public String execute() throws Exception {
		List<Map<String, Object>> cartList = new ArrayList<>();
		List<PromoVO> promoList;
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		
		//判斷是否登入
		if (memberVO != null) {
			List<CartVO> cartVOs = cartService.getCart("caca@gmail.com");
			for (CartVO cartVO : cartVOs) {
				Map<String, Object> map = new HashMap<String, Object>();
				ProductVO productVO = cartVO.getProductVO();
				map.put("name", productVO.getName());
				map.put("quantity", cartVO.getQuantity());
				map.put("price", productVO.getPrice());
				map.put("stock", inventoryService.getQuantity(productVO.getId()));
				cartList.add(map);
			}
			promoList = promoCodeService.getPromos("caca@gmail.com");
			request.setAttribute("cartList", cartList);
			request.setAttribute("promoList", promoList);
		} 
		return SUCCESS;
	}

}
