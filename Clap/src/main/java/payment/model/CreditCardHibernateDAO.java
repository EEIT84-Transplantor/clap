package payment.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class CreditCardHibernateDAO implements CreditCardDAO{
	
	public static void main(String[] args) {
		ApplicationContext applicationContext =new ClassPathXmlApplicationContext("applicationContext.xml");
		CreditCardHibernateDAO cardHibernateDAO = (CreditCardHibernateDAO) applicationContext.getBean("creditCardDAO");
		CreditCardVO cardVO = cardHibernateDAO.selectByCcNumber("caca@gmail.com", "1111222233334444");
		System.out.println(cardVO.getMemberVO());
		
	}

	private SessionFactory sessionFactory;
	private Session session;
	private static final String SELECT_BY_EMAIL = "from CreditCardVO where mb_email=?";

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

	
	public CreditCardVO selectByCcNumber(String mb_email,String cc_number) {
		session = sessionFactory.getCurrentSession();
		CreditCardVO result =new CreditCardVO();
		result.setEmail(mb_email);
		result.setNumber(cc_number);
		session.beginTransaction();
		result = session.get(CreditCardVO.class, result);
		session.getTransaction().commit();
		return result;
	}

	@Override
	public CreditCardVO insert(CreditCardVO creditCardVO) {
		session = sessionFactory.getCurrentSession();
		try {
			System.out.println("增加 :"+creditCardVO);
			session.save(creditCardVO);
			System.out.println("增加2 :"+creditCardVO);
			return creditCardVO;
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

	@Override
	public CreditCardVO selectByCcNumber(String cc_number) {
		// TODO Auto-generated method stub
		return null;
	}

}
