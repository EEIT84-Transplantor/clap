package shopping.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import junit.framework.TestCase;

public class TestCartService extends TestCase{
    
	private CartService cartService;
	private CartVO cartVO;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	
	@Override
	protected void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		cartService = (CartService) context.getBean("cartService");
		sessionFactory=(SessionFactory) context.getBean("sessionFactory");
		session=sessionFactory.getCurrentSession();
		
		cartVO=new CartVO();
		cartVO.setEmail("caca@gmail.com");
		cartVO.setId(3);
		cartVO.setQuantity(4);
	}

	@Override
	protected void tearDown() throws Exception {
		cartService = null;
	}
	
	public void testgetCart(){
//		transaction=session.beginTransaction();
//		int actual = cartService.getCart("lee@gmail.com").size();
//		int expected = 2;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	
	public void testsetCart(){
//		transaction=session.beginTransaction();
//		boolean actual = cartService.setCart(cartVO);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	
	public void testsetCart1(){
//		transaction=session.beginTransaction();
//		boolean actual = cartService.setCart("lee@gmail.com",3,5);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
	}

	public void testremoveCart(){
//		transaction=session.beginTransaction();
//		boolean actual = cartService.removeCart("lee@gmail.com",3);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
	}

	public void testremoveCart1(){
//		transaction=session.beginTransaction();
//		boolean actual = cartService.removeCart("lee@gmail.com");
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	
	public void testupdateCart(){
//		transaction=session.beginTransaction();
//		cartVO=new CartVO();
//		cartVO.setEmail("lee@gmail.com");
//		cartVO.setId(3);
//		cartVO.setQuantity(4);
//		boolean actual = cartService.updateCart(cartVO);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	
	public void testupdateCart1(){
//		transaction=session.beginTransaction();
//		boolean actual = cartService.updateCart("lee@gmail.com",2,9);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	
	public void getTotalAmount(){
		//等產品好再測
	}
	
	public void getTotalAmount1(){
		//等產品好再測
	}
}
