package shopping.model;

import java.sql.Timestamp;

import javax.persistence.Column;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import junit.framework.TestCase;
import payment.model.CreditCardVO;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestOrderFormService extends TestCase {

	private OrderFormService orderFormService;
	private OrderFormVO orderFormVO;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	private Object expected;
	private Object actual;

	private Integer id = 36;
	private String mb_email = "lee@gmail.com";
	private Timestamp time;
	private Double	total = 9999.0;
	private Byte status;

	@Before
	protected void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		orderFormService = (OrderFormService) context.getBean("orderFormService");
		sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		session = sessionFactory.getCurrentSession();
		transaction = session.beginTransaction();

		orderFormVO = new OrderFormVO();

	}

	@After
	protected void tearDown() throws Exception {
		transaction.commit();
	};

	@Test
	public void testaSetOrderForm() {
		expected = id;
		actual = orderFormService.setOrderForm(total, mb_email);
		assertEquals(expected, actual);
	}

	@Test
	public void testbRemoveOrder() {
		orderFormService.removeOrder(id);
		actual = orderFormService.getOrderById(id);
		assertNull(actual);
	}

	@Test
	public void testcGetOrderList() {
		expected = 2;
		actual = orderFormService.getOrderList(mb_email).size();
		assertEquals(expected, actual);
	}
	
	@Test
	public void testdGetOrderById(){
		expected=mb_email;
		actual=orderFormService.getOrderById(3).getMb_email();
		assertEquals(expected, actual);
	}

}
























