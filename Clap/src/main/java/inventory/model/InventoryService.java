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
	public Integer getQuantity (Integer productId){
//		inventoryDAO.selectByProductId(productId);
	}
	public List<InventoryVO> getAllInventories(Integer productId){
		if (productId == null || productId.trim().length()==0){
			//(id為null時抓全部)
			return inventoryDAO.selectAll();
		}else{
			return inventoryDAO.selectByProductId(productId);
		}
	}
}
