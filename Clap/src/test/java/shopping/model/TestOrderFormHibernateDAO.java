package shopping.model;

import static org.junit.Assert.assertEquals;

import java.sql.Date;
import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import component.email.EmailconfirmCode;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestOrderFormHibernateDAO {

	private SessionFactory sessionFactory;
	private Session session;
	private OrderFormHibernateDAO orderFormHibernateDAO;
	private Object expected;
	private Object actual;
	
	private OrderFormVO orderFormVO;
	private Integer id = 33;
	private String mb_email = "poan@gmail.com";
	private Integer total = 99999;

	@Before
	public void setUp() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		orderFormHibernateDAO = (OrderFormHibernateDAO) applicationContext.getBean("orderFormHibernateDAO");
		sessionFactory = (SessionFactory) applicationContext.getBean("sessionFactory");
		session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		orderFormVO = new OrderFormVO();
		orderFormVO.setMb_email(mb_email);
		orderFormVO.setStatus(new Byte("1"));
		orderFormVO.setTime(new Timestamp(new java.util.Date().getTime()));
		orderFormVO.setTotal(total);		
	}
	
	@After
	public void tearDown() {
		session.getTransaction().commit();
	}
	
//	@Test
//	public void testAInsert() {
//		expected = mb_email;
//		orderFormHibernateDAO.insert(orderFormVO);
//		actual = orderFormHibernateDAO.select(id).getMb_email();
//		assertEquals(expected, actual);
//	};
//
//	@Test
//	public void testBUpdate() {
//		expected = "lee@gmail.com";
//		orderFormVO.setId(id);
//		orderFormVO.setMb_email("lee@gmail.com");
//		System.out.println(orderFormHibernateDAO.update(orderFormVO));
//		actual = orderFormHibernateDAO.select(id).getMb_email();
//		assertEquals(expected, actual);
//	};
//
//	@Test
//	public void testCSelect() {
//		expected = id;
//		actual = orderFormHibernateDAO.select(id).getId();
//		assertEquals(expected, actual);
//	};

	@Test
	public void testDDelete() {
		Boolean expected = true;
		Boolean actual = orderFormHibernateDAO.delete(id);
		assertEquals(expected, actual);
	};
//
//	@Test
//	public void testSelect2() {
//		expected=true;
//		actual=orderFormHibernateDAO.select().size()>10;
//		assertEquals(expected, actual);
//	};
//	
//	@Test
//	public void testManyToOne(){
//		
//		expected="NCKUH";
//		actual=orderFormHibernateDAO.select(2).getHospitalVO().getName();
//		assertEquals(expected, actual);
//	}
//	
//	@Test
//	public void testSelectByEmail(){
//		expected = 8;
//		actual=orderFormHibernateDAO.select(mb_email).size();
//		assertEquals(expected, actual);
//	}

}

















