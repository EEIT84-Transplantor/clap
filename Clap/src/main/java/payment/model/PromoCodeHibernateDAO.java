package payment.model;

import java.util.List;

import javax.persistence.EmbeddedId;
import javax.persistence.ManyToOne;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.dao.support.DaoSupport;

public class PromoCodeHibernateDAO implements PromoCodeDAO{
	
	private static void main(String[] args) {
		
	}

	private SessionFactory sessionFactory;
	private Session session;
	final private String SELECT_ALL = "from PromoCodeVO";
	final private String SELECT_ALL_BY_EMAIL = "from PromoCodeVO where mb_email=?";
	
	
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
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL_BY_EMAIL);
		query.setParameter(0, mb_email);
		result = query.list();
		return result;
	}

	@Override
	public PromoCodeVO insert(PromoCode promoCode) {
		session = sessionFactory.getCurrentSession();
		PromoCodeVO result;
		try {
			result = new PromoCodeVO();
			result.setPromoCode(promoCode);
			session.save(result);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean delete(String mb_email, String pm_code) {
		session = sessionFactory.getCurrentSession();
		
        PromoCode temp = new PromoCode();
		temp.setMb_email(mb_email);
		temp.setPm_code(pm_code);
		PromoCodeVO result = session.get(PromoCodeVO.class, temp);
		try {
			session.delete(result);
			System.out.println(result);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
