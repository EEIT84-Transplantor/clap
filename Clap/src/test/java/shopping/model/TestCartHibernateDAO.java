package shopping.model;

import java.util.List;

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
public class TestCartHibernateDAO extends TestCase{
	
	private CartHibernateDAO cartHibernateDAO;
	private CartVO cartVO;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	
	@Before
	protected void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		cartHibernateDAO = (CartHibernateDAO) context.getBean("cartDAO");
		sessionFactory=(SessionFactory) context.getBean("sessionFactory");
		session=sessionFactory.getCurrentSession();
		
		cartVO=new CartVO();
		cartVO.setEmail("lee@gmail.com");
		cartVO.setProduct_id(2);
		cartVO.setQuantity(5);
	}
    @Test
	public void testaSelectByEmail() {
		transaction=session.beginTransaction();
		int expected=2;
		List<CartVO> ss = cartHibernateDAO.selectByEmail("caca@gmail.com");
		int actual= ss.size();
		
		assertEquals(expected, actual);
		transaction.commit();
	}
    @Test
	public void testbInsert() {
		transaction=session.beginTransaction();
		int temp = 7;
		int actual = cartHibernateDAO.insert("lee@gmail.com",2,temp).getQuantity();
		int expected = temp;
		assertEquals(expected, actual);
		
		transaction.commit();
	}
//    @Test
//	public void testcUpdate() {
//		transaction=session.beginTransaction();
//		boolean actual = cartHibernateDAO.update(cartVO);
//		boolean expected = true;
//		
//		assertEquals(expected, actual);
//		
//
//		transaction.commit();
//	}
    @Test
	public void testdDelete() {
		transaction=session.beginTransaction();
		boolean actual = cartHibernateDAO.delete("lee@gmail.com");
		boolean expected = true;
		assertEquals(expected, actual);
		transaction.commit();
	}
    @Test
	public void testeInsert1() {
		transaction=session.beginTransaction();
		int temp = 3;
		cartVO.setEmail("lee@gmail.com");
		cartVO.setProduct_id(1);
		cartVO.setQuantity(temp);
		int actual = cartHibernateDAO.insert(cartVO).getQuantity();
		int expected = temp;
		assertEquals(expected, actual);
		transaction.commit();
	}
//    @Test
//	public void testfUpdate1() {
//		transaction=session.beginTransaction();
//		cartVO.setEmail("caca@gmail.com");
//		cartVO.setProduct_id(1);
//		cartVO.setQuantity(5);
//		boolean actual = cartHibernateDAO.update(cartVO);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
//	}

    @Test
	public void testDelete1() {
		cartVO=new CartVO();
		cartVO.setEmail("lee@gmail.com");
		cartVO.setProduct_id(1);
		transaction=session.beginTransaction();
		boolean actual = cartHibernateDAO.delete(cartVO.getEmail(),cartVO.getProduct_id());
		boolean expected = true;
		assertEquals(expected, actual);
		transaction.commit();
	}
	
    @Test
    public void testgselectAll() {
    	transaction=session.beginTransaction();
		int actual = cartHibernateDAO.selectAll().size();
		int expected = 3;
		assertEquals(expected, actual);
		transaction.commit();
	}
}
