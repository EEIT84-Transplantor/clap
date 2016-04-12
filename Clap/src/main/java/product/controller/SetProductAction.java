package product.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import product.model.ProductService;
import product.model.ProductVO;

public class SetProductAction {
	private ProductService productService;
	private ProductVO productVO;
	private String productImg;

	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		boolean isChanged = false;
		
		try {
			byte[] arrb = productImg.getBytes();
			Byte[] arrB = new Byte[arrb.length];
			for(int index=0; index<arrb.length; index++){
				arrB[index] = arrb[index];
			}
			isChanged = productService.setOrUpdateProduct(productVO, arrB);
		} catch (Exception e) {
		}
		
		String message = isChanged?"Successfully done.":"Action failed.";
		request.setAttribute("isChanged", isChanged);
		request.setAttribute("message", message);
		return "success";
	}
}
