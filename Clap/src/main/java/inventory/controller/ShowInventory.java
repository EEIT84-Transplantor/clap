package inventory.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import freemarker.template.utility.Execute;
import inventory.model.InventoryService;
import inventory.model.InventoryVO;

public class ShowInventory extends ActionSupport {
	InventoryService inventoryService;

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}
	public String execute(){
		List<InventoryVO> inventoryVOs = inventoryService.getAllInventories(null);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("inventoryVOs", inventoryVOs);
		return SUCCESS;
	}
}
