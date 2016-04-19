package shopping.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Id;

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
public class TestOrderDetailService extends TestCase {

	private OrderDetailService orderDetailService;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	private Object expected;
	private Object actual;

	private Integer product_id;
	private Integer ct_quantity;
	private Integer doctor_id;
	private Integer orderform_id=3;
	private Timestamp orderdetail_surgerytime;
	
	@Before
	protected void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		orderDetailService = (OrderDetailService) context.getBean("orderDetailService");
		sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		
		
		
		
		
		session = sessionFactory.getCurrentSession();
		transaction = session.beginTransaction();	
	}

	@After
	protected void tearDown() throws Exception {
		transaction.commit();
	};

	@Test
	public void testaGetOrderDetailList() {
		expected = 1;
		actual = orderDetailService.getOrderDetailList(1).size();
		assertEquals(expected, actual);
	}

	@Test
	public void testbSetOrderDetail() {
		expected = 1;
		CartVO cartVO = new CartVO();
		cartVO.setEmail("andrew@gmail.com");
		cartVO.setProduct_id(5);
		cartVO.setQuantity(3);
		orderDetailService.setOrderDetail(orderform_id, cartVO);
		actual = orderDetailService.getOrderDetailList(orderform_id).size();
		assertEquals(expected, actual);
	}
	
}
