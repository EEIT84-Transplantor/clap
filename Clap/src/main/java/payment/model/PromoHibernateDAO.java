package payment.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class PromoHibernateDAO implements PromoDAO{

	private SessionFactory sessionFactory;
	private Session session;
	final private String SELECT_ALL = "from PromoVO";

	public PromoHibernateDAO() {
		
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<PromoVO> selectAll() {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		List<PromoVO> result = query.list();
		return result;
	}

	@Override
	public PromoVO selectByCode(String pm_code) {
		session = sessionFactory.getCurrentSession();
		PromoVO result = session.get(PromoVO.class, pm_code);
		return result;
	}

	@Override
	public PromoVO insert(PromoVO promoVO) {
        session = sessionFactory.getCurrentSession();
		
		try {
			session.save(promoVO);
			return promoVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean update(PromoVO promoVO) {
        session = sessionFactory.getCurrentSession();
		
		try {
			session.update(promoVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(String pm_code) {
		session = sessionFactory.getCurrentSession();
		PromoVO result = session.get(PromoVO.class, pm_code);
		try {
			session.delete(result);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
