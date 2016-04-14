package shopping.controller;

import java.io.ByteArrayInputStream;
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

public class SetCartAction extends ActionSupport implements ServletRequestAware{
    private CartVO cartVO;
    private CartService cartService;
    private HttpServletRequest request;
    private InputStream inputStream;
    private HttpSession session;
    
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
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		List<CartVO> temp = null;
		Integer totalCart = 0;
	
		Integer quantity = cartVO.getQuantity();
		if(quantity==null||quantity==0){
			quantity = 1;
		}
		
		if(member!=null){
			//會員
			cartVO.setEmail(member.getEmail());
			cartVO.setQuantity(quantity);
			cartService.updateCart(cartVO);
			temp = cartService.getCart(member.getEmail());
			
			for(CartVO vo:temp){
				totalCart += vo.getQuantity();
			}
		}else{
			Map<Integer,Integer> tempCart =null;
			
			if(session.getAttribute("tempCart")!=null){
				try {
					
					tempCart = (Map<Integer,Integer>) session.getAttribute("tempCart");
					
					if(tempCart.get(cartVO.getProduct_id())!=null){
						Integer temps = quantity+tempCart.get(cartVO.getProduct_id());
						tempCart.put(cartVO.getProduct_id(), temps);
					}else{
						
						tempCart.put(cartVO.getProduct_id(), quantity);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
				tempCart = new HashMap<Integer, Integer>();
				session.setAttribute("tempCart", tempCart);
				tempCart.put(cartVO.getProduct_id(), quantity);
			}
			for(Integer integer :tempCart.keySet()){
				totalCart += tempCart.get(integer);
			}
		}
		inputStream = new ByteArrayInputStream(totalCart.toString().getBytes("UTF-8"));
	
		return SUCCESS;
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
