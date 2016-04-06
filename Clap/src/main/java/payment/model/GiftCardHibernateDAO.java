package payment.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import member.model.MemberVO;

public class GiftCardHibernateDAO implements GiftCardDAO{

	private SessionFactory sessionFactory;
	private Session session;
	final private String SELECT_ALL = "from GiftCardVO";

	public GiftCardHibernateDAO() {
		
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public List<GiftCardVO> selectAll() {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		List<GiftCardVO> result = query.list();
		return result;
	}

	@Override
	public GiftCardVO selectByGcNumber(String gc_number) {
		session = sessionFactory.getCurrentSession();
		GiftCardVO result = session.get(GiftCardVO.class, gc_number);
		return result;
	}

	@Override
	public GiftCardVO insert(GiftCardVO giftCardVO) {
		session = sessionFactory.getCurrentSession();
		GiftCardVO result = new GiftCardVO();
		try {
			session.save(result);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean update(GiftCardVO giftCardVO) {
		session = sessionFactory.getCurrentSession();
		try {
			session.update(giftCardVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(String gc_number) {
		session = sessionFactory.getCurrentSession();
		GiftCardVO result = session.get(GiftCardVO.class, gc_number);
		try {
			session.delete(result);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
