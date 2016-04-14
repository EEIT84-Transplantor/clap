package hospital.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class HospitalHibernateDAO implements HospitalDAO{
    private SessionFactory sessionFactory;
    private Session session;
    final private String SELECT_ALL = "from HospitalVO"; 
	
	public HospitalHibernateDAO() {
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<HospitalVO> selectAll() {
		List<HospitalVO> result = null;
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		result = query.list();
		return result;
	}

	@Override
	public HospitalVO selectById(Integer id) {
		HospitalVO result = null;
		session = sessionFactory.getCurrentSession();
		try {
			result = session.get(HospitalVO.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public HospitalVO insert(HospitalVO hospitalVO) {
		HospitalVO result = null;
		session = sessionFactory.getCurrentSession();
		try {
			session.save(hospitalVO);
			result = hospitalVO;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
