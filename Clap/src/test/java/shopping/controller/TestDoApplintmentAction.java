package shopping.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsSpringTestCase;
import org.apache.struts2.dispatcher.mapper.ActionMapping;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONObject;
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
public class TestDoApplintmentAction extends StrutsSpringTestCase {

	private String nameSpace = "/shopping";
	private String actionName = "doAppointmentAction";
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
		
		JSONObject object1 = new JSONObject();
		object1.append("id", "111");
		object1.append("time", "2016-04-19");
		object1.append("doctor", "1");
		JSONObject object2 = new JSONObject();
		object1.append("id", "222");
		object1.append("time", "2016-04-19");
		object1.append("doctor", "2");
		ArrayList<JSONObject> orderList = new ArrayList<>();
		orderList.add(object1);
		orderList.add(object2);
		
		request.setAttribute("hospital", "5");
		request.setAttribute("orderFormId","1" );
		request.setAttribute("orderList", orderList);
		
		ActionProxy proxy = getActionProxy(nameSpace +"/"+ actionName);
		assertNotNull(proxy);
		DoAppointmentAction action = (DoAppointmentAction) proxy.getAction();
		assertNotNull(action);
		String result = proxy.execute();
		assertEquals(Action.SUCCESS, result);
		
	}
}
















