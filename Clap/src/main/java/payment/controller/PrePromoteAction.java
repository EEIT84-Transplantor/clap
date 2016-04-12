package payment.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import payment.model.PromoService;
import payment.model.PromoVO;

public class PrePromoteAction extends ActionSupport {
	private Date expireFrom;
	private Date expireTo;
	private String categoryName;
	private PromoService promoService;
	
	
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
		System.out.println("hellollololololol preAction");
		List<PromoVO> promoVOs = null;
		List<String> categoryNames=  null;
		if(expireFrom!=null){
			promoVOs = promoService.getAllPromosByStartDate(expireFrom);
		}
		if(expireTo!=null){
			if(promoVOs ==null){
				promoVOs = promoService.getAllPromosByEndDate(expireTo);
			}else{
				List<PromoVO> temp = new ArrayList<PromoVO>();
				temp = promoService.getAllPromosByEndDate(expireTo);
				for(PromoVO vo:promoVOs){
					if(!temp.contains(vo)){
						promoVOs.remove(vo);
					}
				}
			}
		}
		if(categoryName!=null){
			Integer id = promoService.selectByCategoryName(categoryName);
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
		if(expireFrom==null&&expireTo==null&&categoryName==null){
			promoVOs =  promoService.getAllPromos(true);
			categoryNames=  promoService.getAllCategoryNames(promoVOs);
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("promoVOs", promoVOs);
		request.setAttribute("categoryNames", categoryNames);
		return "success";
	}
}
