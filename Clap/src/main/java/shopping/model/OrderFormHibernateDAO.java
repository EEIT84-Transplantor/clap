package shopping.model;

import java.util.List;

import org.apache.commons.io.filefilter.OrFileFilter;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class OrderFormHibernateDAO implements OrderFormDAO {

	private SessionFactory sessionFactory;
	private Session session;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Boolean insert(OrderFormVO orderFormVO) {
		try {
			session = sessionFactory.getCurrentSession();
			session.save(orderFormVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean delete(Integer id) {
		try {
			session = sessionFactory.getCurrentSession();
			OrderFormVO orderFormVO = new OrderFormVO();
			orderFormVO.setId(id);
			session.delete(orderFormVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean update(OrderFormVO OrderFormVO) {
		try {
			session = sessionFactory.getCurrentSession();
			session.update(OrderFormVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<OrderFormDAO> select() {
		try {
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from OrderFormVO");
			List<OrderFormDAO> list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public OrderFormVO select(Integer id) {
		try {
			session = sessionFactory.getCurrentSession();
			OrderFormVO orderFormVO = session.get(OrderFormVO.class, id);
			return orderFormVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
