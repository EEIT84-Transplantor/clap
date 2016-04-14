package shopping.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class ProductDetailAction extends ActionSupport implements ServletRequestAware {
    private HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	

}
