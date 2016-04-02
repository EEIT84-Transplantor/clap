package payment.model;

import java.util.List;

public class PromoCodeService {
	private PromoCodejdbcDAO dao;
	
	public PromoCodeService() {
		super();
	}
	public void setDao(PromoCodejdbcDAO dao) {
		this.dao = dao;
	}
	public PromoCodeVO setPromotionCode(String mb_email, String pc_code){
		PromoCodeVO result = null;
		return result;
	};
	public boolean removePromotionCode(String memberId, String promoCode){
		return false;
	};
	public List<PromoVO> getPromos(String mb_email){
		List<PromoVO> result = null;
		return result;
	};
	public PromoVO getPromo(String pc_code){
		PromoVO result = null;
		return result;
	};

}
