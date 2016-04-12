package hospital.model;

import static org.junit.Assert.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestDoctorHibernateDAO {
	

	private DoctorDAO doctorDAO;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	private DoctorVO doctorVO;
	
	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		doctorDAO = (DoctorDAO) context.getBean("doctorDAO");
		sessionFactory=(SessionFactory) context.getBean("sessionFactory");
		session=sessionFactory.getCurrentSession();
		doctorVO = new DoctorVO();
		doctorVO.setName("sss");
	}
	
	@Test
	public void selectAll() {
		transaction=session.beginTransaction();
		int expected=3;
		int actual = doctorDAO.selectAll().size();
		assertEquals(expected, actual);
		transaction.commit();
	}

	@Test
	public void selectById() {
        transaction = session.beginTransaction();
        String actual = doctorDAO.selectById(1).getName();
        String expected="Dr. Wu";
        assertEquals(expected, actual);
        transaction.commit();
	}

	@Test
	public void insert() {
       transaction = session.beginTransaction();
       String actual = doctorDAO.insert(doctorVO).getName();
       String expected="sss";
       assertEquals(expected, actual);
       transaction.commit();    
	}
}
