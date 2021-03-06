package shopping.model;

import java.util.List;
import java.util.Queue;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class OrderDetailHibernateDAO implements OrderDetailDAO {

	private SessionFactory sessionFactory;
	private OrderDetailVO orderDetailVO;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Boolean insert(OrderDetailVO orderDetailVO) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(orderDetailVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean delete(Integer id, Integer product_id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("delete from OrderDetailVO where id = ? and product_id = ?");
			query.setParameter(0, id);
			query.setParameter(1, product_id);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean update(OrderDetailVO orderDetailVO) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(orderDetailVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<OrderDetailVO> select() {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from OrderDetailVO");
			List<OrderDetailVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public OrderDetailVO selectById(Integer id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			return session.get(OrderDetailVO.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<OrderDetailVO> select(Integer orderform_id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from OrderDetailVO where orderform_id=?");
			query.setParameter(0, orderform_id);
			List<OrderDetailVO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


}
