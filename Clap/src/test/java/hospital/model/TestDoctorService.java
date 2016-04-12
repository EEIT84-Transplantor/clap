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
public class TestDoctorService {
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction transaction;
    private DoctorService doctorService;
    private DoctorVO doctorVO;
	
	@Before
	public void setUp(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		doctorService = (DoctorService)context.getBean("doctorService");
		sessionFactory = (SessionFactory)context.getBean("sessionFactory");
		session = sessionFactory.getCurrentSession();
		doctorVO = new DoctorVO();
		doctorVO.setName("haha");
	}
	
	@Test
	public void testGetDoctors(){
		transaction = session.beginTransaction();
		int actual = doctorService.getDoctors().size();
		int expected = 2;
		assertEquals(expected, actual);
		transaction.commit();
	}
	
	@Test
	public void testGetDoctor(){
		transaction = session.beginTransaction();
		String actual = doctorService.getDoctor(1).getName();
		String expected = "Dr. Wu";
		assertEquals(expected, actual);
		transaction.commit();
	}
	
	@Test
	public void testInsertDoctor(){
		transaction = session.beginTransaction();
		String actual = doctorService.insertDoctor(doctorVO).getName();
		String expected = "haha";
		assertEquals(expected, actual);
		transaction.commit();
	}
}
