package product.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import product.model.ProductService;

public class RemoveProductAction extends ActionSupport {
	private ProductService productService;
    private InputStream inputStream;
    private Integer productId;
    
	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

    public InputStream getInputStream() {
        return inputStream;
    }
 
    public String execute() throws Exception {
    	String JSONstr = "";
    	boolean isChanged = false;
    	
    	try {
			isChanged = productService.removeProduct(productId);
		} catch (Exception e) {
		}
    	String message = isChanged?"Deleted":"Failed to delete";
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("isChanged", isChanged);
    	jsonObject.put("message", message);
    	JSONstr = jsonObject.toString();
        inputStream = new ByteArrayInputStream(JSONstr.getBytes("UTF-8"));
        return "success";
    }
}
