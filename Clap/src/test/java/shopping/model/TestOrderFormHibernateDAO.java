package shopping.model;

import static org.junit.Assert.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestOrderFormHibernateDAO {

	private OrderFormHibernateDAO orderFormHibernateDAO;
	private OrderFormVO orderFormVO;
	private SessionFactory sessionFactory;
	private Session session;

	@Before
	public void setUp() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		sessionFactory = (SessionFactory) applicationContext.getBean("sessionFactory");
		orderFormHibernateDAO = (OrderFormHibernateDAO) applicationContext.getBean("orderFormHibernateDAO");
		orderFormVO = new OrderFormVO();
		orderFormVO.setId(999);
	}

	@Test
	public void testInsert() {
		Integer expected = orderFormVO.getId();
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		System.out.println(orderFormHibernateDAO.insert(orderFormVO));
		orderFormVO = orderFormHibernateDAO.select(orderFormVO.getId());
		session.getTransaction().commit();
		Integer actual = orderFormVO.getId();
		assertEquals(expected, actual);
	};

	@Test
	public void testDelete() {
	};

	@Test
	public void testUpdate() {
	};

	@Test
	public void testSelect() {
	};

	@Test
	public void testSelect2() {
	};

}
