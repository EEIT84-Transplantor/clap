package cart.model;

import java.util.List;

public class CartService {
	public List<CartVO> getCart (String email){
		List<CartVO> result = null;
		return result;
	};
	public Boolean setCart(int productid,int quantity){
		Boolean result = false;
		return result;
	};
	public Boolean removeCart (){
		Boolean result = false;
		return result;
	};
	//清空購物車
	public Boolean removeCart (int productid){
		Boolean result = false;
		return result;
	};
	public Boolean updateCart (int productid ,int quantity){
		Boolean result = false;
		return result;
	};
	public Double getTotalAmount(CartVO cartvo,String promocode){
		Double result = null;
		return result;
	};
}
