package component.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import product.model.CategoryDAO;
import product.model.ProductService;

public class GetCategoriesFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		     
		
//             ProductService productService  = new ProductService();
            
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
