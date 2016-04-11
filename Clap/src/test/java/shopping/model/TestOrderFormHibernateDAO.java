package shopping.model;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.Calendar;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.*;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.*;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestOrderFormHibernateDAO {

	private SessionFactory sessionFactory;
	private Session session;
	private OrderFormHibernateDAO orderFormHibernateDAO;
	private Object expected;
	private Object actual;
	
	private OrderFormVO orderFormVO;
	private Integer id = 999;
	private String mb_email = "999@gmail.com";
	private Date time = new Date(new java.util.Date().getTime());
	private Integer total = 99999;
	private Byte os_id = 9;

	@Before
	public void setUp() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		orderFormHibernateDAO = (OrderFormHibernateDAO) applicationContext.getBean("orderFormHibernateDAO");
		orderFormVO = new OrderFormVO();
		sessionFactory = (SessionFactory) applicationContext.getBean("sessionFactory");
		session=sessionFactory.getCurrentSession();
		session.beginTransaction();
	}
	
	@After
	public void tearDown() {
		session.getTransaction().commit();
	}
	
	@Test
	public void testAInsert() {
		expected = id;
		orderFormVO.setId(id);
		orderFormHibernateDAO.insert(orderFormVO);
		actual = orderFormHibernateDAO.select(id).getId();
		assertEquals(expected, actual);
	};

	@Test
	public void testBUpdate() {
		expected = mb_email;
		orderFormVO.setId(id);
		orderFormVO.setMb_email(mb_email);
		orderFormHibernateDAO.update(orderFormVO);
		actual = orderFormHibernateDAO.select(id).getMb_email();
		assertEquals(expected, actual);
	};

	@Test
	public void testCSelect() {
		expected = id;
		actual = orderFormHibernateDAO.select(id).getId();
		assertEquals(expected, actual);
	};

	@Test
	public void testDDelete() {
		Boolean expected = true;
		Boolean actual = orderFormHibernateDAO.delete(id);
		assertEquals(expected, actual);
	};

	@Test
	public void testSelect2() {
		expected=true;
		actual=orderFormHibernateDAO.select().size()>10;
		assertEquals(expected, actual);
	};

}
