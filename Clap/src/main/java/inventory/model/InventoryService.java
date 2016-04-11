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
		return inventoryDAO.getQuantityById(productId);
	}
	public List<InventoryVO> getAllInventories(Integer productId){
		if (productId == null || productId<=0){
			//(id為null時抓全部)
			return inventoryDAO.selectAll();
		}else{
			return inventoryDAO.selectByProductId(productId);
		}
	}
}
