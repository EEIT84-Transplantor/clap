package inventory.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import payment.model.PromoCodeVO;
import payment.model.PromoVO;


public class InOutLogHibernateDAO implements InOutLogDAO {
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session session;
	final private String SELECT_ALL = "from InOutLogVO";
	
	@Override
	public List<InOutLogVO> selectAll(){
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		List<InOutLogVO> inOutLogVOs = query.list();
		return inOutLogVOs;
	};

	final private String SELECT_BY_PRODUCT_ID="from InOutLogVO where pd_id=?";
	@Override
	public List<InOutLogVO> selectByProductId(String productId){		
		session = sessionFactory.getCurrentSession();
		List<InOutLogVO> inOutLogVOs = null;
		Query query = session.createQuery(SELECT_BY_PRODUCT_ID);
		query.setParameter(0, productId);
		inOutLogVOs = query.list();
		return inOutLogVOs;
	};

	@Override
	public InOutLogVO insert(InOutLogVO inOutLogVO){
		session = sessionFactory.getCurrentSession();
		try {
			session.save(inOutLogVO);
			return inOutLogVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	};

	@Override
	public boolean update(InOutLogVO inOutLogVO){
		session = sessionFactory.getCurrentSession();
		try {
			session.update(inOutLogVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(String id) {
		session = sessionFactory.getCurrentSession();
		InOutLogVO inOutLogVO = new InOutLogVO();
		inOutLogVO.setId(id);
		try {
			session.delete(inOutLogVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	};
	
}
