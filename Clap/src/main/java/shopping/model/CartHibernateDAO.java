package shopping.model;

import java.util.List;

import member.model.MemberService;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CartHibernateDAO implements CartDAO {

	private SessionFactory sessionFactory;
	private Session session;
	final private String SELECT_ALL = "from CartVO"; 
	final private String SELECT_BY_EMAIL = "from CartVO where mb_email=?";
	final private String DELETE_BY_EMAIL = "delete from CartVO where mb_email=?";

	public CartHibernateDAO() {
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
    
	@Override
	public List<CartVO> selectAll(){
		List<CartVO> result = null;
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		result = query.list();
		return result;
	};
	
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
			session.save(cartVO);
			result = cartVO;
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
			temp.setProduct_id(id);
			temp.setQuantity(quantity);
			
			session.save(temp);
			result = temp;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public CartVO update(CartVO cartVO) {
		CartVO result = null;
		session = sessionFactory.getCurrentSession();
		try {
			session.update(cartVO);
			result = cartVO;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public CartVO update(String email, Integer id, Integer quantity) {
		CartVO result = null;
		CartVO temp = new CartVO();
		for(CartVO vo:selectByEmail(email)){
			if(vo.getProduct_id().equals(id)){
				temp = vo;
			}
		}
		
		temp.setQuantity(quantity);
		session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(temp);
			result = temp;
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
		temp.setProduct_id(id);
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
	public boolean delete(String email) {
		boolean result = false;
		int total = selectByEmail(email).size();
		session = sessionFactory.getCurrentSession();
		try {
			int temp = session.createQuery(DELETE_BY_EMAIL).setParameter(0, email).executeUpdate();
			if (temp == total) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
