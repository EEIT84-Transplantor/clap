package payment.model;

import java.util.List;

public interface CreditCardDAO {
	
	public abstract List<CreditCardVO> selectByEmail(String mb_email);
	
	public abstract CreditCardVO selectByCcNumber(String cc_number);

	public abstract CreditCardVO insert(CreditCardVO creditCardVO);

	public abstract boolean delete(String cc_number,String mb_email);
}
