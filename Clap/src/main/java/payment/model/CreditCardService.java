package payment.model;

import java.util.Calendar;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import member.model.MemberVO;

public class CreditCardService {

	public static Double vip = 10000.0;

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CreditCardService cservice = (CreditCardService) context.getBean("creditCardService");
		CreditCardDAO cdao = (CreditCardDAO) context.getBean("creditCardDAO");

		CreditCardVO cvo = cdao.selectByCcNumber("1111222233334444");
		System.out.println(cservice.isAvailable(cvo));

	}

	private CreditCardDAO dao;

	public CreditCardService() {
	}

	public void setDao(CreditCardDAO dao) {
		this.dao = dao;
	}

	public List<CreditCardVO> getCards(String email) {
		List<CreditCardVO> result = null;
		if (email != null && email.length() != 0) {
			List<CreditCardVO> temp = dao.selectByEmail(email);
			if (temp != null && temp.size() != 0) {
				result = temp;
			}
		}
		return result;
	}

	public CreditCardVO setCard(CreditCardVO creditCardVO) {
		CreditCardVO result = null;
		if (creditCardVO != null) {
			String cc_cvv = creditCardVO.getCc_cvv();
			String cc_goodrhru = creditCardVO.getCc_goodthru();
			String cc_number = creditCardVO.getCreditCard().getCc_number();

			String mb_email = creditCardVO.getCreditCard().getMb_email();

			if (cc_cvv == null || cc_cvv.length() == 0) {
				return result;
			}
			if (cc_goodrhru == null || cc_goodrhru.length() == 0) {
				return result;
			}
			if (cc_number == null || cc_number.length() == 0) {
				return result;
			}
			if (mb_email == null || mb_email.length() == 0) {
				return result;
			}
			CreditCardVO temp = dao.insert(creditCardVO);
			if (temp != null) {
				result = temp;
			}
		}
		return result;
	}

	public boolean removeCard(String cc_number,String mb_email) {
		boolean result = false;
		if (cc_number != null && cc_number.length() != 0) {
			if (dao.delete(cc_number,mb_email)) {
				result = true;
			}
		}
		return result;
	}

	public boolean isAvailable(CreditCardVO creditCardVO) {
		boolean result = false;
		if (creditCardVO != null) {
			String cc_number = creditCardVO.getCreditCard().getCc_number();
			if (cc_number != null && cc_number.length() != 0) {
				CreditCardVO temp = dao.selectByCcNumber(cc_number);
				Calendar cal = null;
				if (temp != null) {
					// 舊卡
					// expire
					int month = Integer.parseInt(temp.getCc_goodthru().split("/")[0]);
					int year = Integer.parseInt(temp.getCc_goodthru().split("/")[1]);
					cal = Calendar.getInstance();
					int now_year = Integer.parseInt(String.valueOf(cal.get(Calendar.YEAR)).substring(2));
					if (year > now_year) {
						return true;
					}

					int now_month = Integer.parseInt(String.valueOf(cal.get(Calendar.MONTH))) + 1;
					if (month >= now_month) {
						return true;
					}

				} else {
					// 新卡

					// 卡號
					if (temp.getCreditCard().getCc_number() == null || temp.getCreditCard().getCc_number().length() != 16) {
						return result;
					}

					// cvv
					if (temp.getCc_cvv() == null || temp.getCc_cvv().length() != 3) {
						return result;
					}

					// expire
					int month = Integer.parseInt(temp.getCc_goodthru().split("/")[0]);
					int year = Integer.parseInt(temp.getCc_goodthru().split("/")[1]);
					cal = Calendar.getInstance();
					int now_year = Integer.parseInt(String.valueOf(cal.get(Calendar.YEAR)).substring(2));
					if (year > now_year) {
						return true;
					}

					int now_month = Integer.parseInt(String.valueOf(cal.get(Calendar.MONTH))) + 1;
					if (month >= now_month) {
						return true;
					}
				}
			}
		}
		return result;
	}

//	memberVO支付amount元
	public boolean payBill(MemberVO memberVO, Double amount) {
		return false;
	
	}

	//由卡號取得卡片VO
	public CreditCardVO getCard(String number) {
		return dao.selectByCcNumber(number);
	}

}
