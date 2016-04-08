package payment.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;



public class CreditCardHibernateDAO implements CreditCardDAO{

	private SessionFactory sessionFactory;
	private Session session;
	private static final String SELECT_BY_EMAIL = "from CreditCardVO where mb_email=?";

	public CreditCardHibernateDAO() {
		
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<CreditCardVO> selectByEmail(String mb_email) {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_BY_EMAIL);
		query.setParameter(0, mb_email);
		List<CreditCardVO> result = query.list();
		return result;
	}

	@Override
	public CreditCardVO selectByCcNumber(String cc_number) {
		session = sessionFactory.getCurrentSession();
		CreditCardVO result = session.get(CreditCardVO.class, cc_number);
		return result;
	}

	@Override
	public CreditCardVO insert(CreditCardVO creditCardVO) {
		System.out.println("哈哈");
		session = sessionFactory.getCurrentSession();
		
		try {
			CreditCardVO result = creditCardVO;
			System.out.println("增加 :"+result);
			session.save(result);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean delete(String cc_number,String mb_email) {
		session = sessionFactory.getCurrentSession();
		try {
			CreditCard temp = new CreditCard();
			temp.setCc_number(cc_number);
			temp.setMb_email(mb_email);
			CreditCardVO cardVO = (CreditCardVO)session.get(CreditCardVO.class, temp);
			session.delete(cardVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
