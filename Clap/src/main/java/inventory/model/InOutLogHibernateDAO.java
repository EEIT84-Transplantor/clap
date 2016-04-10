package inventory.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class InOutLogHibernateDAO implements InOutLogDAO {
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session session;
	final private String SELECT_ALL = "from InOutLogVO";
	
	@Override
	public List<InOutLogVO> selectAll(){
		List<InOutLogVO> inOutLogVOs = null;
		
		return inOutLogVOs;
	};

	@Override
	public List<InOutLogVO> selectByProductId(String productId){
		List<InOutLogVO> inOutLogVOs = null;
		
		return inOutLogVOs;
	};

	@Override
	public InOutLogVO insert(InOutLogVO inOutLogVO){
		
		return inOutLogVO;
	};

	@Override
	public boolean update(InOutLogVO inOutLogVO){

		return false;
	};

	@Override
	public boolean delete(String id){

		return false;
	};
}
