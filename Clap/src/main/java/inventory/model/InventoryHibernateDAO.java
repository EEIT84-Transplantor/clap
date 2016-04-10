package inventory.model;

import java.util.List;

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

	@Override
	public List<InventoryVO> selectAll() {
		List<InventoryVO> inventoryVOs = null;

		return inventoryVOs;
	};

	@Override
	public List<InventoryVO> selectByProductId(String productId) {
		List<InventoryVO> inventoryVOs = null;

		return inventoryVOs;
	};

	@Override
	public InventoryVO insert(InventoryVO inventoryVO) {

		return inventoryVO;
	};

	@Override
	public boolean update(InventoryVO inventoryVO) {

		return false;
	};

	@Override
	public boolean delete(String id) {

		return false;
	};
}
