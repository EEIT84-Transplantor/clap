package simulator.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONArray;
import org.json.JSONObject;

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
		JSONArray simulatorVOsArray = new JSONArray();
		for(CategoryVO categoryVO:categoryService.getAllCategory()){
			JSONObject categoryJson = new JSONObject();
			
			productVOs = productService.searchProductByCategory(categoryVO.getId());
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
				productimgVOJson.put("img64",temp.getImg64());
				productimgVOs.add(temp);
				productVOJsonArray.put(productVOJson);
				productimgVOJsonArray.put(productimgVOJson);
			}
			SimulatorVO simulatorVO = new SimulatorVO();
			JSONArray simulatorVOJSON = new JSONArray();
			simulatorVOJSON.put(categoryJson);
			simulatorVO.setCategoryVO(categoryVO);
			simulatorVOJSON.put(productVOJsonArray);
			simulatorVO.setProductVOs(productVOs);
			simulatorVOJSON.put(productimgVOJsonArray);
			simulatorVO.setProductimgVOs(productimgVOs);
			simulatorVOsArray.put(simulatorVOJSON);
			simulatorVOs.add(simulatorVO);
			
		}
//		System.out.println("hi"+simulatorVOsArray);
		request.setAttribute("simulatorVOs", simulatorVOs);
		request.setAttribute("simulatorVOsJSON", simulatorVOsArray);
		return SUCCESS;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
      
      
      
      
      
}
