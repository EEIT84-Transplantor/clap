package simulator.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.http.HttpRequest;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryService;
import product.model.ProductService;
import simulator.model.SimulatorService;
import simulator.model.SimulatorVO;

public class BodySimulatorAction extends ActionSupport {
	private InputStream inputStream;
	private ProductService productService;
	private CategoryService categoryService;
	private SimulatorService simulatorService;
	private Double weight;
	private Double height;
	private Integer smoking;
	private Integer drinking;
	private Integer exercising;
	private Integer env_id;

	public Integer getSmoking() {
		return smoking;
	}
	public void setSmoking(Integer smoking) {
		this.smoking = smoking;
	}
	public Integer getDrinking() {
		return drinking;
	}
	public Integer getEnv_id() {
		return env_id;
	}
	public void setEnv_id(Integer env_id) {
		this.env_id = env_id;
	}
	public void setDrinking(Integer drinking) {
		this.drinking = drinking;
	}
	public Integer getExercising() {
		return exercising;
	}
	public void setExercising(Integer exercising) {
		this.exercising = exercising;
	}
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
	public void setSimulatorService(SimulatorService simulatorService) {
		this.simulatorService = simulatorService;
	}
	

	public String execute(){
//		Double endurance = productService.getProductEndurance(productVO.getId());
//		Double skill = productService.getProductSkill(productVO.getId());
//		JSONObject object = new JSONObject();
//		object.put("endurance", endurance);
//		object.put("skill", skill);
//		Map<String,String>error=new HashMap<String,String>();
		Double bmi=null;
		if(weight!=null&&weight>0&&height==null&&height>0){
			bmi = weight/(Math.pow(height/100,2.0));
		}
		List<SimulatorVO>simulatorVOs =simulatorService.calculate(env_id,bmi,smoking,drinking,exercising);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("simulatorVOs", simulatorVOs);
		return SUCCESS;
	}

}
