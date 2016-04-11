package payment.model;

import java.util.List;

public interface CreditCardDAO {
	
	public List<CreditCardVO> selectByEmail(String mb_email);
	
	public CreditCardVO selectByCcNumber(String mb_email, String cc_number);

	public CreditCardVO insert(CreditCardVO creditCardVO);

	public boolean delete(String cc_number,String mb_email);

}
