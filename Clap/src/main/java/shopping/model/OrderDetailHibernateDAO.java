package shopping.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class OrderDetailHibernateDAO implements OrderDetailDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Boolean insert(OrderDetailVO OrderDetailVO) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(OrderDetailVO);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Boolean delete(Integer id, Integer pd_id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			OrderDetailVO orderDetailVO = new OrderDetailVO();
			orderDetailVO.setId(id);
			orderDetailVO.setPd_Id(pd_id);
			session.delete(orderDetailVO);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Boolean update(OrderDetailVO OrderDetailVO) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(OrderDetailVO);
			return true;
		} catch (Exception e) {
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
			return null;
		}
	}

	@Override
	public OrderDetailVO select(Integer id, Integer pd_id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			OrderDetailVO orderDetailVO = new OrderDetailVO();
			orderDetailVO.setId(id);
			orderDetailVO.setPd_Id(pd_id);
			orderDetailVO = session.get(OrderDetailVO.class, orderDetailVO);
			return orderDetailVO;
		} catch (Exception e) {
			return null;
		}
	}

}
