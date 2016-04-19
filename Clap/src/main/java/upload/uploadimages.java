package upload;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.formula.ptg.StringPtg;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import product.model.ProductService;
import product.model.ProductVO;
@WebServlet("/hahaha.ha")
public class uploadimages extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		String filePath = "http://localhost:8080/Clap/resource/images/products";
		
		File file = new File(filePath);
		System.out.println("這"+filePath);
		System.out.println("這"+file.listFiles().length);
		if(!file.exists())

		{
			file.mkdir();
		}
//		for(File img:file.listFiles()){
//			
//			FileInputStream fis;
//			try {
//				fis = new FileInputStream(filePath+"/"+img.getName());
//				byte[]  imgtemp = new byte[(int)img.length()];
//				InputStream is  = new BufferedInputStream(fis);
//	            Byte[] imgbyte = new Byte[imgtemp.length];
//				is.read(imgtemp);
//				for(int i = 0;i<imgtemp.length;i++){
//					imgbyte[i] = imgtemp[i];
//				}
//				
//				ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
//				ProductService productService = (ProductService)context.getBean("productService");
//				ProductVO productVO = productService.getProductById(Integer.parseInt(img.getName().split("\\.")[0]));
//				productService.setOrUpdateProduct(productVO, imgbyte);
//				
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//	
//		}
		
		
		
		
		
		
	}
}
