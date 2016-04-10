package shopping.model;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.persistence.Column;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestOrderDetailHibernateDAO {

	private SessionFactory sessionFactory;
	private Session session;
	private Object expected;
	private Object actual;

	private OrderDetailHibernateDAO orderDetailHibernateDAO;
	private OrderDetailVO orderDetailVO;
	private Integer id=999;
	private Integer pd_id=5;
	private Integer ct_quantity=10;

	@Before
	public void setUp() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		sessionFactory = (SessionFactory) applicationContext.getBean("sessionFactory");
		orderDetailHibernateDAO = (OrderDetailHibernateDAO) applicationContext.getBean("orderDetailHibernateDAO");
		orderDetailVO = new OrderDetailVO();
	}

	@Test
	public void ainsert() {
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		expected=true;
		orderDetailVO.setId(id);
		orderDetailVO.setPd_Id(pd_id);
		actual=orderDetailHibernateDAO.insert(orderDetailVO);
		
		session.getTransaction().commit();
		assertEquals(expected, actual);
	}

	@Test
	public void bselect() {
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		expected=id;
		actual=orderDetailHibernateDAO.select(id, pd_id).getId();

		session.getTransaction().commit();
		assertEquals(expected, actual);
	}

	@Test
	public void cupdate() {
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();

		expected=true;
		orderDetailVO.setId(id);
		orderDetailVO.setPd_Id(pd_id);
		orderDetailVO.setCt_quantity(ct_quantity);
		actual=orderDetailHibernateDAO.update(orderDetailVO);
		
		session.getTransaction().commit();
		assertEquals(expected, actual);
	}

	@Test
	public void delete() {
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		expected=true;
		actual=orderDetailHibernateDAO.delete(id, pd_id);

		session.getTransaction().commit();
		assertEquals(expected, actual);
	}

	@Test
	public void eselect2() {
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();

		session.getTransaction().commit();
		assertEquals(expected, actual);
	}

}
