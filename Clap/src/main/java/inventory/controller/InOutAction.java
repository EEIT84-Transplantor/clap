package inventory.controller;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import inventory.model.InOutLogService;
import inventory.model.InOutLogVO;
import inventory.model.InventoryService;
import product.model.ProductService;
import product.model.ProductVO;

public class InOutAction extends ActionSupport {
	private InOutLogService inOutLogService;
	private InventoryService inventoryService;
	private InOutLogVO inOutLogVO;
	private ProductService productService;
	private Integer quantity;
	private String inOut;
	private String productName;
	private Date manufactureDate;
	private Date expiryDate;
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public InOutLogService getInOutLogService() {
		return inOutLogService;
	}
	public void setInOutLogService(InOutLogService inOutLogService) {
		this.inOutLogService = inOutLogService;
	}
	public InventoryService getInventoryService() {
		return inventoryService;
	}
	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}
	public InOutLogVO getInOutLogVO() {
		return inOutLogVO;
	}
	public void setInOutLogVO(InOutLogVO inOutLogVO) {
		this.inOutLogVO = inOutLogVO;
	}
	public String getInOut() {
		return inOut;
	}
	public void setInOut(String inOut) {
		this.inOut = inOut;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	
	
	public void validate(){
//		Long d= Calendar.getInstance().getTimeInMillis();
//		if(productName==null && inOutLogVO.getProduct_id()==null){
//			addFieldError("productName", "Product Name cannot be empty");
//		}		
//		if(inOutLogVO.getExpiryDate()==null){
//			addFieldError("inOutLogVO.expiryDate", "Expiration Date cannot be empty");
//		}
//		if(inOutLogVO.getExpiryDate()==null){
//			addFieldError("inOutLogVO.expiryDate", "Expiration Date does not work");
//		}
//		if(inOutLogVO.getManufactureDate()==null){
//			addFieldError("inOutLogVO.manufactureDate", "Manufacture Date cannot be empty");
//		}
//		if(inOutLogVO.getDestination()==null){
//			addFieldError("inOutLogVO.destination", "Destination cannot be empty");
//		}
//		if(quantity==null||quantity<=0){
//			addFieldError("quantity", "Quantity is wrong");
//		}
	}
	
	@Override
	public String execute(){
		inOutLogVO.setExpiryDate((Timestamp) expiryDate);
		inOutLogVO.setManufactureDate((Timestamp) manufactureDate);
		Boolean result = false;
		System.out.println(inOutLogVO.getManufactureDate()+"   "+inOutLogVO.getExpiryDate());
		if (inOutLogVO.getProduct_id()==null && productName!=null){
			Integer id = productService.getIdByProductName(productName);
			inOutLogVO.setProduct_id(id);
	
		}
		if(inOut.equalsIgnoreCase("in")){
			inOutLogVO.setInQuantity(quantity);
			result= inOutLogService.importProduct(inOutLogVO);
		}else{
			inOutLogVO.setOutQuantity(quantity);
			result= inOutLogService.exportProduct(inOutLogVO);
		}
		System.out.println(result);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		if (result){
			request.setAttribute("Message", "Input Successfully");
		}else{
			request.setAttribute("Message", "Input Unsuccessfully, Please Try Again");
		}
		
		return SUCCESS;
	}
}
