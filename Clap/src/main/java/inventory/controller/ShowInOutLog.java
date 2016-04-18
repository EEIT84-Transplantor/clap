package inventory.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import inventory.model.InOutLogService;
import inventory.model.InOutLogVO;

public class ShowInOutLog extends ActionSupport{
	InOutLogService inOutLogService;

	public InOutLogService getInOutLogService() {
		return inOutLogService;
	}

	public void setInOutLogService(InOutLogService inOutLogService) {
		this.inOutLogService = inOutLogService;
	}
	
	public String execute(){
		List<InOutLogVO>inOutLogVOs = inOutLogService.getAll();
		System.out.println(inOutLogVOs);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("inOutLogVOs",inOutLogVOs);
		return SUCCESS;
	}
}
