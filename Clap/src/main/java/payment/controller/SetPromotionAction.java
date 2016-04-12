package payment.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import payment.model.PromoService;
import payment.model.PromoVO;

public class SetPromotionAction extends ActionSupport{
	private PromoService promoService;
	private PromoVO promoVO;
	private String category;
	public PromoService getPromoService() {
		return promoService;
	}
	public void setPromoService(PromoService promoService) {
		this.promoService = promoService;
	}
	public PromoVO getPromoVO() {
		return promoVO;
	}
	public void setPromoVO(PromoVO promoVO) {
		this.promoVO = promoVO;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String execute(){
		System.out.println("insertttt");
		promoVO.setPd_category(promoService.selectByCategoryName(category));
		boolean result = promoService.setPromo(promoVO);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("isChanged", result);
		if(result){
			request.setAttribute("message", "Promotion Code Added Successfully");
		}else{
			request.setAttribute("message", "The information you entered is wrong, please try again");
		}
		request.removeAttribute("promoVOs");
		return SUCCESS;
	}
	
	
	

}
