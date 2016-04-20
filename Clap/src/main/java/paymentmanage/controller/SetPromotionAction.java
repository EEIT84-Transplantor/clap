package paymentmanage.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import payment.model.PromoService;
import payment.model.PromoVO;
import product.model.CategoryService;
import product.model.CategoryVO;

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
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println("hihi"+promoVO+category);
		String message="";
		if(promoVO.getPm_discount()==null||promoVO.getPm_discount()>1||promoVO.getPm_discount()<0){
			message+="Discount is not Valid<br>";
		}
		if(promoVO.getPm_code()==null){
			message+="Promo Code is not Valid<br>";
		}
		if(promoVO.getPm_title()==null||promoVO.getPm_title().length()==0){
			message+="Promo Code is not Valid<br>";
		}
		if(promoVO.getPm_expire()==null){
			message+="Expireation is not Valid<br>";
		}
		if(!message.equals("")){
			request.getSession().setAttribute("message", message);
			return INPUT;
		}
		
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
		
		
		request.setAttribute("isChanged", result);
		if(result){
			System.out.println("successsss");
			request.getSession().setAttribute("message", "Update Successfully");
		}else{
			System.out.println("unsuccesssss");
			request.getSession().setAttribute("message", "The information you entered was wrong, please try again");
		}
		System.out.println("yayayayay");
//		List<PromoVO> promoVOs = promoService.getAllPromos(true);
//		List<CategoryVO> categoryVOs = categoryService.getAllCategory();
//		request.setAttribute("promoVOs", promoVOs);
//		request.setAttribute("categoryVOs", categoryVOs);
		request.removeAttribute("promoVOs");
		return SUCCESS;
	}
	
	
	

}
