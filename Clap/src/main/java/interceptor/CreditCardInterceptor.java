package interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import member.model.MemberVO;
import payment.model.CreditCardService;
import payment.model.CreditCardVO;

public class CreditCardInterceptor extends AbstractInterceptor {

	CreditCardService creditCardService;

	public void setCreditCardService(CreditCardService creditCardService) {
		this.creditCardService = creditCardService;
	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {

		// 取得卡片VO
		ActionContext applicationContext = arg0.getInvocationContext();
		Map<String, Object> session = applicationContext.getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		MemberVO memberVO = (MemberVO) session.get("login");
		if (memberVO.getNumber() == null) {
			// 卡片無效 儲存上一個頁面 導入paymentManage.jsp
			session.put("uri", request.getRequestURI());
			return "paymentManage";
		}
		CreditCardVO creditCardVO = creditCardService.getCard(memberVO.getNumber());
		if (creditCardService.isAvailable(creditCardVO)) {
			// 卡片無效 儲存上一個頁面 導入paymentManage.jsp
			session.put("uri", request.getRequestURI());
			return "paymentManage";
		} else {
			// 卡片有效 繼續下去
			return arg0.invoke();
		}
	}
}
