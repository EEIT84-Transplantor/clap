package shopping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryService;
import product.model.CategoryVO;
import product.model.ProductService;
import product.model.ProductVO;

public class ShoppingAction extends ActionSupport implements ServletRequestAware{

	private CategoryService categoryService;
	private ProductService productService;
	private HttpServletRequest request;
	
	public ShoppingAction() {
	}
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Override
	public String execute() throws Exception {
		List<CategoryVO>  categoryVOs= categoryService.getAllCategory();
		Map<String, List<ProductVO>> allCategoryProduct = new HashMap<String, List<ProductVO>>();
		for(CategoryVO categoryVO :categoryVOs){
			allCategoryProduct.put(categoryVO.getName(), productService.searchProductByCategory(categoryVO.getId()));
		}
		request.setAttribute("allCategoryProduct", allCategoryProduct);
		
		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
}
