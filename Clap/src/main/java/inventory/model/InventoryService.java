package inventory.model;

import java.util.List;

public class InventoryService {
	
	private InventoryDAO inventoryDAO;
	

	
	public void setInventoryDAO(InventoryDAO inventoryDAO) {
		this.inventoryDAO = inventoryDAO;
	}


	
	public List<InventoryVO>  test(){
		return inventoryDAO.selectAll();
	}
}
