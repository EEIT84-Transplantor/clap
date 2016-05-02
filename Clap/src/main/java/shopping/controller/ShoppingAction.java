package shopping.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryVO;
import product.model.ProductVO;
import product.model.ProductimgVO;

public class ShoppingAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private ServletContext context;

	@Override
	public String execute() throws Exception {
		
		context = request.getServletContext();
		List<CategoryVO> categoryVOs = (List<CategoryVO>)context.getAttribute("globalCategoryVOs");
		Map<Integer,List<ProductVO>> globalProductVOs = (Map<Integer,List<ProductVO>>)context.getAttribute("globalProductVOs");
		Map<Integer,List<ProductimgVO>> globalProductimgVOs = (Map<Integer,List<ProductimgVO>>)context.getAttribute("globalProductimgVOs");

		Map<String, List<ProductVO>> allCategoryProduct = new LinkedHashMap<String, List<ProductVO>>();
		Map<Integer, ProductimgVO> productDetail = new HashMap<Integer, ProductimgVO>();

		
		for(int i = 0; i<categoryVOs.size();i++){
			List<ProductVO> list = globalProductVOs.get(categoryVOs.get(i).getId());
			List<ProductimgVO> ProductimgVOs = globalProductimgVOs.get(categoryVOs.get(i).getId());
			for(int j = 0; j<list.size();j++){
				productDetail.put(list.get(j).getId(),ProductimgVOs.get(j));
			}
			allCategoryProduct.put(categoryVOs.get(i).getName(), list);
		}

		request.setAttribute("allCategoryProduct", allCategoryProduct);
		request.setAttribute("Productimg", productDetail);

		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}
}
