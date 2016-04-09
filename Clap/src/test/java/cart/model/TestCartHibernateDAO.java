package cart.model;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import junit.framework.TestCase;

public class TestCartHibernateDAO extends TestCase{
	
	private CartHibernateDAO cartHibernateDAO;
	private CartVO cartVO;
	
	@Override
	protected void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		cartHibernateDAO = (CartHibernateDAO) context.getBean("cartDAO");
		
		cartVO=new CartVO();
		cartVO.setEmail("may@gmail.com");
		cartVO.setId(900001);
		cartVO.setQuantity(5);
	}

	@Override
	protected void tearDown() throws Exception {
		cartHibernateDAO=null;
	}
	
	public void testSelectByEmail() {
		int expected=2;
		int actual= cartHibernateDAO.selectByEmail("caca@gmail.com").size();
		
		assertEquals(expected, actual);
	}
	
	public void testInsert() {
		String expected="";
		String actual= cartHibernateDAO.insert(cartVO).toString();
		
		assertEquals(expected, actual);
	}
	public void testInsert1() {
		
	}
	public void testUpdate() {
		
	}
	public void testUpdate1() {
		
	}
	public void testDelete() {
		
	}
	public void testDelete1() {
		
	}
	

	
}
