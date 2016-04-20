package product.model;

import java.util.List;

import org.hibernate.Query;
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
	final private String SELECT_BY_NAME = "from CategoryVO where category_name=?";
	final private String SELECT_BY_Id = "from CategoryVO where id=?";
	@Override
	public List<CategoryVO> selectAll(){
		session = sessionFactory.getCurrentSession();
		List<CategoryVO> categoryVOs = null;
		try {
			categoryVOs = session.createQuery(SELECT_ALL).list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categoryVOs;
	};
	@Override
	public List<CategoryVO> selectByCategoryName(String category_name) {
		session = sessionFactory.getCurrentSession();
		List<CategoryVO> categoryVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_NAME);
			categoryVOs = query.setString(0, category_name).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categoryVOs;
	};
	@Override
	public CategoryVO selectById(Integer categoryId){
		session = sessionFactory.getCurrentSession();
		CategoryVO categoryVO=null;
		try {
			categoryVO = session.get(CategoryVO.class,categoryId);
			return categoryVO;
		} catch (Exception e) {
			e.printStackTrace();
			return categoryVO;
		}
		
	};

	@Override
	public CategoryVO insert(CategoryVO categoryVO){
		session = sessionFactory.getCurrentSession();
		try {
			CategoryVO categoryVO2 = new CategoryVO();
			categoryVO2.setName(categoryVO.getName());
			session.save(categoryVO);
			return categoryVO;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	};

	@Override
	public boolean update(CategoryVO categoryVO){
		session = sessionFactory.getCurrentSession();
		try {
			session.update(categoryVO);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	};

	@Override
	public boolean delete(Integer id){
		session = sessionFactory.getCurrentSession();
		try {
			CategoryVO categoryVO = session.get(CategoryVO.class, id);
			session.delete(categoryVO);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	};
	
	
}
