package cart.model;

import java.util.List;

import member.model.MemberService;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CartHibernateDAO implements CartDAO {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CartDAO dao = (CartDAO) context.getBean("cartDAO");
		System.out.println("haha" + dao.selectByEmail("caca@gmail.com").size());
	}

	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	final private String SELECT_BY_EMAIL = "from CartVO where mb_email=?";
	final private String DELETE_ALL = "delete from CartVO";

	public CartHibernateDAO() {
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<CartVO> selectByEmail(String email) {
		List<CartVO> result = null;

		try {
			session = sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			Query query = session.createQuery(SELECT_BY_EMAIL);
			query.setParameter(0, email);
			result = query.list();
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}

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
	public CartVO insert(String email, Integer id, Integer quantity) {
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
	public boolean update(String email, Integer id, Integer quantity) {
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
	public boolean delete(String email, Integer id) {
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

	@Override
	public boolean delete() {
		boolean result = false;
		session = sessionFactory.getCurrentSession();
		try {
			int temp = session.createQuery(DELETE_ALL).executeUpdate();
			if (temp == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
