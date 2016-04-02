package payment.model;

public class GiftCardService {
	private GiftCardDAO dao;
	
	public GiftCardService() {
		super();
	}
	public void setDao(GiftCardDAO dao) {
		this.dao = dao;
	}
	public boolean useCard (String gc_number,String gc_code){
		return false;
	};
	private boolean isAvailable(String gc_number,String gc_code){
		return false;
	};
	private double getAmount(String gc_number,String gc_code){
		return 0;
	};

}
