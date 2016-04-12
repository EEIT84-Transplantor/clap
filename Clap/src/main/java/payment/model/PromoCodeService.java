package payment.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class PromoCodeService {
	
	public static void main(String[] args){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		PromoCodeService pservice = (PromoCodeService)context.getBean("promoCodeService");
		
		System.out.println(pservice.getPromo("caca@gmail.com","111").getPm_title());
	
	}
	
	private PromoCodeDAO dao;
	private PromoService promoService;
	public PromoCodeService() {
	}
	
	public PromoService getPromoService() {
		return promoService;
	}

	public void setPromoService(PromoService promoService) {
		this.promoService = promoService;
	}

	public void setDao(PromoCodeDAO dao) {
		this.dao = dao;
	}
	public PromoCodeVO setPromotionCode(String mb_email, String pm_code){
		
		PromoCodeVO result = null;
		
		if(mb_email==null||mb_email.length()==0){
			return result;
		}
		
		if(mb_email==null||mb_email.length()==0){
			return result;
		}
		PromoVO promoVO = new PromoVO();
		promoVO.setPm_code(pm_code);
		PromoCode promoCode = new PromoCode();
		promoCode.setMb_email(mb_email);
		promoCode.setPm_code(pm_code);
		System.out.println("######################################A");
		PromoCodeVO temp = dao.insert(promoCode);
		System.out.println("######################################B");
		if(temp!=null){
			result = temp;
		}
		
		return result;
	};
	
    public boolean removePromotionCode(String mb_email, String pc_code){
		boolean result = false;
		
		if(mb_email==null||mb_email.length()==0){
			return result;
		}
		
		if(pc_code==null||pc_code.length()==0){
			return result;
		}
		
		if(dao.delete(mb_email,pc_code)){
			result = true;
		}
		
		return result;
	};

	public List<PromoVO> getPromos(String mb_email){
		List<PromoCodeVO> pcvs = dao.selectByEmail(mb_email);

		List<PromoVO> result = new ArrayList<PromoVO>();
		
		for(PromoCodeVO pcv :pcvs){
			result.add(promoService.getPromoDetail(pcv.getPromoCode().getPm_code()));
		}
		return result;
	};
	
	public PromoVO getPromo(String mb_email,String pc_code){
		PromoVO result = null;
		
		if(mb_email==null||mb_email.length()==0){
			return result;
		}
		if(pc_code==null||pc_code.length()==0){
			return result;
		}
		
		List<PromoVO> temp = this.getPromos(mb_email);
		
		if(temp!=null&&temp.size()!=0){
			for(int i =0;i<temp.size();i++){
				if(temp.get(i).getPm_code().equals(pc_code)){
					result = temp.get(i);
				}
			}
		}
		return result;
	}
}
