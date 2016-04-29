package shopping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Index;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryService;
import product.model.CategoryVO;
import product.model.ProductService;
import product.model.ProductVO;
import product.model.ProductimgVO;

public class CategoriesAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private CategoryService categoryService;
	private ProductService productService;
	private String organ;
	public CategoriesAction() {
	}
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	
	public void setOrgan(String organ) {
		this.organ = organ;
	}

	@Override
	public String execute() throws Exception {
		
		ServletContext context = ServletActionContext.getServletContext();
		List<CategoryVO> globalCategoryVOs = (List<CategoryVO>)context.getAttribute("globalCtegoryVOs");
		Map<Integer,List<ProductVO>> globalProductVOs = (Map<Integer,List<ProductVO>>)context.getAttribute("globalProductVOs");
		Map<Integer,List<ProductimgVO>> globalProductimgVOs = (Map<Integer,List<ProductimgVO>>)context.getAttribute("globalProductimgVOs");
		
		
		CategoryVO target = null;
		if(organ==null){
			organ = globalCategoryVOs.get(0).getName();
		}
		int index = 0;
		for(CategoryVO categoryVO:globalCategoryVOs){
			if(categoryVO.getName().equals(organ)){
				target = categoryVO;
				break;
			}
			index++;
		}
		
		List<ProductVO> lists = globalProductVOs.get(target.getId());
		List<ProductimgVO> imglists =  globalProductimgVOs.get(target.getId());
		Map<Integer, ProductimgVO> productimg = new HashMap<Integer, ProductimgVO>();
		
		for(ProductVO vo:lists){
			               //產品id       產品圖片
			productimg.put(vo.getId(), imglists.get(index));
		}
		
		
		
		if(lists!=null){
			request.setAttribute("organ", organ);
			request.setAttribute("productlist", lists);
			request.setAttribute("productimg", productimg);
		}
		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
  
}
