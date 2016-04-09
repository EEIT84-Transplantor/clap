package cart.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class CartHibernateDAO implements CartDAO {

	private SessionFactory sessionFactory;
	private Session session;
	
	public CartHibernateDAO() {
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	final private String SELECT_BY_EMAIL = "from CartVO where mb_email=?";
	
	
	@Override
	public List<CartVO> selectByEmail(String email) {
		List<CartVO> result = null;
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_BY_EMAIL);
		query.setParameter(0, email);
		result = query.list();
		return result;
	}

	@Override
	public CartVO insert(CartVO cartVO) {
		CartVO result = null;
		session = sessionFactory.getCurrentSession();
		try {
			result = session.get(CartVO.class, cartVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public CartVO insert(String email, int id, int quantity) {
		CartVO result = null;
		session = sessionFactory.getCurrentSession();
		try {
			CartVO temp = new CartVO();
			temp.setEmail(email);
			temp.setId(id);
			temp.setQuantity(quantity);
			result = session.get(CartVO.class, temp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean update(CartVO cartVO) {
		boolean result = false;
		session = sessionFactory.getCurrentSession();
		try {
			session.update(cartVO);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean update(String email, int id, int quantity) {
		boolean result = false;
		CartVO temp = new CartVO();
		temp.setEmail(email);
		temp.setId(id);
		temp.setQuantity(quantity);
		session = sessionFactory.getCurrentSession();
		try {
			session.update(temp);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean delete(String email, int id) {
		boolean result = false;
		CartVO temp = new CartVO();
		temp.setEmail(email);
		temp.setId(id);
		session = sessionFactory.getCurrentSession();
		try {
			session.delete(temp);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
