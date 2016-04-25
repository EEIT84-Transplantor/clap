package shopping.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryService;
import product.model.ProductService;
import product.model.ProductVO;

public class SearchProductAction extends ActionSupport implements ServletRequestAware{
    private HttpServletRequest request;
    private CategoryService categoryService;
    private ProductService productService;
    private String categoryname;
    private Double min;
    private Double max;
    private String keyword;
    private String page;
    private InputStream inputStream;
    public InputStream getInputStream() {
        return inputStream;
    }
 
	public void setPage(String page) {
		this.page = page;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public SearchProductAction() {
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public void setMin(Double min) {
		this.min = min;
	}
	public void setMax(Double max) {
		this.max = max;
	}
	@Override
	public String execute() throws Exception {
		Integer categoryId = categoryService.selectByCategoryName(categoryname);
		List<ProductVO> temp = productService.searchProduct(categoryId, min, max, keyword);
		JSONArray objectArray = new JSONArray();
  		for(ProductVO productVO:temp){
  			JSONObject object = new JSONObject();
  			object.put("name", productVO.getName());
  			object.put("price", productVO.getPrice());
  			object.put("id", productVO.getId());
  			object.put("image", productService.getProductImgById(productVO.getId()).getImg64());
  			objectArray.put(object);
  		}
  		
       if(categoryId!=null||page!=null){
    	   inputStream = new ByteArrayInputStream(objectArray.toString().getBytes("UTF-8"));
      		return SUCCESS; 
		}else{
			request.setAttribute("products", temp);
			return "search";  
		}
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
