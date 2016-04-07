package payment.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class PromoCodeHibernateDAO implements PromoCodeDAO{


	private SessionFactory sessionFactory;
	private Session session;
	final private String SELECT_ALL = "from PromoCodeVO";

	public PromoCodeHibernateDAO() {
		
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<PromoCodeVO> selectAll() {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		List<PromoCodeVO> result = query.list();
		return result;
	}

	@Override
	public List<PromoCodeVO> selectByEmail(String mb_email) {
		List<PromoCodeVO> result = null;
		return result;
	}

	@Override
	public List<PromoVO> selectPromoVOByEmail(String mb_email) {
		List<PromoVO> result = null;
		return null;
	}

	@Override
	public PromoCodeVO insert(String mb_email, String pc_code) {
		session = sessionFactory.getCurrentSession();
		PromoCodeVO result = new PromoCodeVO();
		PromoCode temp = new PromoCode();
		
		temp.setMb_email(mb_email);
		temp.setPc_code(pc_code);
		result.setPromoCode(temp);
		try {
			session.save(result);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean delete(String mb_email, String pc_code) {
		session = sessionFactory.getCurrentSession();
		PromoCodeVO result = new PromoCodeVO();
        PromoCode temp = new PromoCode();
		
		temp.setMb_email(mb_email);
		temp.setPc_code(pc_code);
		result.setPromoCode(temp);
		try {
			session.delete(result);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
