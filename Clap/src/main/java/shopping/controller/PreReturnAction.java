package shopping.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import member.model.MemberVO;
import product.model.ProductService;

public class PreReturnAction {
	private String email;
	private ProductService productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(email==null){
			email = ((MemberVO)request.getSession().getAttribute("login")).getEmail();
		}
		
		return "success";
	}
}
