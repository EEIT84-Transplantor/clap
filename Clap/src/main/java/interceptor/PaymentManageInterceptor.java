package interceptor;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import member.model.MemberService;
import member.model.MemberVO;
import payment.model.CreditCardService;
import payment.model.CreditCardVO;
import payment.model.PromoCodeService;
import payment.model.PromoVO;

public class PaymentManageInterceptor extends AbstractInterceptor {
	private CreditCardService creditCardService ;
	private MemberService memberService;
	private PromoCodeService promoCodeService;
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		 ActionContext ctx = invocation.getInvocationContext();
         Map<String, Object> session = ctx.getSession();
         MemberVO mVo  = (MemberVO)session.get("login");
         HttpServletRequest request = ServletActionContext.getRequest();
         String uri = request.getRequestURI();

         if(mVo == null){
        	 session.put("uri", request.getRequestURI());
        	 System.out.println("paymentManage Interceptor");
        	 return "login";
         }else{
        	String email=mVo.getEmail();
 			List<CreditCardVO> payment = creditCardService.getCards(email);
 			
 			Double amount = mVo.getAmount();
// 			Double amount = mService.getAmount();
 			
 			List<PromoVO>promoCodes=promoCodeService.getPromos(email);
 			request.setAttribute("cards",payment);
 			request.setAttribute("amount", amount);
 			request.setAttribute("promos", promoCodes);
 			return "paymentManage";
         }
         
	}
	public void setCreditCardService(CreditCardService creditCardService) {
		this.creditCardService = creditCardService;
	}
	public void setmService(MemberService mService) {
		this.memberService = memberService;
	}
	public void setPromoCodeService(PromoCodeService promoCodeService) {
		this.promoCodeService = promoCodeService;
	}

}
