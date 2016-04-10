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
		List<ProductimgVO> productimgVOs = null;

		return productimgVOs;
	};

	@Override
	public List<ProductimgVO> selectByProductId(String productId) {
		List<ProductimgVO> productimgVOs = null;

		return productimgVOs;
	};

	@Override
	public ProductimgVO insert(ProductimgVO productimgVO) {

		return productimgVO;
	};

	@Override
	public boolean update(ProductimgVO productimgVO) {

		return false;
	};

	@Override
	public boolean delete(String id) {

		return false;
	};
}
