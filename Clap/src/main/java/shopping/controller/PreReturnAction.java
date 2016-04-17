package shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import member.model.MemberVO;
import product.model.ProductService;
import shopping.model.ReturnService;
import shopping.model.ReturnVO;

public class PreReturnAction {
	private String email;
	private ProductService productService;
	private ReturnService returnService;
	
	public void setReturnService(ReturnService returnService) {
		this.returnService = returnService;
	}

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
		List<ReturnVO> returnVOs = returnService.getReturnableOrderProduct(email);
		if(returnVOs!=null){
		request.getSession().setAttribute("returnVOs", returnVOs);
		request.getSession().setAttribute("returnCount", returnVOs.size());
		}
		return "success";
	}
}
