package simulator.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.util.ServletContextAware;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.inject.Context;

import product.model.CategoryService;
import product.model.CategoryVO;
import product.model.ProductService;
import product.model.ProductVO;
import product.model.ProductimgVO;
import simulator.model.SimulatorVO;

public class SimulatorAction extends ActionSupport implements ServletRequestAware{
      private List<SimulatorVO> simulatorVOs = new ArrayList<SimulatorVO>();
      private CategoryService categoryService;
      private ProductService productService;
      private HttpServletRequest request;
 
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	@Override
	public String execute() throws Exception {
		ServletContext context = ServletActionContext.getServletContext();
		List<CategoryVO> categoryVOs=(List<CategoryVO>) context.getAttribute("globalCategoryVOs");
//		List<ProductVO> productVOs = null;
		Map<Integer, List<ProductVO>> mapOfProductVOs =(Map<Integer, List<ProductVO>>) context.getAttribute("globalProductVOs");
	
		Map<Integer, List<ProductimgVO>> mapOfProductimgVOs = (Map<Integer, List<ProductimgVO>>) context.getAttribute("globalProductimgVOs");
		
		List<SimulatorVO> simulatorVOs = categoryService.calculate(categoryVOs, mapOfProductVOs, mapOfProductimgVOs, 0, 20.0, 0.0, 0.0, 0.0);
//		for(CategoryVO categoryVO:categoryService.getAllCategory()){
		
//		System.out.println("hi"+simulatorVOsArray);
		request.setAttribute("simulatorVOs", simulatorVOs);

		return SUCCESS;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
      
      
      
      
}
