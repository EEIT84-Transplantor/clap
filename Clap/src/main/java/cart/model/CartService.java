package cart.model;

import java.util.List;

import payment.model.PromoCodeService;
import payment.model.PromoVO;

public class CartService {
	private CartDAO cartDAO;
	
	public CartService() {
	}
	public CartDAO getCartDAO() {
		return cartDAO;
	}
	public void setCartDAO(CartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}
	public List<CartVO> getCart (String email){
		List<CartVO> result = null;
		if(email!=null&&email.length()!=0){
			result = cartDAO.selectByEmail(email);
		}
		return result;
	};
	public Boolean setCart(String email,Integer productid,Integer quantity){
		Boolean result = false;
		if(email==null||email.length()==0){
			return result;
		}
		
		if(productid==null||quantity==null){
			return result;
		}
		CartVO temp = cartDAO.insert(email, productid, quantity);
		if(temp!=null){
			result = true;
		}
		return result;
	};
	public Boolean setCart(CartVO cartVO){
		Boolean result = false;
		if(cartVO==null){
			return result;
		}
		
		CartVO temp = cartDAO.insert(cartVO);
		if(temp!=null){
			result = true;
		}
		return result;
	};
	public Boolean removeCart (){
		Boolean result = false;
		result = cartDAO.delete();
		return result;
	};
	
	public Boolean removeCart (String email,Integer productid){
		Boolean result = false;
		if(email==null||email.length()==0||productid==null){
			return result;
		}
		
		result = cartDAO.delete(email,productid);
		
		return result;
	};
	public Boolean updateCart (String email,Integer productid ,Integer quantity){
		Boolean result = false;
		if(email==null||email.length()==0){
			return result;
		}
		
		if(productid==null||quantity==null){
			return result;
		}
		CartVO temp = cartDAO.insert(email, productid, quantity);
		if(temp!=null){
			result = true;
		}
		return result;
	};
	public Boolean updateCart (CartVO cartVO){
		Boolean result = false;
		if(cartVO==null){
			return result;
		}
		
		CartVO temp = cartDAO.insert(cartVO);
		
		if(temp!=null){
			result = true;
		}
		
		return result;
	};
	public Double getTotalAmount(String email,String promocode,Double amoumt){
		Double result = 0.0;
		List<CartVO> cartVOs = getCart(email);
		for(CartVO cartVO:cartVOs){
			result += getTotalAmount(cartVO);
		}
	
		//使用優惠券
		PromoCodeService promoCodeService = new PromoCodeService();
		PromoVO promoVO = promoCodeService.getPromo(email, promocode);
		Double discount = promoVO.getPm_discount();
		
		//(總額-禮物卡)*折扣數
		result = (result-amoumt)*discount;
		
		return result;
	};
	public Double getTotalAmount(CartVO cartVO){
		Double result = null;
        
		if(cartVO==null){
			return result;
		}
//		取得單品總價
//		ProuctService pService = new pService();
//		ProuctVO prouctVO = pService.getPriceById(cartVO.getId());
//		result = prouctVO.getPrice()*cartVO.getQuantity();
		
		return result;
	};
}
