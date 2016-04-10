package shopping.model;

import java.util.List;

import org.apache.commons.io.filefilter.OrFileFilter;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class OrderFormHibernateDAO implements OrderFormDAO{

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Boolean insert(OrderFormDAO orderFormDAO) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(orderFormDAO);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Boolean delete(Integer id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			OrderFormVO orderFormVO = new OrderFormVO();
			orderFormVO.setId(id);
			session.delete(orderFormVO);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Boolean update(OrderFormDAO OrderFormDAO) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(OrderFormDAO);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<OrderFormDAO> select() {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from OrderFormVO");
			List<OrderFormDAO> list = query.list();
			return list;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public OrderFormVO select(Integer id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			OrderFormVO orderFormVO = session.get(OrderFormVO.class, id);
			return orderFormVO;
		} catch (Exception e) {
			return null;
		}
	}

}
