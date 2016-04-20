package simulator.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryService;
import product.model.CategoryVO;
import product.model.ProductService;
import product.model.ProductVO;
import product.model.ProductimgVO;

public class EnviromentSimulatorAction extends ActionSupport implements ServletRequestAware{
	private ProductService productService;
	private CategoryService categoryService;
	private InputStream inputStream;
	private HttpServletRequest request;
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	@Override
	public String execute() throws Exception {
		Map<String,List<ProductVO>> prosuctsPerCategory = new HashMap<>();
		Map<Integer, ProductimgVO> productImgs = new HashMap<>();
		
		
		for(CategoryVO categoryVO:categoryService.getAllCategory()){
			
			
			
			prosuctsPerCategory.put(categoryVO.getName(), productService.searchProductByCategory(categoryVO.getId()));
		}
		
		
		
		
		
		request.setAttribute("prosuctsPerCategory", prosuctsPerCategory);
		request.setAttribute("productImgs", productImgs);
		
		return "SUCCESS";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	
	
	
	
	
	
	

}
