package hospital.model;

import static org.junit.Assert.*;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import shopping.model.CartHibernateDAO;
import shopping.model.CartService;
import shopping.model.CartVO;
@FixMethodOrder
public class TestHospitalHibernateDAO {
	

	private HospitalDAO hospitalDAO;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	private HospitalVO hospitalVO;
	
	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		hospitalDAO = (HospitalDAO) context.getBean("hospitalDAO");
		sessionFactory=(SessionFactory) context.getBean("sessionFactory");
		session=sessionFactory.getCurrentSession();
		hospitalVO = new HospitalVO();
		hospitalVO.setName("hahaha");
		hospitalVO.setAddress("taipei");
	}
	
	@Test
	public void selectAll() {
		transaction=session.beginTransaction();
		int expected=3;
		int actual = hospitalDAO.selectAll().size();
		assertEquals(expected, actual);
		transaction.commit();
	}

	@Test
	public void selectById() {
        transaction = session.beginTransaction();
        String actual = hospitalDAO.selectById(1).getName();
        String expected="NTUH";
        assertEquals(expected, actual);
        transaction.commit();
	}

	@Test
	public void insert() {
       transaction = session.beginTransaction();
       String actual = hospitalDAO.insert(hospitalVO).getName();
       String expected="hahaha";
       assertEquals(expected, actual);
       transaction.commit();
       
	}
}
