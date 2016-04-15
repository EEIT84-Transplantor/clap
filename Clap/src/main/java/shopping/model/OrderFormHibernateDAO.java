package shopping.model;

import java.util.ArrayList;
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
			OrderFormVO orderFormVO = select(id);
			session.delete(orderFormVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean update(OrderFormVO orderFormVO) {
		try {
			session = sessionFactory.getCurrentSession();
			session.update(orderFormVO);
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
	
	//選取某會員所有的orderform
	public List<OrderFormVO> select(String email) {
		try {
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from OrderFormVO where mb_email=?");
			query.setParameter(0, email);
			List<OrderFormVO> orderList = query.list();
			return orderList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}	
}











