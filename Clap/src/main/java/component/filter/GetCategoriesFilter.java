package component.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import product.model.CategoryService;
import product.model.CategoryVO;


public class GetCategoriesFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpSession session = request.getSession();
		if(session.getAttribute("categoriesList")==null){
			 ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(req.getServletContext());
			    CategoryService categoryService = (CategoryService) context.getBean("categoryService");
			    List<CategoryVO> categorys = categoryService.getAllCategory();
			    session.setAttribute("categoriesList", categorys);
		}
		 chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
