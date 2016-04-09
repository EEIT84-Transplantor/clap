package component.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;


public class OpenSessionViewFilter implements Filter {

	static SessionFactory sessionFactory;
   public OpenSessionViewFilter() {
    }
	public void init(FilterConfig fConfig) throws ServletException {
		
		sessionFactory = (SessionFactory)WebApplicationContextUtils.getWebApplicationContext(fConfig.getServletContext())
				.getBean("sessionFactory"); 
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		try {
			sessionFactory.getCurrentSession().beginTransaction();
			System.out.println("Transaction start");			
			chain.doFilter(request, response);
			sessionFactory.getCurrentSession().getTransaction().commit();
			System.out.println("Transaction commit");			
		} catch (HibernateException e) {
			sessionFactory.getCurrentSession().getTransaction().rollback();
			System.out.println("Transaction rollback");			
			chain.doFilter(request, response);
		}
	
	}


}
