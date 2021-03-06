package inventory.model;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


import product.model.ProductVO;


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
	private String SQL_QUERY_SELECT_TOP_POPULAR_PART1 = "select top ";
	private String SQL_QUERY_SELECT_TOP_POPULAR_PART2 = " * from product where product_id in (select top 100 product_id from (select product_id, 1.0*sum(inoutlog_outQuantity)/(sum(inoutlog_inQuantity)+1) as popularity from inoutlog group by product_id having product_id in (select product_id from product where category_id=?)) as tableA order by popularity desc )";
	final private String SELECT_BY_PRODUCT_ID="from InOutLogVO where expiryDate>? and product_id=? order by expiryDate asc";
	final private String SELECT_BY_ORDERDETAIL_ID="from InOutLogVO where orderdetail_id=? order by expiryDate asc";
	
	@Override
	public List<InOutLogVO> selectAll(){
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		List<InOutLogVO> inOutLogVOs = query.list();
		return inOutLogVOs;
	};

	
	@Override
	public List<InOutLogVO> selectByProductId(Integer productId){		
		session = sessionFactory.getCurrentSession();
		List<InOutLogVO> inOutLogVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_PRODUCT_ID);
			query.setParameter(0, new Timestamp(System.currentTimeMillis()));
			query.setParameter(1, productId);
			inOutLogVOs = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return inOutLogVOs;
	};
	
	@Override
	public List<InOutLogVO> selectByOrderDetailId(Integer OrderDetailId){		
		session = sessionFactory.getCurrentSession();
		List<InOutLogVO> inOutLogVOs = null;
		try {
			Query query = session.createQuery(SELECT_BY_ORDERDETAIL_ID);
			query.setParameter(0, OrderDetailId);
			inOutLogVOs = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return inOutLogVOs;
	};

	@Override
	public InOutLogVO insert(InOutLogVO inOutLogVO){
		session = sessionFactory.getCurrentSession();
		try {
			session.save(inOutLogVO);
			return inOutLogVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	};

	@Override
	public boolean update(InOutLogVO inOutLogVO){
		session = sessionFactory.getCurrentSession();
		try {
			session.update(inOutLogVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(Integer id) {
		session = sessionFactory.getCurrentSession();
		InOutLogVO inOutLogVO = new InOutLogVO();
		inOutLogVO.setId(id);
		try {
			session.delete(inOutLogVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	}

	@Override
	public List<ProductVO> selectByTopSold(Integer categoryId, int number) {
		session = sessionFactory.getCurrentSession();
		List<ProductVO> productVOs = null;
		try {
			SQLQuery query = session.createSQLQuery(SQL_QUERY_SELECT_TOP_POPULAR_PART1+number+SQL_QUERY_SELECT_TOP_POPULAR_PART2).addEntity(ProductVO.class); 
			query.setInteger(0, categoryId);
			productVOs = query.list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return productVOs;

	};
	
}
