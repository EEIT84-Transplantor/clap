package payment.model;

import java.util.List;

public class CreditCardService {
	private CreditCardDAO dao;
	
	public CreditCardService() {
	}
	
	public void setDao(CreditCardDAO dao) {
		this.dao = dao;
	}
	
	public List<CreditCardVO> getCards(String email){		
		return dao.selectByEmail(email);
	};
	
	public CreditCardVO setCard (CreditCardVO creditCardVO){
		CreditCardVO result = null;
		return result;
	};
	
	public boolean removeCard(String cc_number){
		return dao.delete(cc_number);
	};
	
	public boolean isAvailable (CreditCardVO creditCardVO){
		return false;
	};

}
