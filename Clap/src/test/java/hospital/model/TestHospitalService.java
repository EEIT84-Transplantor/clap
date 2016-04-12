package hospital.model;


import static org.junit.Assert.*;

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

import shopping.model.CartHibernateDAO;
import shopping.model.CartVO;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestHospitalService {

	private HospitalService hospitalService;
	private HospitalVO hospitalVO;
	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;
	
	
	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		hospitalService = (HospitalService) context.getBean("hospitalService");
		sessionFactory=(SessionFactory) context.getBean("sessionFactory");
		session=sessionFactory.getCurrentSession();
		hospitalVO = new HospitalVO();
		hospitalVO.setName("hahaha");
		hospitalVO.setAddress("QQQ");
	}
	
	@Test
	public void getHospital(){
    	transaction = session.beginTransaction();
    	int actual = hospitalService.getHospital().size();
    	int expected = 4;
    	assertEquals(expected, actual);
    	transaction.commit();
    }
    
	@Test
	public void getHospital1(){
		transaction = session.beginTransaction();
    	String actual = hospitalService.getHospital(1).getName();
    	String expected = "NTUH";
    	assertEquals(expected, actual);
    	transaction.commit();
    }
    
	@Test
	public void insertHospital(){
    	transaction = session.beginTransaction();
    	String actual =hospitalService.insertHospital(hospitalVO).getName();
    	String expected = "hahaha";
    	assertEquals(expected, actual);
    	transaction.commit();
    }
}
