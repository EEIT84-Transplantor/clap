package shopping.model;

import java.util.List;

import org.hibernate.SessionFactory;

public class OrderDetailHibernateDAO implements OrderDetailDAO{

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Boolean insert(OrderDetailVO orderDetailVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean delete(Integer id, Integer pd_Id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean update(OrderDetailVO orderDetailVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderDetailVO> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderDetailVO select(Integer id, Integer pd_Id) {
		// TODO Auto-generated method stub
		return null;
	}

}
