package inventory.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.opensymphony.xwork2.ActionSupport;

import inventory.model.InventoryService;
import inventory.model.InventoryVO;

public class DownloadInventoryExcel extends ActionSupport {
	InventoryService inventoryService;

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}
	
	public String execute(){
		 try {
			HSSFWorkbook wb = new HSSFWorkbook();
			 HSSFSheet sheet = wb.createSheet("Excel Sheet");
			 HSSFRow rowhead = sheet.createRow((short) 0);
			 rowhead.createCell(0).setCellValue("Inventory ID");
			 rowhead.createCell(1).setCellValue("Product ID");
			 rowhead.createCell(2).setCellValue("Manufacture Date");
			 rowhead.createCell(3).setCellValue("Expire Date");
			 rowhead.createCell(4).setCellValue("Quantity");
			 List<InventoryVO> inventoryVOs = inventoryService.getAllInventories(null);
			 int index=1;
			 for (InventoryVO inventoryVO:inventoryVOs) {
			         HSSFRow row = sheet.createRow(index);
			         row.createCell(0).setCellValue(inventoryVO.getId());
			         row.createCell(1).setCellValue(inventoryVO.getProduct_id());
			         row.createCell(2).setCellValue(inventoryVO.getManufactureDate());
			         row.createCell(3).setCellValue(inventoryVO.getExpiryDate());
			         row.createCell(4).setCellValue(inventoryVO.getQuantity());
			         index++;
			 }
			 File file = new File("C:\\Users\\Jessica\\Desktop\\inventory.xls");
			 System.out.println("1");
			 FileOutputStream fileOut = new FileOutputStream(file);
			 System.out.println("2");
			 wb.write(fileOut);
			 fileOut.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
         System.out.println("Data is saved in excel file.");
    
		return SUCCESS;
	}
}
