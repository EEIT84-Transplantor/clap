package shopping.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;

import org.apache.struts2.StrutsSpringTestCase;
import org.apache.struts2.dispatcher.mapper.ActionMapping;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionProxy;

import member.model.MemberVO;
import payment.model.PromoVO;
import setting.controller.ChangePasswordAction;
import shopping.model.CartVO;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestCartAction extends StrutsSpringTestCase {

	private String nameSpace = "/shopping";
	private String actionName = "cartAction";
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
		memberVO.setEmail("caca@gmail.com");
		request.getSession().setAttribute("login", memberVO);
		ActionProxy proxy = getActionProxy(nameSpace +"/"+ actionName);
		assertNotNull(proxy);
		CartAction action = (CartAction) proxy.getAction();
		assertNotNull(action);
		String result = proxy.execute();
		assertEquals(Action.SUCCESS, result);
	}

	// 測試excute()後產生的值
	public void testdGetValueFromStack() throws ServletException, UnsupportedEncodingException {
		executeAction(actionName);
		List<CartVO> cartList = (List<CartVO>) findValueAfterExecute("cartList");
		List<PromoVO> promoList = (List<PromoVO>) findValueAfterExecute("promoList");
		assertEquals(true, cartList.size() > 0 && promoList.size() > 0);
	}

}
