package payment.model;

public class PromoService {
	private PromoDAO dao;
	
	public PromoService() {
		super();
	}

	public void setDao(PromoDAO dao) {
		this.dao = dao;
	}

	public boolean setPromo(PromoVO promoVO){
		return false;
	};

	public boolean isAvailable(String pm_code){
		return false;
	};

}
