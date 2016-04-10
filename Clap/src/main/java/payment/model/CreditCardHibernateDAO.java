package payment.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import shopping.model.CartVO;



public class CreditCardHibernateDAO implements CreditCardDAO{
	
	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		CreditCardHibernateDAO cardHibernateDAO = (CreditCardHibernateDAO) applicationContext.getBean("creditCardDAO");
		SessionFactory sessionFactory = (SessionFactory) applicationContext.getBean("sessionFactory");
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		CreditCardVO cardVO = cardHibernateDAO.selectByCcNumber("caca@gmail.com", "1111222233334444");
		System.out.println(cardVO.getMemberVO().getEmail());
		session.getTransaction().commit();
	}

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
	public CreditCardVO selectByCcNumber(String mb_email, String cc_number) {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_BY_EMAIL);
		query.setParameter(0, mb_email);
		List<CreditCardVO> creditCardVOs = query.list();
		CreditCardVO result = null;
		for(CreditCardVO vo : creditCardVOs){
			if(vo.getCreditCard().getCc_number().equals(cc_number)){
				result = vo;
			}
		}
		return result;
	}

	@Override
	public CreditCardVO insert(CreditCardVO creditCardVO) {
		session = sessionFactory.getCurrentSession();
		
//		System.out.println("哈哈哈 :"+creditCardVO.getCreditCard().getMb_email()+creditCardVO.getCreditCard().getCc_number());
//		CreditCard temp =  new CreditCard();
//		temp.setCc_number(creditCardVO.getCreditCard().getCc_number());
//		temp.setMb_email(creditCardVO.getCreditCard().getMb_email());
//		CreditCardVO result = session.get(CreditCardVO.class, temp);
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
	public boolean delete(String cc_number) {
		// TODO Auto-generated method stub
		return false;
	}

}
