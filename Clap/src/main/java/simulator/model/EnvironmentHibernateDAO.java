package simulator.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class EnvironmentHibernateDAO implements EnvironmentDAO{
	private SessionFactory sessionFactory;
	private Session session;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	final private String SELECT_ALL = "from EnvironmentVO";
	final private String SELECT_BY_Condition = "from EnvironmentVO where condition=?";
	final private String SELECT_BY_Id = "from EnvironmentVO where id=?";
	@Override
	public List<EnvironmentVO> selectAll(){
		session = sessionFactory.getCurrentSession();
		List<EnvironmentVO> environmentVOs = null;
		try {
			environmentVOs = session.createQuery(SELECT_ALL).list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return environmentVOs;
	};
	
	@Override
	public List<EnvironmentVO> selectByCondition(String condition){
		session = sessionFactory.getCurrentSession();
		List<EnvironmentVO> environmentVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_Condition);
			query.setString(0, condition);
			environmentVOs = query.list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return environmentVOs;
	};
	
	@Override
	public List<EnvironmentVO> selectById(Integer id){
		session = sessionFactory.getCurrentSession();
		List<EnvironmentVO> environmentVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_Id);
			query.setInteger(0, id);
			environmentVOs = query.list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return environmentVOs;
	};
}
