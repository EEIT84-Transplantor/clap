package simulator.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;
import shopping.model.CartService;
import shopping.model.CartVO;

public class AddToCartAction extends ActionSupport implements ServletRequestAware {
	private List<CartVO> productList;
	private CartService cartService;
	private HttpServletRequest request;
	private HttpSession session;
	private Integer totalCart;

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public List<CartVO> getProductList() {
		return productList;
	}

	public void setProductList(List<CartVO> productList) {
		this.productList = productList;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		session = request.getSession();
	}

	public String execute() {
		MemberVO memberVO = (MemberVO) request.getAttribute("login");
		totalCart = 0;
		
		if (memberVO != null) {
			List<CartVO> temp = null;
			for (CartVO cartVO : productList) {
				cartVO.setEmail(memberVO.getEmail());
				cartVO.setQuantity(1);
				temp = cartService.getCart(memberVO.getEmail());
			}
			for (CartVO vo : temp) {
				totalCart += vo.getQuantity();
			}
		} else {
			Map<Integer, Integer> tempCart = null;

			if (session.getAttribute("tempCart") != null) {
				try {
					tempCart = (Map<Integer, Integer>) session.getAttribute("tempCart");
					for (CartVO cartVO : productList) {
						if (tempCart.get(cartVO.getProduct_id()) != null) {
							Integer temps = 1 + tempCart.get(cartVO.getProduct_id());
							tempCart.put(cartVO.getProduct_id(), temps);
						} else {

							tempCart.put(cartVO.getProduct_id(), 1);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				for (CartVO cartVO : productList) {
					tempCart = new HashMap<Integer, Integer>();
					session.setAttribute("tempCart", tempCart);
					tempCart.put(cartVO.getProduct_id(), 1);
				}
			}
			for (Integer integer : tempCart.keySet()) {
				totalCart += tempCart.get(integer);
				session.setAttribute("totalCart", totalCart);
			}
		}

		return SUCCESS;

	}

	public Integer getTotalCart() {
		return totalCart;
	}

	public void setTotalCart(Integer totalCart) {
		this.totalCart = totalCart;
	}

}
