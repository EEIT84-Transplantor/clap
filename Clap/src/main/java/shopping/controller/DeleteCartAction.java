package shopping.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;
import product.model.ProductVO;
import shopping.model.CartService;

public class DeleteCartAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private CartService cartService;

	private String productid;
	private InputStream inputStream;

	
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Override
	public String execute() throws Exception {

		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("login");
		if (memberVO != null) {
			String email = memberVO.getEmail();
			Boolean check = cartService.removeCart(email, Integer.parseInt(productid));
			//calculate total cart (not yet)
			try {
				inputStream  = new ByteArrayInputStream(check.toString().getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}	
			
		} else {
			Hashtable<Integer, Integer> temp = (Hashtable<Integer, Integer>)request.getSession().getAttribute("tempCart");
			Integer deleteIndex = 0;
			for(Integer i:temp.keySet()){
				
				if(Integer.parseInt(productid) == i){
					deleteIndex = i;
					
				}
			}
			temp.remove(deleteIndex);
			Integer totalCart = 0;
			for(Integer integer :temp.keySet()){
				totalCart += temp.get(integer);				
			}
			System.out.println("totalCart:  "+totalCart);
			request.getSession().setAttribute("totalCart", totalCart);
			request.getSession().setAttribute("tempCart", temp);
			try {
				inputStream  = new ByteArrayInputStream(totalCart.toString().getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}			
		}
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
