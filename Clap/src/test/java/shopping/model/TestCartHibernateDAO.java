package shopping.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import junit.framework.TestCase;

public class TestCartHibernateDAO extends TestCase{
	
	private CartHibernateDAO cartHibernateDAO;
	private CartVO cartVO;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	
	@Override
	protected void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		cartHibernateDAO = (CartHibernateDAO) context.getBean("cartDAO");
		sessionFactory=(SessionFactory) context.getBean("sessionFactory");
		session=sessionFactory.getCurrentSession();
		
		cartVO=new CartVO();
		cartVO.setEmail("lee@gmail.com");
		cartVO.setId(1);
		cartVO.setQuantity(5);
	}

	@Override
	protected void tearDown() throws Exception {
		cartHibernateDAO=null;
	}
	
	public void testSelectByEmail() {
//		transaction=session.beginTransaction();
//		int expected=2;
//		int actual= cartHibernateDAO.selectByEmail("caca@gmail.com").size();
//		
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	
	public void testInsert() {
//		transaction=session.beginTransaction();
//		int temp = 7;
//		int actual = cartHibernateDAO.insert("lee@gmail.com",2,temp).getQuantity();
//		int expected = temp;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	public void testInsert1() {
//		transaction=session.beginTransaction();
//		int temp = 3;
//		cartVO.setEmail("lee@gmail.com");
//		cartVO.setId(2);
//		cartVO.setQuantity(temp);
//		int actual = cartHibernateDAO.insert(cartVO).getQuantity();
//		int expected = temp;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	public void testUpdate() {
//		transaction=session.beginTransaction();
//		boolean actual = cartHibernateDAO.update(cartVO);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	public void testUpdate1() {
//		transaction=session.beginTransaction();
//		cartVO.setEmail("caca@gmail.com");
//		cartVO.setId(2);
//		cartVO.setQuantity(3);
//		boolean actual = cartHibernateDAO.update(cartVO);
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
    public void testselectAll() {
//    	transaction=session.beginTransaction();
//		int actual = cartHibernateDAO.selectAll().size();
//		int expected = 3;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	
	public void testDelete() {
//		transaction=session.beginTransaction();
//		boolean actual = cartHibernateDAO.delete("lee@gmail.com");
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	public void testDelete1() {
//		cartVO=new CartVO();
//		cartVO.setEmail("lee@gmail.com");
//		cartVO.setId(1);
//		transaction=session.beginTransaction();
//		boolean actual = cartHibernateDAO.delete(cartVO.getEmail(),cartVO.getId());
//		boolean expected = true;
//		assertEquals(expected, actual);
//		transaction.commit();
	}
	

	
}
