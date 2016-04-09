package component.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import member.model.MemberVO;

public class LoginInterceptor extends AbstractInterceptor{

	private String result;

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		
		//取得session裡的login
		ActionContext applicationContext = arg0.getInvocationContext();
		Map<String, Object> session = applicationContext.getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		MemberVO memberVO = (MemberVO) session.get("login");
		
		if (memberVO==null) {
			//沒找到 儲存上一個頁面  導入login.jsp
			session.put("uri", request.getRequestURI());
			return "login";
		} else {
			//找到 繼續下去
			result = arg0.invoke();			
			return result;
		}
		
	}

}
