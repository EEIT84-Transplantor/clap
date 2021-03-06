package inventory.model;

import java.security.Timestamp;
import java.util.List;

import org.springframework.transaction.support.ResourceTransactionManager;

public class InOutLogService {
	
	private InventoryDAO inventoryDAO;
	private InOutLogDAO inOutLogDAO;

	
	public void setInventoryDAO(InventoryDAO inventoryDAO) {
		this.inventoryDAO = inventoryDAO;
	}


	public void setInOutLogDAO(InOutLogDAO inOutLogDAO) {
		this.inOutLogDAO = inOutLogDAO;
	}
	
	
	public List<InOutLogVO>  getAll(){
		return inOutLogDAO.selectAll();
	}
	
	public Boolean importProduct(InOutLogVO inOutLogVO){
		
		
		try {
			Integer product_id = inOutLogVO.getProduct_id();
			java.sql.Timestamp expire = inOutLogVO.getExpiryDate();
			java.sql.Timestamp manufactureDate= inOutLogVO.getManufactureDate();
			InventoryVO inventoryVO = new InventoryVO();
			inventoryVO.setExpiryDate(expire);
			inventoryVO.setManufactureDate(manufactureDate);
			inventoryVO.setExpiryDate(inOutLogVO.getExpiryDate());
			inventoryVO.setProduct_id(product_id);
			InventoryVO inventoryVO2 = inventoryDAO.selectByInventoryProperties(inventoryVO);
			
			
			if(inventoryVO2!=null){
				inOutLogVO.setInventory_id(inventoryVO2.getId());
				InOutLogVO result=inOutLogDAO.insert(inOutLogVO);
				Integer num = inventoryVO2.getQuantity()+inOutLogVO.getInQuantity();
//				inventoryVO.setId(inventoryVO2.getId());
				inventoryVO2.setQuantity(num);
				if(result!=null &&inventoryDAO.update(inventoryVO2)){
					return true;
				}else{
					return false;
				}
				 
			}else{
				inventoryVO.setQuantity(inOutLogVO.getInQuantity());
				InventoryVO inventoryVO3 = inventoryDAO.insert(inventoryVO);
				InventoryVO inventoryVOTemp = inventoryDAO.selectByInventoryProperties(inventoryVO3);
				inOutLogVO.setInventory_id(inventoryVOTemp.getId());
				inOutLogDAO.insert(inOutLogVO);
				
				if(inventoryVO3==null){
					return false;
				}else{
					return true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public Boolean exportProduct(InOutLogVO inOutLogVO){
		try {
			Integer product_id = inOutLogVO.getProduct_id();
			java.sql.Timestamp expire = inOutLogVO.getExpiryDate();
			java.sql.Timestamp manufactureDate= inOutLogVO.getManufactureDate();
			InventoryVO inventoryVO = new InventoryVO();
			inventoryVO.setExpiryDate(expire);
			inventoryVO.setProduct_id(product_id);
			inventoryVO.setManufactureDate(manufactureDate);
			boolean result=inOutLogDAO.update(inOutLogVO);
			InventoryVO inventoryVO2 = inventoryDAO.selectByInventoryProperties(inventoryVO);
			
			if(inventoryVO2!=null){
				
				Integer num = inventoryVO2.getQuantity()-inOutLogVO.getOutQuantity();
				if(num >=0){
					inventoryVO2.setQuantity(num);
					if(result &&inventoryDAO.update(inventoryVO2)){
						return true;
					}
				}
				return false; 
			}
			
			return false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
