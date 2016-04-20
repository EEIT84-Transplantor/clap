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
import simulator.model.SimulatorVO;

public class BodySimulatorAction extends ActionSupport {
	private InputStream inputStream;
	private ProductService productService;
	private CategoryService categoryService;
	private Double weight;
	private Double height;
	private Double smoking;
	private Double drinking;
	private Double exercising;
	private Integer env_id;

	
	public Double getSmoking() {
		return smoking;
	}
	public void setSmoking(Double smoking) {
		this.smoking = smoking;
	}
	public Double getDrinking() {
		return drinking;
	}
	public void setDrinking(Double drinking) {
		this.drinking = drinking;
	}
	public Double getExercising() {
		return exercising;
	}
	public void setExercising(Double exercising) {
		this.exercising = exercising;
	}
	public Integer getEnv_id() {
		return env_id;
	}
	public void setEnv_id(Integer env_id) {
		this.env_id = env_id;
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

		//categoryService 的calculate還沒做~
		List<SimulatorVO>simulatorVOs =categoryService.calculate(env_id,bmi,smoking,drinking,exercising);

		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		
		request.setAttribute("simulatorVOs", simulatorVOs);
		return SUCCESS;
	}

}
