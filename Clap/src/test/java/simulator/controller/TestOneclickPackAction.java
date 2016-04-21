package simulator.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsSpringTestCase;
import org.apache.struts2.dispatcher.mapper.ActionMapping;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.springframework.mock.web.MockHttpServletRequest;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionProxy;

import member.model.MemberVO;
import payment.model.PromoVO;
import setting.controller.ChangePasswordAction;
import shopping.model.CartVO;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestOneclickPackAction extends StrutsSpringTestCase {

	private String nameSpace = "/simulator";
	private String actionName = "oneclickPackAction";
	private SessionFactory sessionFactory;
	private Session session;

	@Override
	protected void setupBeforeInitDispatcher() throws Exception {
		super.setupBeforeInitDispatcher();
		sessionFactory = (SessionFactory) applicationContext.getBean("sessionFactory");
		session = sessionFactory.getCurrentSession();
		session.beginTransaction();
	}

	@Override
	protected void tearDown() throws Exception {
		session.getTransaction().commit();
		super.tearDown();
	}

	// 測試action註冊正確
	public void testaGetActionMapping() {
		ActionMapping mapping = getActionMapping(nameSpace +"/"+ actionName);
		assertNotNull(mapping);
		assertEquals(nameSpace, mapping.getNamespace());
		assertEquals(actionName, mapping.getName());
	}

	// 測試取得action物件
	public void testbGetActionProxy() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail("bennett108@gmail.com");
		String productList = "{'productList':[{'product_id':'11'},{'product_id':'12'},{'product_id':'13'},{'product_id':'14'}]}";
		request.getSession().setAttribute("login", memberVO);
		request.setAttribute("productList", productList);
		
		ActionProxy proxy = getActionProxy(nameSpace +"/"+ actionName);
		assertNotNull(proxy);
		OneclickPackAction action = (OneclickPackAction) proxy.getAction();
		assertNotNull(action);
		String result = proxy.execute();
		assertEquals(Action.SUCCESS, result);
		
	}
}
