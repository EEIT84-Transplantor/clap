package component.listener;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.SessionFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;

import product.model.CategoryService;
import product.model.CategoryVO;
import product.model.ProductService;
import product.model.ProductVO;
import product.model.ProductimgVO;

public class InitListener implements ServletContextListener {
	static private ServletContext context;
	
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		context = arg0.getServletContext();
		SessionFactory sessionFactory = (SessionFactory)WebApplicationContextUtils.getWebApplicationContext(context).getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		ProductService productService = (ProductService)WebApplicationContextUtils.getWebApplicationContext(context).getBean("productService");
		CategoryService categoryService = (CategoryService)WebApplicationContextUtils.getWebApplicationContext(context).getBean("categoryService");
		List<CategoryVO> categoryVOs = categoryService.getAllCategory();
		Map<Integer, List<ProductVO>> mapOfProductVOs = new HashMap<Integer, List<ProductVO>>();
		Map<Integer, List<ProductimgVO>> mapOfProductimgVOs = new HashMap<Integer, List<ProductimgVO>>();
		
		List<ProductVO> temp = null;
		List<ProductimgVO> tempImg = null;
		for(CategoryVO categoryVO:categoryVOs){
			temp = productService.searchProductByCategory(categoryVO.getId());
			tempImg = productService.getProductImgByList(temp);
			mapOfProductVOs.put(categoryVO.getId(), temp);	
			mapOfProductimgVOs.put(categoryVO.getId(), tempImg);
		}
		
		sessionFactory.getCurrentSession().getTransaction().commit();
		
		
	
		context.setAttribute("categoriesList", categoryVOs);
		context.setAttribute("globalCategoryVOs", categoryVOs);
		context.setAttribute("globalProductVOs", mapOfProductVOs);
		context.setAttribute("globalProductimgVOs", mapOfProductimgVOs);
		
	}
	
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}



}
