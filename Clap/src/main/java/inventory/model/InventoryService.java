package inventory.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import product.model.ProductVO;
import shopping.model.ReturnVO;

public class InventoryService {
	
	private InventoryDAO inventoryDAO;
	private InOutLogDAO inOutLogDAO;
		
	public void setInOutLogDAO(InOutLogDAO inOutLogDAO) {
		this.inOutLogDAO = inOutLogDAO;
	}

	public void setInventoryDAO(InventoryDAO inventoryDAO) {
		this.inventoryDAO = inventoryDAO;
	}
	
	public List<InventoryVO>  test(){
		return inventoryDAO.selectAll();
	}
	public Integer getQuantity (Integer product_Id){
		return inventoryDAO.getQuantityById(product_Id);
	}
	public List<InventoryVO> getAllInventories(Integer productId){
		if (productId == null || productId<=0){
			//(id為null時抓全部)
			return inventoryDAO.selectAll();
		}else{
			return inventoryDAO.selectByProductId(productId);
		}
	}

	public boolean saleQuantity(ProductVO productVO, Integer soldQuantity, String destination) {
		int totalIn=0, totalOut=0; 
		int pointer = 0;
		List<InOutLogVO> allInOutLogs = inOutLogDAO.selectByProductId(productVO.getId());
		List<Integer> quantityList = new ArrayList<Integer>();
		for ( InOutLogVO vo : allInOutLogs){
			int inOut = (vo.getInQuantity() - vo.getOutQuantity());
			quantityList.add(inOut);
			if(inOut>0){
				totalIn += inOut;
			}else{
				totalOut += inOut;
			}				
		}
		int restToCut = -totalOut;
		for(int index=0;index<quantityList.size();index++){
			if(quantityList.get(index)>0){
				restToCut = quantityList.get(index) - restToCut; 
				if(restToCut > 0){
					pointer = index;
					quantityList.set(pointer, restToCut);
					break;
				}
			}
		}
		System.out.println(totalIn);
		System.out.println(totalOut);
		System.out.println(restToCut);
		System.out.println(pointer);
		if((totalIn + totalOut) >= soldQuantity){
			while(soldQuantity > 0){
				
				if (quantityList.get(pointer) > 0) {
					if ((quantityList.get(pointer) - soldQuantity) > 0) {
						InOutLogVO inOutLogVO = allInOutLogs.get(pointer);
						InOutLogVO newInOutLogVO = new InOutLogVO();						
						newInOutLogVO.setInventory_id(inOutLogVO.getInventory_id());
						newInOutLogVO.setProduct_id(inOutLogVO.getProduct_id());
						newInOutLogVO.setInQuantity(0);
						newInOutLogVO.setOrderdetail_id(inOutLogVO.getOrderdetail_id());
						newInOutLogVO.setOutQuantity(soldQuantity);
						newInOutLogVO.setManufactureDate(inOutLogVO.getManufactureDate());
						newInOutLogVO.setExpiryDate(inOutLogVO.getExpiryDate());
						newInOutLogVO.setDestination(destination);
						newInOutLogVO.setDate(new Timestamp(System.currentTimeMillis()));
						inOutLogDAO.insert(newInOutLogVO);
						System.out.println("Greater "+quantityList);
						break;
					} else {
						InOutLogVO inOutLogVO = allInOutLogs.get(pointer);
						InOutLogVO newInOutLogVO = new InOutLogVO();
						newInOutLogVO.setInventory_id(inOutLogVO.getInventory_id());
						newInOutLogVO.setProduct_id(inOutLogVO.getProduct_id());
						newInOutLogVO.setInQuantity(0);
						newInOutLogVO.setOrderdetail_id(inOutLogVO.getOrderdetail_id());
						newInOutLogVO.setOutQuantity(quantityList.get(pointer));
						newInOutLogVO.setManufactureDate(inOutLogVO.getManufactureDate());
						newInOutLogVO.setExpiryDate(inOutLogVO.getExpiryDate());
						newInOutLogVO.setDestination(destination);
						newInOutLogVO.setDate(new Timestamp(System.currentTimeMillis()));
						inOutLogDAO.insert(newInOutLogVO);
						soldQuantity -= quantityList.get(pointer);
						System.out.println("Rest "+soldQuantity);						
					} 
				}
				pointer++;
			}
		return true;
		}else{
		return false;
		}
	}

}
