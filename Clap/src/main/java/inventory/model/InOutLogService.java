package inventory.model;

import java.util.List;

public class InOutLogService {
	
	private InventoryDAO inventoryDAO;
	private InOutLogDAO inOutLogDAO;

	
	public void setInventoryDAO(InventoryDAO inventoryDAO) {
		this.inventoryDAO = inventoryDAO;
	}


	public void setInOutLogDAO(InOutLogDAO inOutLogDAO) {
		this.inOutLogDAO = inOutLogDAO;
	}
	
	
	public List<InOutLogVO>  test(){
		return inOutLogDAO.selectAll();
	}
}
