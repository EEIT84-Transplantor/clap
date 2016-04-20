package component.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import member.model.MemberVO;

public class AdminInterceptor  extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		String result;
		//取得session裡的login
		ActionContext applicationContext = arg0.getInvocationContext();
		Map<String, Object> session = applicationContext.getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		MemberVO memberVO = (MemberVO) session.get("login");
		System.out.println(request.getAttribute("promoVO"));
		System.out.println(memberVO);
		System.out.println("AdminInterceptor");
		if (memberVO==null) {
			//沒找到 儲存上一個頁面  導入login.jsp
			session.put("uri", request.getRequestURI());
			System.out.println(request.getRequestURI());
			return "login";
		} else if(memberVO.getType()==null||memberVO.getType()!=2){
			
			return "index";
			
		}else {//找到 繼續下去
			result = arg0.invoke();			
			return result;
		}
		
	}
}
