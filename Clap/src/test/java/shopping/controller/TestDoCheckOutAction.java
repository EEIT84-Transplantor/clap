package shopping.controller;

import org.apache.struts2.StrutsSpringTestCase;
import org.apache.struts2.dispatcher.mapper.ActionMapping;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionProxy;

import member.model.MemberVO;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestDoCheckOutAction extends StrutsSpringTestCase {

	private String nameSpace = "/shopping";
	private String actionName = "doCheckOutAction";
	private SessionFactory sessionFactory;
	private Session session;
	private MockHttpSession msession;

	@Override
	protected void setupBeforeInitDispatcher() throws Exception {
		super.setupBeforeInitDispatcher();
		msession=new MockHttpSession();
		request.setSession(msession);
		RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));  
		
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
		ActionMapping mapping = getActionMapping(nameSpace + "/" + actionName);
		assertNotNull(mapping);
		assertEquals(nameSpace, mapping.getNamespace());
		assertEquals(actionName, mapping.getName());
	}

	// 測試取得action物件
	public void testbGetActionProxy() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail("caca@gmail.com");
		memberVO.setAmount(99999999.0);
		Double total = 999999999.0;
//		request.setAttribute("total", total);
//		request.setAttribute("login", memberVO);

		msession.setAttribute("total", total);
		msession.setAttribute("login", memberVO);

		ActionProxy proxy = getActionProxy(nameSpace + "/" + actionName);
		assertNotNull(proxy);
		DoCheckOutAction action = (DoCheckOutAction) proxy.getAction();
		assertNotNull(action);
		String result = proxy.execute();
		assertEquals(Action.SUCCESS, result);

	}
}
