package component.interceptor;

import org.springframework.cglib.transform.impl.AbstractInterceptFieldCallback;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import shopping.model.CartService;

public class GetCategoriesInterceptor extends AbstractInterceptor{

	private CartService cartService;
	
	
	public GetCategoriesInterceptor() {
	
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}


	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		System.out.println("這裡阿~~~~~~~~~~~~~~~~~~~"+cartService.getCartList("caca@gmail.com").size());
		
		return null;
	}

}
