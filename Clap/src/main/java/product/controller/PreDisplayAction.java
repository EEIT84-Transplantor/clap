package product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import freemarker.template.utility.Execute;
import product.model.ProductService;
import product.model.ProductVO;

public class PreDisplayAction extends ActionSupport {
	private Integer pageNumber;
	private ProductService productService;

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public String execute(){
		List<ProductVO> productList=null;
		if (pageNumber==null||pageNumber<=0){
			 productList = productService.getProductByTopAmount(1, 20, 10);

		}else{
			 productList = productService.getProductByTopAmount(pageNumber, 20, 10);

		}
		List<Byte[]> productImgs=new ArrayList<Byte[]>();
		for(ProductVO vo:productList){
			productImgs.add(productService.getProductImgById(vo.getId()));
			System.out.println(productService.getProductImgById(vo.getId()));
		}
		
		System.out.println(productList);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("productVOs", productList);
		request.setAttribute("productImgs", productImgs);
		return SUCCESS;
	}
	
	
}
