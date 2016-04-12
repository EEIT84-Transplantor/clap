package shopping.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import junit.framework.TestCase;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestCartService extends TestCase{
    
	private CartService cartService;
	private CartVO cartVO;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	
	@Before
	protected void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		cartService = (CartService) context.getBean("cartService");
		sessionFactory=(SessionFactory) context.getBean("sessionFactory");
		sessionFactory=(SessionFactory) context.getBean("sessionFactory");
		session=sessionFactory.getCurrentSession();
		
		cartVO=new CartVO();
		cartVO.setEmail("lee@gmail.com");
		cartVO.setProduct_id(1);
		cartVO.setQuantity(4);
	}
//	@Test
//	public void testagetCart(){
//		transaction=session.beginTransaction();
//		int actual = cartService.getCart("lee@gmail.com").size();
//		int expected = 1;
//		assertEquals(expected, actual);
//		transaction.commit();
//	}
//	@Test
//	public void testbsetCart(){
//		transaction=session.beginTransaction();
//		boolean actual = cartService.setCart(cartVO);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
//	}
//	@Test
//	public void testcupdateCart1(){
//		transaction=session.beginTransaction();
//		boolean actual = cartService.updateCart("lee@gmail.com",1,9);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
//	}
//	
//	@Test
//	public void testdcremoveCart(){
//		transaction=session.beginTransaction();
//		boolean actual = cartService.removeCart("lee@gmail.com",1);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
//	}
//	
//	@Test
//	public void testesetCart1(){
//		transaction=session.beginTransaction();
//		boolean actual = cartService.setCart("poan@gmail.com",1,5);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
//	}
//
//	@Test
//	public void testfupdateCart(){
//		transaction=session.beginTransaction();
//		cartVO=new CartVO();
//		cartVO.setEmail("lee@gmail.com");
//		cartVO.setProduct_id(1);
//		cartVO.setQuantity(4);
//		boolean actual = cartService.updateCart(cartVO);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
//	}
//	
//	@Test
//	public void testgremoveCart1(){
//		transaction=session.beginTransaction();
//		boolean actual = cartService.removeCart("lee@gmail.com");
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
//	}

	
	@Test
	public void testgetTotalAmount(){
		transaction=session.beginTransaction();
		Double actual = cartService.getTotalAmount(cartVO);
		Double expected = 400.0;
		assertEquals(expected, actual);
		transaction.commit();
	}
	
	@Test
	public void testgetTotalAmount1(){
		transaction=session.beginTransaction();
		Double actual = cartService.getTotalAmount(cartVO.getEmail(), "333", 500.0);
		Double expected = 350.0;
		assertEquals(expected, actual);
		transaction.commit();
	}
	
	@Test
	public void testgetCartList(){
		transaction=session.beginTransaction();
		String actual = cartService.getCartList(cartVO).get(0);
		String expected = "product1";
		assertEquals(expected, actual);
		transaction.commit();
	}
	
}
