package product.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
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
	private final String SELECT_BY_KEY = "from ProductVO where product_name like:productName";
	private final String SELECT_BY_CATEGORY = "from ProductVO where category_id= ?";
	private final String SELECT_BY_ONLY_PRICE_RANGE = "from ProductVO where product_price >= ? and product_price <= ?" ;
	private final String SELECT_BY_PRICE_RANGE = "from ProductVO where category_id= ? and product_price >= ? and product_price <= ?" ;
	private final String SELECT_BY_KEY_PRICE = "from ProductVO where category_id= ? and product_price >= ? and product_price <= ? and product_name like:productName"  ;
	private final String SELECT_BY_KEY_PRICE2 = "from ProductVO where product_price >= ? and product_price <= ? and product_name like:productName" ;
	final private String SQL_QUERY_SELECT_TOP_AMOUNT = "select * from  (select Row_Number() over (order by category_id) as RowIndex, * from product) as Subtable Where Subtable.RowIndex >= ? and Subtable.RowIndex <= ?";
	@Override
	public List<ProductVO> selectAll() {
		session = sessionFactory.getCurrentSession();
		List<ProductVO> productVOs = null;
		try {
			productVOs = session.createQuery(SELECT_ALL).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productVOs;
	};
	@Override
	public List<ProductVO> searchProductByKeyPrice(Integer categoryId, Double min, Double max, String key) {
		session = sessionFactory.getCurrentSession();
		List<ProductVO> productVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_KEY_PRICE);
			query.setInteger(0,categoryId);
			query.setDouble(1,min);
			query.setDouble(2, max);
			query.setString("productName","%"+key+ "%");
			productVOs = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productVOs;
	};
	
	
	@Override
	public List<ProductVO> selectByKey(String productName) {
		session = sessionFactory.getCurrentSession();
		List<ProductVO> productVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_KEY);
			productVOs = query.setString("productName","%"+productName+ "%").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productVOs;
	};
	
	@Override
	public List<ProductVO> selectByCategory(Integer category_id) {
		session = sessionFactory.getCurrentSession();
		List<ProductVO> productVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_CATEGORY);
			productVOs = query.setInteger(0, category_id).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productVOs;
	};
	@Override
	public List<ProductVO> selectByOnlyPriceRange(Double min, Double max) {
		session = sessionFactory.getCurrentSession();
		List<ProductVO> productVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_ONLY_PRICE_RANGE);
			query.setDouble(0,min);
			query.setDouble(1, max);
			productVOs = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productVOs;
	};
	@Override
	public List<ProductVO> selectByPriceRange(Integer categoryId, Double min, Double max) {
		session = sessionFactory.getCurrentSession();
		List<ProductVO> productVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_PRICE_RANGE);
			query.setInteger(0,categoryId);
			query.setDouble(1,min);
			query.setDouble(2, max);
			productVOs = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productVOs;
	};
		
	@Override
	public List<ProductVO> selectByPriceRange2(Double min, Double max,String key) {
		session = sessionFactory.getCurrentSession();
		List<ProductVO> productVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_KEY_PRICE2);
			query.setDouble(1,min);
			query.setDouble(2, max);
			query.setString("productName","%"+key+ "%");

			productVOs = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productVOs;
	};
		
	@Override
	public ProductVO selectByProductId(Integer productId) {
		session = sessionFactory.getCurrentSession();
		ProductVO productVO = null;
		try {
			productVO = session.get(ProductVO.class, productId);
		} catch (Exception e) {
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
			e.printStackTrace();
			return false;
		}
		
	};

	@Override
	public boolean delete(Integer id) {
		session = sessionFactory.getCurrentSession();
		try {
			ProductVO productVO = session.get(ProductVO.class, id);
			session.delete(productVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<ProductVO> selectByTopAmount(Integer pageNumber, Integer pageAmount, Integer counts) {
		List<ProductVO> productVOs = null;
		session = sessionFactory.getCurrentSession();
		try {
			SQLQuery sqlQuery = session.createSQLQuery(SQL_QUERY_SELECT_TOP_AMOUNT).addEntity(ProductVO.class);
			sqlQuery.setInteger(0, (pageNumber-1)*pageAmount+1);
			sqlQuery.setInteger(1, (pageNumber-1)*pageAmount+counts);
			productVOs = sqlQuery.list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productVOs;
	};

}
