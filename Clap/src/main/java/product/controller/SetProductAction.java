package product.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import product.model.ProductService;
import product.model.ProductVO;

public class SetProductAction {
	private ProductService productService;
	private ProductVO productVO;
    private File file;
    private String contentType;
    private String filename;
    public void setUpload(File file) {
        this.file = file;
     }

     public void setUploadContentType(String contentType) {
        this.contentType = contentType;
     }

     public void setUploadFileName(String filename) {
        this.filename = filename;
     }
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		boolean isChanged = false;
		
		try {
			byte[] arrb = new byte[(int)file.length()];
			FileInputStream fileInputStream = new FileInputStream(file);
			fileInputStream.read(arrb);
			Byte[] arrB = new Byte[arrb.length];
			for(int index=0; index<arrb.length; index++){
				arrB[index] = arrb[index];
			}
			isChanged = productService.setOrUpdateProduct(productVO, arrB);
		} catch (Exception e) {
		}
		
		String message = isChanged?"Successfully done.":"Action failed.";
		request.removeAttribute("productVOs");
		request.setAttribute("isChanged", isChanged);
		request.setAttribute("message", message);
		return "success";
	}
}
