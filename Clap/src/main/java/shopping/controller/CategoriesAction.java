package shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryService;
import product.model.ProductService;
import product.model.ProductVO;

public class CategoriesAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private CategoryService categoryService;
	private ProductService productService;
	private String organ;
	public CategoriesAction() {
	}
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	
	public void setOrgan(String organ) {
		this.organ = organ;
	}

	@Override
	public String execute() throws Exception {
		if(organ==null){
			organ = categoryService.getAllCategory().get(0).getName();
		}
		List<ProductVO> lists = productService.searchProductByCategory(categoryService.selectByCategoryName(organ));
		
		if(lists!=null){
			request.setAttribute("organ", organ);
			request.setAttribute("productlist", lists);
		}
		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
  
}
