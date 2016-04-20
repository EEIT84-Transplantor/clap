package shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.poifs.storage.HeaderBlockWriter;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import inventory.model.InventoryService;
import product.model.ProductService;
import product.model.ProductVO;
import product.model.ProductimgVO;

public class ProductDetailAction extends ActionSupport implements ServletRequestAware {
    private HttpServletRequest request;
    private ProductService productService;
    private InventoryService inventoryService;
    public ProductVO productVO;
    
	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	@Override
	public String execute() throws Exception {
		System.out.println("這是");
		if(productVO==null){
			return "input";
		}
		Integer quantity = inventoryService.getQuantity(productVO.getId());
		productVO = productService.getProductById(productVO.getId());
		List<ProductVO> popular = productService.getPoupulars(productVO.getCategory_id(), 8);
		ProductimgVO pimage =  productService.getProductImgById(productVO.getId());
		Map<Integer, String> productimages = new HashMap<Integer, String>();
		for(ProductVO vo :popular){
			productimages.put(vo.getId(), productService.getProductImgById(vo.getId()).getImg64());
		}
		System.out.println("這是"+popular.size());
		
		request.setAttribute("product", productVO);
		request.setAttribute("productimages", productimages);
		request.setAttribute("productimage", pimage.getImg64());
		request.setAttribute("quantity", quantity);
		request.setAttribute("popular", popular);
		return SUCCESS;
	}
	

}
