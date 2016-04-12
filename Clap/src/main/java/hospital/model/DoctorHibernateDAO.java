package hospital.model;

import java.util.List;

import javax.persistence.criteria.From;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class DoctorHibernateDAO implements DoctorDAO{
    private SessionFactory sessionFactory;
    private Session session;
    private final String SELECT_ALL = "from DoctorVO";
    
	public DoctorHibernateDAO() {
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<DoctorVO> selectAll() {
		List<DoctorVO> result = null;
		session = sessionFactory.getCurrentSession();
		result = session.createQuery(SELECT_ALL).list();
		return result;
	}

	@Override
	public DoctorVO selectById(Integer id) {
		DoctorVO result = null;
		session = sessionFactory.getCurrentSession();
		result = session.get(DoctorVO.class, id);
		return result;
	}

	@Override
	public DoctorVO insert(DoctorVO doctorVO) {
		DoctorVO result = null;
		session = sessionFactory.getCurrentSession();
		try {
			session.save(doctorVO);
			result = doctorVO;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
