package simulator.controller;

import java.io.InputStream;

import javax.json.JsonObject;

import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryService;
import product.model.ProductService;
import product.model.ProductVO;

public class BodySimulatorAction extends ActionSupport{
	private InputStream inputStream;
	private ProductService productService;
	private CategoryService categoryService;
	private ProductVO productVO;
	private ProductVO productVOPre;
	private Double weight;
	private Double height;
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public void setProductVOPre(ProductVO productVOPre) {
		this.productVOPre = productVOPre;
	}
	public String execute(){
//		Double endurance = productService.getProductEndurance(productVO.getId());
//		Double skill = productService.getProductSkill(productVO.getId());
//		JSONObject object = new JSONObject();
//		object.put("endurance", endurance);
//		object.put("skill", skill);
		
		
		return SUCCESS;
	}
	
}
