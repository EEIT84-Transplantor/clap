package shopping.model;

import java.util.List;

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
	public Boolean delete(Integer id, Integer pd_id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			OrderDetailPK orderDetailPK = new OrderDetailPK();
			orderDetailPK.setId(id);
			orderDetailPK.setPd_id(pd_id);
			orderDetailVO = session.get(OrderDetailVO.class, orderDetailPK);
			session.delete(orderDetailVO);
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
	public OrderDetailVO select(Integer id, Integer pd_id) {
		try {
			Session session = sessionFactory.getCurrentSession();
			OrderDetailPK orderDetailPK = new OrderDetailPK();
			orderDetailPK.setId(id);
			orderDetailPK.setPd_id(pd_id);
			OrderDetailVO orderDetailVO = session.get(OrderDetailVO.class, orderDetailPK);
			return orderDetailVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
