package shopping.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;
import product.model.ProductVO;
import shopping.model.CartService;
import shopping.model.CartVO;

public class SetCartAction extends ActionSupport implements ServletRequestAware{
    private ProductVO productVO;
    private CartService cartService;
    private HttpServletRequest request;
    private InputStream inputStream;
    public InputStream getInputStream() {
        return inputStream;
    }
    public SetCartAction() {
	}
    
	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	@Override
	public String execute() throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("login");
		List<CartVO> result = null;
		String temp = request.getParameter("quantity");
		Integer quantity;
		if(temp==null||temp.length()==0){
			quantity = 1;
		}else{
			quantity = Integer.parseInt(temp);
		}
		Integer totalCart;
		if(member!=null){
			result = cartService.getCart(member.getEmail());
			cartService.setCart(member.getEmail(), productVO.getId(), quantity);
			totalCart = cartService.getCartList(member.getEmail()).size();
		}else{
			Map<Integer,Integer> tempCart;
			if(session.getAttribute("tempCart")!=null){
				tempCart = (Map<Integer,Integer>)session.getAttribute("tempCart");
			}else{
				tempCart = new HashMap<Integer, Integer>();
			}
			tempCart.put(productVO.getId(), quantity);
			session.setAttribute("tempCart", tempCart);
			totalCart = tempCart.size();
		}
		
		inputStream = new ByteArrayInputStream(totalCart.toString().getBytes("UTF-8"));
		System.out.println(inputStream);
		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}

}
