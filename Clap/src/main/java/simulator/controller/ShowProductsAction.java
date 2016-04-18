package simulator.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryService;
import product.model.ProductService;
import product.model.ProductVO;

public class ShowProductsAction extends ActionSupport implements ServletRequestAware{
	private ProductService productService;
	private String category;
	private CategoryService categoryService;
	private InputStream inputStream;
	private HttpServletRequest request;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	public String execute(){
		Integer categoryId = categoryService.selectByCategoryName(category);
		
		List<ProductVO> productVOs = productService.searchProductByCategory(categoryId);
		
		return SUCCESS;
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = request;
	}
	
}
