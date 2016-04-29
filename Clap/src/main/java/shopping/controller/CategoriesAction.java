package shopping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;

import product.model.CategoryVO;
import product.model.ProductVO;
import product.model.ProductimgVO;

public class CategoriesAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private String organ;
	private ServletContext context;
	public CategoriesAction() {
	}
	public void setOrgan(String organ) {
		this.organ = organ;
	}

	@Override
	public String execute() throws Exception {
		context = request.getServletContext();
		List<CategoryVO> globalCategoryVOs = (List<CategoryVO>)context.getAttribute("globalCategoryVOs");
		Map<Integer,List<ProductVO>> globalProductVOs = (Map<Integer,List<ProductVO>>)context.getAttribute("globalProductVOs");
		Map<Integer,List<ProductimgVO>> globalProductimgVOs = (Map<Integer,List<ProductimgVO>>)context.getAttribute("globalProductimgVOs");
		
		CategoryVO target = null;
		if(organ==null){
			organ = globalCategoryVOs.get(0).getName();
		}

		for(int i = 0;i<globalCategoryVOs.size();i++){
			if(globalCategoryVOs.get(i).getName().equals(organ)){
				target = globalCategoryVOs.get(i);
				break;
			}
		}
		
		List<ProductVO> lists = globalProductVOs.get(target.getId());
		List<ProductimgVO> imglists =  globalProductimgVOs.get(target.getId());
		
		
		Map<Integer, ProductimgVO> productimg = new HashMap<Integer, ProductimgVO>();
		
		for(int i = 0;i<lists.size();i++){
			            
			productimg.put(lists.get(i).getId(), imglists.get(i));
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
