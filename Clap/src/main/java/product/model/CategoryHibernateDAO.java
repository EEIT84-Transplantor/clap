package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;



public class CategoryHibernateDAO implements CategoryDAO {
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session session;
	final private String SELECT_ALL = "from CategoryVO";
	
	@Override
	public List<CategoryVO> selectAll(){
		List<CategoryVO> categoryVOs = null;
		
		return categoryVOs;
	};

	@Override
	public CategoryVO insert(CategoryVO categoryVO){
		
		return categoryVO;
	};

	@Override
	public boolean update(CategoryVO categoryVO){

		return false;
	};

	@Override
	public boolean delete(String id){

		return false;
	};
	
}
