package shopping.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import inventory.model.InventoryService;
import payment.model.PromoCodeService;
import payment.model.PromoVO;
import product.model.ProductService;
import product.model.ProductVO;

public class CartService {
	private CartDAO cartDAO;
	private ProductService productService;
	private InventoryService inventoryService;
	private PromoCodeService promoCodeService;
	
	public PromoCodeService getPromoCodeService() {
		return promoCodeService;
	}
	public void setPromoCodeService(PromoCodeService promoCodeService) {
		this.promoCodeService = promoCodeService;
	}
	public InventoryService getInventoryService() {
		return inventoryService;
	}
	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
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
	public Boolean removeCart (String email){
		boolean result = false;
		result = cartDAO.delete(email);
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
		CartVO temp = cartDAO.update(email, productid, quantity);
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
		
		CartVO temp = cartDAO.update(cartVO);
		
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
		ProductVO prouctVO = productService.getProductById(cartVO.getProduct_id());
		result = prouctVO.getPrice()*cartVO.getQuantity();
		return result;
	};
	public List<Map<String,String>> getCartList(String email){
		
		List<Map<String,String>> result = new ArrayList<>(); 
		List<CartVO> cartVOs = getCart(email);
		ProductVO productVO = null;
		
		for(CartVO cartVO:cartVOs){
			productVO = productService.getProductById(cartVO.getProduct_id());
			Map<String,String> temp = new HashMap<>(); 
			temp.put("name", productVO.getName());
			temp.put("price", productVO.getPrice().toString());
			temp.put("quantity", String.valueOf(cartVO.getQuantity()));
			temp.put("stock", String.valueOf(inventoryService.getQuantity(cartVO.getProduct_id())));
			result.add(temp);
		}
		
		return result;
	}

}