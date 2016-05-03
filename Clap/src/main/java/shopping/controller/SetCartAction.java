package shopping.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;
import shopping.model.CartService;
import shopping.model.CartVO;

public class SetCartAction extends ActionSupport implements ServletRequestAware {
	private CartVO cartVO;
	private CartService cartService;
	private HttpServletRequest request;
	private InputStream inputStream;
	private HttpSession session;
    private String action;

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public SetCartAction() {
	}

	public void setCartVO(CartVO cartVO) {
		this.cartVO = cartVO;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	@Override
	public String execute() throws Exception {
		
		HttpSession session = request.getSession();
		synchronized (session) {
			MemberVO member = (MemberVO) session.getAttribute("login");

			List<CartVO> temp = null;
			Integer totalCart = 0;

			Integer quantity = cartVO.getQuantity();
			if (quantity == null || quantity == 0) {
				quantity = 1;
			}

			if (member != null) {
				// 會員
				
			
				temp = cartService.getCart(member.getEmail());
				
				
				boolean isNew = true;
				for(CartVO tempcartVO:temp){
					if(tempcartVO.getProduct_id()==cartVO.getProduct_id()){
						quantity +=tempcartVO.getQuantity();
						cartService.updateCart(tempcartVO.getEmail(),tempcartVO.getProduct_id(),quantity);
						isNew = false;
						break;
					}
				}
				
				if(isNew){
					cartService.setCart(member.getEmail(), cartVO.getProduct_id(), quantity);
				}
			
				
				
				for (CartVO vo : cartService.getCart(member.getEmail())) {
					totalCart += vo.getQuantity();
				}
			} else {
				Map<Integer, Integer> tempCart = null;

				if (session.getAttribute("tempCart") != null) {
					try {

						tempCart = (Map<Integer, Integer>) session.getAttribute("tempCart");
						Integer temp_quantity = tempCart.get(cartVO.getProduct_id());
						if ( temp_quantity != null) {
							Integer temps =  temp_quantity + quantity;
							tempCart.put(cartVO.getProduct_id(), temps);
							
						} else {

							tempCart.put(cartVO.getProduct_id(), quantity);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					tempCart = new Hashtable<Integer, Integer>();
					session.setAttribute("tempCart", tempCart);
					tempCart.put(cartVO.getProduct_id(), quantity);
				}
				for (Integer integer : tempCart.keySet()) {
					totalCart += tempCart.get(integer);
					session.setAttribute("totalCart", totalCart);
				}
			}
			
			inputStream = new ByteArrayInputStream(totalCart.toString()
					.getBytes("UTF-8"));
			
			return SUCCESS;
		}

	}

	public CartVO getCartVO() {
		return cartVO;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		session = request.getSession();
	}

}
