package hospital.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class LocationHibernateDAO implements LocationDAO{
	 private SessionFactory sessionFactory;
	    private Session session;
	    final private String SELECT_ALL = "from LocationVO"; 
		
		public LocationHibernateDAO() {
		}

		public SessionFactory getSessionFactory() {
			return sessionFactory;
		}

		public void setSessionFactory(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		}

		@Override
		public List<LocationVO> selectAll() {
			List<LocationVO> result = null;
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(SELECT_ALL);
			result = query.list();
			return result;
		}
}
