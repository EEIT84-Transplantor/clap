package shopping.model;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.persistence.Column;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.After;
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
	private Integer id=2;
	private Integer Product_id=2;
	private Integer ct_quantity=null;

	@Before
	public void setUp() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		sessionFactory = (SessionFactory) applicationContext.getBean("sessionFactory");
		orderDetailHibernateDAO = (OrderDetailHibernateDAO) applicationContext.getBean("orderDetailHibernateDAO");
		orderDetailVO = new OrderDetailVO();
		
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();
	}
	
	@After
	public void tearDown(){
		session.getTransaction().commit();
	}

//	@Test
//	public void ainsert() {
//		expected=true;
//		orderDetailVO.setId(id);
//		orderDetailVO.setProduct_id(Product_id);
//		actual=orderDetailHibernateDAO.insert(orderDetailVO);
//		assertEquals(expected, actual);
//	}
//
//	@Test
//	public void bselect() {
//		session = sessionFactory.getCurrentSession();
//		expected=id;
//		System.out.println(orderDetailHibernateDAO.select(id, Product_id));
//		actual=orderDetailHibernateDAO.select(id, Product_id).getId();
//		assertEquals(expected, actual);
//	}
//
//	@Test
//	public void cupdate() {
//		session = sessionFactory.getCurrentSession();
//		expected=true;
//		orderDetailVO.setId(id);
//		orderDetailVO.setProduct_id(Product_id);
//		orderDetailVO.setCart_quantity(ct_quantity);
//		actual=orderDetailHibernateDAO.update(orderDetailVO);
//		assertEquals(expected, actual);
//	}
//
//	@Test
//	public void delete() {
//		session = sessionFactory.getCurrentSession();
//		expected=true;
//		actual=orderDetailHibernateDAO.delete(id, Product_id);
//		assertEquals(expected, actual);
//	}

//	@Test
//	public void eselect2() {
//		session = sessionFactory.getCurrentSession();
//		expected=true;
//		actual=orderDetailHibernateDAO.select().size()>10;
//		System.out.println(orderDetailHibernateDAO.select().size());
//		assertEquals(expected, actual);
//	}
//	
//	@Test
//	public void testSelectById(){
//		expected=1;
//		actual=orderDetailHibernateDAO.select(1).size();
//		assertEquals(expected, actual);
//	}
	

}





















