package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ProductHibernateDAO implements ProductDAO {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session session;
	final private String SELECT_ALL = "from ProductVO";

	@Override
	public List<ProductVO> selectAll() {
		session = sessionFactory.getCurrentSession();
		List<ProductVO> productVOs = null;
		try {
			productVOs = session.createQuery(SELECT_ALL).list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productVOs;
	};

	@Override
	public ProductVO selectByProductId(String productId) {
		session = sessionFactory.getCurrentSession();
		ProductVO productVO = null;
		try {
			productVO = session.get(ProductVO.class, productId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productVO;
	};

	@Override
	public ProductVO insert(ProductVO productVO) {
		session = sessionFactory.getCurrentSession();
		try {
			session.save(productVO);
			return productVO; 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	};

	@Override
	public boolean update(ProductVO productVO) {
		session = sessionFactory.getCurrentSession();
		try {
			session.update(productVO);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	};

	@Override
	public boolean delete(String id) {
		session = sessionFactory.getCurrentSession();
		try {
			ProductVO productVO = session.get(ProductVO.class, id);
			session.delete(productVO);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	};

}
