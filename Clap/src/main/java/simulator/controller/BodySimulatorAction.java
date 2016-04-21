package simulator.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpRequest;

import com.opensymphony.xwork2.ActionSupport;

import javassist.bytecode.ByteArray;
import product.model.CategoryService;
import product.model.CategoryVO;
import product.model.ProductService;
import product.model.ProductVO;
import product.model.ProductimgVO;
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
	
	public InputStream getInputStream() {
		return inputStream;
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
        System.out.println("BodySimulatorAction [weight=" + weight + ", height=" + height + ", smoking=" + smoking + ", drinking="
				+ drinking + ", exercising=" + exercising + ", env_id=" + env_id + "]");
		//categoryService 的calculate還沒做~
		List<SimulatorVO> simulatorVOs = categoryService.calculate(env_id,bmi,smoking,drinking,exercising);

		HttpServletRequest request = ServletActionContext.getRequest();
		List<ProductVO> productVOs = null;
		JSONArray simulatorVOsArray = new JSONArray();
		for(SimulatorVO simulatorVO : simulatorVOs){
			CategoryVO categoryVO = simulatorVO.getCategoryVO();
			JSONObject categoryJson = new JSONObject();
			productVOs = simulatorVO.getProductVOs();
			categoryJson.put("id", categoryVO.getId());
			categoryJson.put("name", categoryVO.getName());
			categoryJson.put("smoking", categoryVO.getSmoking());
			categoryJson.put("bmi", categoryVO.getBmi());
			categoryJson.put("drinking", categoryVO.getDrinking());
			categoryJson.put("exercising", categoryVO.getExercising());
			categoryJson.put("industrial", categoryVO.getIndustrial());
			categoryJson.put("forest", categoryVO.getForest());
			categoryJson.put("city", categoryVO.getCity());
			
			JSONArray productimgVOJsonArray = new JSONArray();
			JSONArray productVOJsonArray = new JSONArray();
			List<ProductimgVO> productimgVOs = new ArrayList<ProductimgVO>();
			
			
			for(ProductVO productVO:productVOs){
				JSONObject productVOJson =new JSONObject();
				JSONObject productimgVOJson = new JSONObject();
				ProductimgVO temp = productService.getProductImgById(productVO.getId());
				productVOJson.put("id",productVO.getId());
				productVOJson.put("name",productVO.getName());
				productVOJson.put("price",productVO.getPrice());
				productVOJson.put("description",productVO.getDescription());
				productVOJson.put("rating",productVO.getRating());
				productVOJson.put("discount",productVO.getDiscount());
				productVOJson.put("category_id",productVO.getCategory_id());
//				productVOJson.put("categoryVO",productVO.getCategoryVO());
				productVOJson.put("endurance",productVO.getEndurance());
				productVOJson.put("skill",productVO.getSkill());
				productVOJson.put("finalValue1",productVO.getFinalValue1());
				productVOJson.put("finalValue2",productVO.getFinalValue2());
				
				productimgVOJson.put("id",temp.getId());
//				productimgVOJson.put("img",temp.getImg());
//				productimgVOJson.put("img64",temp.getImg64());
				productimgVOs.add(temp);
				productVOJsonArray.put(productVOJson);
				productimgVOJsonArray.put(productimgVOJson);
			}
			JSONObject simulatorVOJSON = new JSONObject();
			simulatorVOJSON.put("categoryVO", categoryJson);
			simulatorVO.setCategoryVO(categoryVO);
			simulatorVOJSON.put("productVOs", productVOJsonArray);
			simulatorVO.setProductVOs(productVOs);
			simulatorVOJSON.put("productimgVOs", productimgVOJsonArray);
			simulatorVO.setProductimgVOs(productimgVOs);
			simulatorVOsArray.put(simulatorVOJSON);
			
		
		}
		System.out.println("simulatorVOsArray length: "+simulatorVOsArray.toString().length());
		request.setAttribute("simulatorVOs", simulatorVOs);
		try {
			inputStream  = new ByteArrayInputStream(simulatorVOsArray.toString().getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

}
