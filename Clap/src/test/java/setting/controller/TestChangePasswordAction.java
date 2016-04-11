package setting.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;

import org.apache.struts2.StrutsSpringTestCase;
import org.apache.struts2.dispatcher.mapper.ActionMapping;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionProxy;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestChangePasswordAction extends StrutsSpringTestCase {

	private String changePasswordAction = "/setting/changePasswordAction.action";


	// 測試action註冊正確
	public void testaGetActionMapping() {
		ActionMapping mapping = getActionMapping(changePasswordAction);
		assertNotNull(mapping);
		assertEquals("/setting", mapping.getNamespace());
		assertEquals("changePasswordAction", mapping.getName());
	}

	// 測試取得action物件
	public void testbGetActionProxy() throws Exception {
		request.setParameter("email", "FD");
		request.setParameter("password", "FD");
		request.setParameter("newpassword", "FD");
		request.setParameter("confirm", "FD");

		ActionProxy proxy = getActionProxy(changePasswordAction);
		assertNotNull(proxy);

		ChangePasswordAction action = (ChangePasswordAction) proxy.getAction();
		assertNotNull(action);

		String result = proxy.execute();

		assertEquals(Action.SUCCESS, result);
		assertEquals("FD", action.getEmail());
	}

	// 測試excute()方法
	public void testcExecuteAction() throws ServletException, UnsupportedEncodingException {
		String output = executeAction(changePasswordAction);
		assertEquals("Hello", output);
	}

	// 測試excute()後產生的值
	public void testdGetValueFromStack() throws ServletException, UnsupportedEncodingException {
		request.setParameter("email", "FD");
		executeAction(changePasswordAction);
		String name = (String) findValueAfterExecute("email");
		assertEquals("FD", name);
	}

}
