package product.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Base64;

import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import product.model.ProductService;
import product.model.ProductVO;

public class UpdateProductAction extends ActionSupport {
	private ProductService productService;
    private InputStream inputStream;
    private ProductVO productVO;
    private String productimg64;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

    public InputStream getInputStream() {
        return inputStream;
    }
 
    public String getProductimg64() {
		return productimg64;
	}

	public void setProductimg64(String productimg64) {
		this.productimg64 = productimg64;
	}

	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	public String execute() throws Exception {
    	
		String JSONstr = "";
    	byte[] imgbyte =null;
    	Byte[] imgByte =null;
		try {
			productimg64 = productimg64.substring(productimg64.indexOf(",")+1); 
			imgbyte = Base64.getDecoder().decode(productimg64);
			imgByte = new Byte[imgbyte.length];
			for(int index=0;index<imgbyte.length;index++){
				imgByte[index] = imgbyte[index];
			}
		} catch (Exception e1) {
		}
		
    	boolean isChanged = false;
    	
    	try {
			isChanged = productService.setOrUpdateProduct(productVO, imgByte);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}

    	String message = isChanged?"Updated":"Failed to update";
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("isChanged", isChanged);
    	jsonObject.put("message", message);
    	JSONstr = jsonObject.toString();
        inputStream = new ByteArrayInputStream(JSONstr.getBytes("UTF-8"));
        return "success";
    }
}
