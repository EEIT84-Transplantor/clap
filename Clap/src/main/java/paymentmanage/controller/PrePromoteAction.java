package paymentmanage.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import payment.model.PromoService;
import payment.model.PromoVO;
import product.model.CategoryService;
import product.model.CategoryVO;

public class PrePromoteAction extends ActionSupport {
	private Date expireFrom;
	private Date expireTo;
	private String categoryName;
	private PromoService promoService;
	private CategoryService categoryService;
	
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public void setPromoService(PromoService promoService) {
		this.promoService = promoService;
	}
	public void setExpireFrom(Date expireFrom) {
		this.expireFrom = expireFrom;
	}
	public void setExpireTo(Date expireTo) {
		this.expireTo = expireTo;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	

	public String execute(){
		
		List<PromoVO> promoVOs = null;
		if(expireFrom!=null){
			promoVOs = promoService.getAllPromosByStartDate(expireFrom);
		}
		List<CategoryVO> categoryVOs = categoryService.getAllCategory();
		
		
		if(expireTo!=null){
			if(promoVOs ==null){
				promoVOs = promoService.getAllPromosByEndDate(expireTo);
			}else{
				List<PromoVO> temp = new ArrayList<PromoVO>();
				temp = promoService.getAllPromosByEndDate(expireTo);
				List<PromoVO> temp2 = new ArrayList<PromoVO>();
				for(PromoVO vo:promoVOs){
					if(temp.contains(vo)){
						temp2.add(vo);
					}
				}
				promoVOs=temp2;
			}
		}
		
		if(categoryName!=null &&!categoryName.equalsIgnoreCase("All")){
			
			Integer id = categoryService.selectByCategoryName(categoryName);
			if(promoVOs ==null){
				
				promoVOs = promoService.getAllPromosByCategory(id);
				
			}else{
				List<PromoVO> temp = new ArrayList<PromoVO>();
				temp = promoService.getAllPromosByCategory(id);
				for(PromoVO vo:promoVOs){
					if(!temp.contains(vo)){
						promoVOs.remove(vo);
					}
				}
			}
		}
		if(expireFrom==null&&expireTo==null&&categoryName==null||expireFrom==null&&expireTo==null&&categoryName.equalsIgnoreCase("All")){
			promoVOs =  promoService.getAllPromos(true);
		}
//		promoVOs =  promoService.getAllPromos(true);

		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("promoVOs", promoVOs);

		String message = (String) request.getSession().getAttribute("message");
		request.getSession().removeAttribute("message");
		
		request.setAttribute("message", message);
		request.setAttribute("categoryVOs", categoryVOs);
		return "success";
	}
}
