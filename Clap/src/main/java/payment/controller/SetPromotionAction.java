package payment.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import payment.model.PromoService;
import payment.model.PromoVO;
import product.model.CategoryService;

public class SetPromotionAction extends ActionSupport{
	private PromoService promoService;
	private PromoVO promoVO;
	private String category;
	private CategoryService categoryService;
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
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
		promoVO.setPd_category(categoryService.selectByCategoryName(category));
		System.out.println("hiiiiiiiiiiiiiiiiiiiiiiiiiiii"+promoVO.getPm_title());
		System.out.println("insert"+promoVO.getPd_category()+promoVO.getPm_code()+promoVO.getPm_discount()+promoVO.getPm_title());
		boolean result = false;
		if (!promoService.isAvailable(promoVO.getPm_code())){
			System.out.println("save");
			result = promoService.setPromo(promoVO);
		}else{
			result = promoService.updatePromo(promoVO);
			System.out.println("update");
		}
		
		
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
