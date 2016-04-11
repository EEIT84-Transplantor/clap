package inventory.model;

import java.util.List;

public interface InventoryDAO {

	List<InventoryVO> selectAll();

	List<InventoryVO> selectByProductId(Integer productId);

	InventoryVO insert(InventoryVO inventoryVO);

	boolean update(InventoryVO inventoryVO);

	boolean delete(Integer id);

	InventoryVO selectByInventoryProperties(InventoryVO inventoryVO);
	Integer getQuantityById(Integer productId);

}