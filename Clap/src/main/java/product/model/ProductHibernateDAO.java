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
		List<ProductVO> productVOs = null;

		return productVOs;
	};

	@Override
	public List<ProductVO> selectByProductId(String productId) {
		List<ProductVO> productVOs = null;

		return productVOs;
	};

	@Override
	public ProductVO insert(ProductVO productVO) {
		
		return productVO; 
	};

	@Override
	public boolean update(ProductVO productVO) {
		
		return false;
	};

	@Override
	public boolean delete(String id) {
		
		return false;
	};

}
