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
			cartVO.setQuantity(1);
		}
		
		if(member!=null){
			//會員
			cartVO.setEmail(member.getEmail());
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
					tempCart.put(cartVO.getProduct_id(), cartVO.getQuantity());
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
				tempCart = new HashMap<Integer, Integer>();
				session.setAttribute("tempCart", tempCart);
				tempCart.put(cartVO.getProduct_id(), cartVO.getQuantity());
			}
			for(Integer integer :tempCart.keySet()){
				totalCart += tempCart.get(integer);
			}
		}
		System.out.println(totalCart);
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
