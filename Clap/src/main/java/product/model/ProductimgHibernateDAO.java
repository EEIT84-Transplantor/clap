package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ProductimgHibernateDAO implements ProductimgDAO {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session session;
	final private String SELECT_ALL = "from ProductimgVO";
	
	@Override
	public List<ProductimgVO> selectAll() {
		session = sessionFactory.getCurrentSession();
		List<ProductimgVO> productimgVOs = null;
		try {
			productimgVOs = session.createQuery(SELECT_ALL).list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productimgVOs;
	};

	@Override
	public ProductimgVO selectByProductId(Integer productId) {
		session = sessionFactory.getCurrentSession();
		ProductimgVO productimgVO = null;;
		try {
			productimgVO = session.get(ProductimgVO.class, productId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productimgVO;
		
	};

	@Override
	public ProductimgVO insert(ProductimgVO productimgVO) {
		session = sessionFactory.getCurrentSession();
		try {
			session.save(productimgVO);
			return productimgVO;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	};

	@Override
	public boolean update(ProductimgVO productimgVO) {
		session = sessionFactory.getCurrentSession();
		try {
			session.save(productimgVO);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	};

	@Override
	public boolean delete(Integer id) {
		session = sessionFactory.getCurrentSession();
		try {
			ProductimgVO productimgVO = session.get(ProductimgVO.class, id);
			session.delete(productimgVO);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	};
}
