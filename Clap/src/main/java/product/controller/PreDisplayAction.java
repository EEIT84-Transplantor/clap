package product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import freemarker.template.utility.Execute;
import product.model.CategoryService;
import product.model.ProductService;
import product.model.ProductVO;
import product.model.ProductimgVO;

public class PreDisplayAction extends ActionSupport {
	private Integer pageNumber;
	private ProductService productService;
	private CategoryService categoryService;
	

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public String execute(){
		List<ProductVO> productList=null;
		if (pageNumber==null||pageNumber<=0){
			 productList = productService.getProductByTopAmount(1, 20, 200);

		}else{
			 productList = productService.getProductByTopAmount(pageNumber, 20, 200);

		}
		
		List<String> productImgs = new ArrayList<String>();;
		try {
			List<ProductimgVO> imgVOList = productService.getProductImgByList(productList);
			System.out.println("productList: "+productList.size()+", imgVOList: "+imgVOList.size());

			for(ProductimgVO imgVO:imgVOList){
				try {
					productImgs.add(imgVO.getImg64());
				} catch (Exception e) {
					productImgs.add("");
				}
				

			}
		} catch (Exception e) {
		}
		
		System.out.println(productList);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("productVOs", productList);
		request.setAttribute("productImgs", productImgs);
		request.setAttribute("categoryVOs", categoryService.getAllCategory());
		
		return SUCCESS;
	}
	
	
}
