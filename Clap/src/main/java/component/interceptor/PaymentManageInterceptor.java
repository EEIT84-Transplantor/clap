package component.interceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.inject.util.Function;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.PreResultListener;

import member.model.MemberService;
import member.model.MemberVO;
import payment.model.CreditCardService;
import payment.model.CreditCardVO;
import payment.model.PromoCodeService;
import payment.model.PromoVO;

public class PaymentManageInterceptor extends AbstractInterceptor {
	private CreditCardService creditCardService;
	private MemberService memberService;
	private PromoCodeService promoCodeService;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		Map<String, Object> session = ctx.getSession();
		MemberVO mVo = (MemberVO) session.get("login");
		
		invocation.addPreResultListener(new PreResultListener() {

			@Override
			public void beforeResult(ActionInvocation invocation, String resultCode) {
				String email = mVo.getEmail();
				
				List<CreditCardVO> payment = creditCardService.getCards(email);

				Double amount = mVo.getAmount();
				List<String> cardType = new ArrayList<>();
				
				if(payment!=null){
					for (CreditCardVO cardIt : payment) {
						
						String visa = "^4[0-9]{12}(?:[0-9]{3})?$";
						String master = "^5[1-5][0-9]{14}$";
						String jcb = "^(?:2131|1800|35\\d{3})\\d{11}$";
						String cardNum = cardIt.getCreditCardPK().getCc_number();
						if (Pattern.matches(visa, cardNum)) {
							cardType.add("visa");
						} else if (Pattern.matches(master, cardNum)) {
							cardType.add("master");
						} else if (Pattern.matches(jcb, cardNum)) {
							cardType.add("JCB");
						} else {
							cardType.add("master");
						}
					}
				}
				
				List<PromoVO> promoCodes = promoCodeService.getPromos(email);
				session.put("cards", payment);
				session.put("amount", amount);
				session.put("promos", promoCodes);
				session.put("cardType", cardType);

			}
		});
		return invocation.invoke();

	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setCreditCardService(CreditCardService creditCardService) {
		this.creditCardService = creditCardService;
	}

	public void setPromoCodeService(PromoCodeService promoCodeService) {
		this.promoCodeService = promoCodeService;
	}

}
