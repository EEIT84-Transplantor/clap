package product.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import com.opensymphony.xwork2.ActionSupport;

import product.model.ProductService;

public class UpdateProductAction extends ActionSupport {
	private ProductService productService;
    private InputStream inputStream;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

    public InputStream getInputStream() {
        return inputStream;
    }
 
    public String execute() throws Exception {
    	String JSONstr = "";
    	
    	
    	
        inputStream = new ByteArrayInputStream(JSONstr.getBytes("UTF-8"));
        return "success";
    }
}
