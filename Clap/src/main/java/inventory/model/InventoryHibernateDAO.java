package inventory.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class InventoryHibernateDAO implements InventoryDAO {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session session;
	final private String SELECT_ALL = "from InventoryVO";
	final private String SELECT_BY_PRODUCT_ID ="from InventoryVO where pd_id=?";
	final private String FIND_QUANTITY_BY_PRODUCT_ID = "select sum(inventoryVO.quantity) from InventoryVO inventoryVO where pd_id=? and inventory_expiryDate>?";
	final private String SELECT_BY_INVENTORY_PROPERTIES ="from InventoryVO where pd_id=? and inventory_expiryDate=? and  inventory_manufactureDate=?";
	

	@Override
	public List<InventoryVO> selectAll() {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		List<InventoryVO> inventoryVOs = query.list();
		return inventoryVOs;
	};
	
	@Override
	public List<InventoryVO> selectByProductId(Integer productId) {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_BY_PRODUCT_ID);
		query.setInteger(0, productId);
		List<InventoryVO> inventoryVOs = query.list();
		return inventoryVOs;
	};
	@Override
	public InventoryVO selectByInventoryProperties(InventoryVO inventoryVO) {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_BY_INVENTORY_PROPERTIES);
		query.setInteger(0, inventoryVO.getId());
		query.setTimestamp(1, inventoryVO.getExpiryDate());
		query.setTimestamp(2, inventoryVO.getManufactureDate());
		InventoryVO inventoryVOs = (InventoryVO) query.list().get(0);
		return inventoryVOs;
	};

	@Override
	public InventoryVO insert(InventoryVO inventoryVO) {
		session = sessionFactory.getCurrentSession();
		try {
			session.save(inventoryVO);
			return inventoryVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	};

	@Override
	public boolean update(InventoryVO inventoryVO) {
		session = sessionFactory.getCurrentSession();
		try {
			session.update(inventoryVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	};

	@Override
	public boolean delete(Integer id) {
		session = sessionFactory.getCurrentSession();
		InventoryVO inventoryVO = new InventoryVO();
		inventoryVO.setId(id);
		try {
			session.delete(inventoryVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}	
	};
}
