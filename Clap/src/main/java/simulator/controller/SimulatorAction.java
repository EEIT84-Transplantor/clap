package simulator.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

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
		
		List<ProductVO> productVOs = null;
		
		for(CategoryVO categoryVO:categoryService.getAllCategory()){
			productVOs = productService.searchProductByCategory(categoryVO.getId());
			List<ProductimgVO> productimgVOs = new ArrayList<ProductimgVO>();
			for(ProductVO productVO:productVOs){
				productimgVOs.add(productService.getProductImgById(productVO.getId()));
			}
			SimulatorVO simulatorVO = new SimulatorVO();
			simulatorVO.setCategoryVO(categoryVO);
			simulatorVO.setProductVOs(productVOs);
			simulatorVO.setProductimgVOs(productimgVOs);
			simulatorVOs.add(simulatorVO);
		}
		request.setAttribute("simulatorVOs", simulatorVOs);
		return SUCCESS;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
      
      
      
      
      
}
