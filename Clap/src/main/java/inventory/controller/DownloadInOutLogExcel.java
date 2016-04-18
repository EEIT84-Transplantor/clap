package inventory.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;

import com.opensymphony.xwork2.ActionSupport;

import inventory.model.InOutLogService;
import inventory.model.InOutLogVO;
import inventory.model.InventoryVO;

public class DownloadInOutLogExcel extends ActionSupport{
	InOutLogService inOutLogService;
	private String type = "application/vnd.ms-excel";
	private String filename;
	private InputStream excelStream;
	public InOutLogService getInOutLogService() {
		return inOutLogService;
	}

	public void setInOutLogService(InOutLogService inOutLogService) {
		this.inOutLogService = inOutLogService;
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
	public String execute(){ 	
		try {
			HSSFWorkbook wb = new HSSFWorkbook();
			 HSSFSheet sheet = wb.createSheet("Excel Sheet");
			 HSSFRow rowhead = sheet.createRow(0);
			 rowhead.createCell(0).setCellValue("In Out Log ID");
			 rowhead.createCell(1).setCellValue("Inventory ID");
			 rowhead.createCell(2).setCellValue("Product ID");
			 rowhead.createCell(3).setCellValue("In Quantity");
			 rowhead.createCell(4).setCellValue("Out Quantity");
			 rowhead.createCell(5).setCellValue("Order Detail ID");
			 rowhead.createCell(6).setCellValue("Manufacture Date");
			 rowhead.createCell(7).setCellValue("Expire Date");
			 rowhead.createCell(8).setCellValue("Destination");
			 rowhead.createCell(9).setCellValue("Date");
			 List<InOutLogVO> inOutLogVOs = inOutLogService.getAll();
			 System.out.println(inOutLogVOs);
			 int index=1;
			 for (InOutLogVO inOutLogVO:inOutLogVOs) {
				 System.out.println("hii");
			         HSSFRow row = sheet.createRow(index);
			         row.createCell(0).setCellValue(inOutLogVO.getId());
			         row.createCell(1).setCellValue(inOutLogVO.getInventory_id());
			         row.createCell(2).setCellValue(inOutLogVO.getProduct_id());
			         Integer tempInQ = inOutLogVO.getInQuantity();
			         if(tempInQ==null){
			        	 tempInQ=0;
			         }
			         row.createCell(3).setCellValue(tempInQ);
			         Integer tempOutQ = inOutLogVO.getOutQuantity();
			         if(tempOutQ==null){
			        	 tempOutQ=0;
			         }
			         row.createCell(4).setCellValue(tempOutQ);
			         Integer temp = inOutLogVO.getOrderdetail_id();
			         if(temp==null){
			        	 temp=0;
			         }
			         row.createCell(5).setCellValue(temp);
			         HSSFCell dCell = row.createCell(6);
			         String manufacture = (""+inOutLogVO.getManufactureDate()).substring(0,10);
			         dCell.setCellValue(manufacture);
			         dCell.setCellType(Cell.CELL_TYPE_STRING);
			        
			         String expire = (""+inOutLogVO.getExpiryDate()).substring(0,10); 
			         HSSFCell eCell = row.createCell(7);
			         eCell.setCellValue(expire);
			         eCell.setCellType(Cell.CELL_TYPE_STRING);
			         
			         row.createCell(8).setCellValue(inOutLogVO.getDestination());
			         
			         String date = (""+inOutLogVO.getDate()).substring(0,10); 
			         HSSFCell fCell = row.createCell(9);
			         fCell.setCellValue(date);
			         fCell.setCellType(Cell.CELL_TYPE_STRING);
			         index++;
			 }
//			 
//			 File file = new File("\\hii");
//			 if(!file.exists()){
//				 file.mkdirs();
//			 }
//			 file = new File("\\hii\\inventory.xls");
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
}
