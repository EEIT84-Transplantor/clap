package shopping.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryService;
import product.model.CategoryVO;
import product.model.ProductService;
import product.model.ProductVO;
import product.model.ProductimgVO;

public class SearchProductAction extends ActionSupport implements ServletRequestAware{
    private HttpServletRequest request;
    private ServletContext context;
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
 
	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public SearchProductAction() {
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
		context = request.getServletContext();
		List<CategoryVO> categoryVOs = (List<CategoryVO>)context.getAttribute("globalCategoryVOs");
		Map<Integer,List<ProductVO>> globalProductVOs = (Map<Integer,List<ProductVO>>)context.getAttribute("globalProductVOs");
		Map<Integer,List<ProductimgVO>> globalProductimgVOs = (Map<Integer,List<ProductimgVO>>)context.getAttribute("globalProductimgVOs");
		CategoryVO target = null;
		List<ProductVO> temp = null;
		if(categoryname!=null){
		for(CategoryVO categoryVO:categoryVOs){
			if(categoryVO.getName().equals(categoryname)){
				target = categoryVO;
				break;
			}
		}
		temp = productService.searchProduct(target.getId(), min, max, keyword);
		}else{
			temp = productService.searchProduct(null, min, max, keyword);
		}
		List<ProductimgVO> Pimages  = new ArrayList<ProductimgVO>();
		JSONArray objectArray = new JSONArray();
  		for(ProductVO productVO:temp){
  			JSONObject object = new JSONObject();
  			object.put("name", productVO.getName());
  			object.put("price", productVO.getPrice());
  			object.put("id", productVO.getId());
  			object.put("image", productService.getProductImgById(productVO.getId()).getImg64());
  			objectArray.put(object);
  			Pimages.add(productService.getProductImgById(productVO.getId()));
  		}
  		
       if(target!=null||page!=null){
    	   inputStream = new ByteArrayInputStream(objectArray.toString().getBytes("UTF-8"));
      		return SUCCESS; 
		}else{
			request.setAttribute("products", temp);
			request.setAttribute("productImgs", Pimages);
			return "search";  
		}
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
