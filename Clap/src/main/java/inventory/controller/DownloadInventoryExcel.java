package inventory.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;

import com.opensymphony.xwork2.ActionSupport;

import inventory.model.InventoryService;
import inventory.model.InventoryVO;

public class DownloadInventoryExcel extends ActionSupport {
	InventoryService inventoryService;
	private String type = "application/vnd.ms-excel";
	private String filename;
	private InputStream excelStream;

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

	public String execute(){ 
	       
//		filename = "hello.xls";
//	        File img = new File("C:\\Users\\Student\\Desktop\\hello\\inventory.xls");
//	        try {
//	        	excelStream = new FileInputStream(img);
//			} catch (FileNotFoundException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//	 
//	        return Action.SUCCESS;
// 
		
		
		try {

			HSSFWorkbook wb = new HSSFWorkbook();
			 HSSFSheet sheet = wb.createSheet("Excel Sheet");
			 HSSFRow rowhead = sheet.createRow(0);
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
			         
			         HSSFCell dCell = row.createCell(2);
			         String manufacture = (""+inventoryVO.getManufactureDate()).substring(0,10);
			         dCell.setCellValue(manufacture);
			         dCell.setCellType(Cell.CELL_TYPE_STRING);
			         
			         String expire = (""+inventoryVO.getExpiryDate()).substring(0,10); 
			         HSSFCell eCell = row.createCell(3);
			         eCell.setCellValue(expire);
			         eCell.setCellType(Cell.CELL_TYPE_STRING);
			         
			         row.createCell(4).setCellValue(inventoryVO.getQuantity());
			         index++;
			 }
//			 
			 File file = new File("\\hii");
			 if(!file.exists()){
				 file.mkdirs();
			 }
			 file = new File("\\hii\\inventory.xls");
			 ByteArrayOutputStream baos = new ByteArrayOutputStream();
			 System.out.println("1");
//			 FileOutputStream fileOut = new FileOutputStream(img);
			 System.out.println("2");
			 wb.write(baos);
			 excelStream = new ByteArrayInputStream(baos.toByteArray());
			
//			 fileOut.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
         System.out.println("Data is saved in excel file.");
    
		return SUCCESS;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public InputStream getExcelStream() {
		return excelStream;
	}

	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}


}
