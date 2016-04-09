package cart.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import junit.framework.TestCase;

public class TestCartHibernateDAO extends TestCase {

	private CartHibernateDAO cartHibernateDAO;
	private CartVO cartVO;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;

	@Override
	protected void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		cartHibernateDAO = (CartHibernateDAO) context.getBean("cartDAO");
		sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		session = sessionFactory.getCurrentSession();

		cartVO = new CartVO();
		cartVO.setEmail("test" + (int) Math.random() * 10000 + "@gmail.com");
		cartVO.setId(900001);
		cartVO.setQuantity(5);
	}

	@Override
	protected void tearDown() throws Exception {
		cartHibernateDAO = null;
	}

	public void testSelectByEmail() {
		transaction = session.beginTransaction();
		int expected = 2;
		int actual = cartHibernateDAO.selectByEmail("caca@gmail.com").size();
		assertEquals(expected, actual);
		transaction.commit();
	}

	public void testInsert() {
		transaction = session.beginTransaction();
		cartHibernateDAO.insert(cartVO);
		CartVO expected = cartVO;
		CartVO actual = cartHibernateDAO.selectByEmail(cartVO.getEmail()).get(0);
		assertEquals(expected, actual);
		transaction.commit();
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
