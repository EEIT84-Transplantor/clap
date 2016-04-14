package component.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import payment.model.PromoService;
import payment.model.PromoVO;
import product.model.CategoryService;
import product.model.CategoryVO;

public class PromoInterceptor extends AbstractInterceptor {
	private PromoService promoService;
	private CategoryService categoryService;
	
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public void setPromoService(PromoService promoService) {
		this.promoService = promoService;
	}
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = (HttpServletRequest)invocation.getInvocationContext().get("HTTP_REQUEST");
		
		List<PromoVO> promoVOs = promoService.getAllPromos(true);
		System.out.println(promoVOs);
		List<CategoryVO> categoryVOs = categoryService.getAllCategory();
		request.setAttribute("promoVOs", promoVOs);
		request.setAttribute("categoryVOs", categoryVOs);
		
		
		return invocation.invoke();
	}

}
