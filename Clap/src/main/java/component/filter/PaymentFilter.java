package component.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import member.model.MemberService;
import member.model.MemberVO;
import payment.model.CreditCardService;
import payment.model.CreditCardVO;
import payment.model.PromoCodeService;
import payment.model.PromoVO;

/**
 * Servlet Filter implementation class paymentFilter
 */

//@WebFilter("/payment/paymentmanage.jsp")

public class PaymentFilter implements Filter {
//	CreditCardService cservice;
//	MemberService mServic;
//	PromoCodeService promoCodeService;
//	
//	public void setCservice(CreditCardService cservice) {
//		this.cservice = cservice;
//	}
//
//	public void setmServic(MemberService mServic) {
//		this.mServic = mServic;
//	}
//
//	public void setPromoCodeService(PromoCodeService promoCodeService) {
//		this.promoCodeService = promoCodeService;
//	}
  private FilterConfig fConfig;
	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		if(session.getAttribute("login")==null){
			session.setAttribute("uri", ((HttpServletRequest)request).getRequestURI());
			((HttpServletResponse)response).sendRedirect("/Clap/member/signuplogin.jsp");
		}else{
//			String email = "caca@gmail.com";

			MemberVO mVo = (MemberVO)session.getAttribute("login");
//			ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");		
			
			ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(fConfig.getServletContext());

			CreditCardService cservice = (CreditCardService)context.getBean("creditCardService");
			MemberService mService = (MemberService)context.getBean("memberService");
			PromoCodeService promoCodeService = (PromoCodeService)context.getBean("promoCodeService");
			session.getAttribute("login");
		//	PromoCodeService promoCodeService = (PromoCodeService)context.getBean("promoCodeService");
			String email = mVo.getEmail();

			List<CreditCardVO> payment = cservice.getCards(email);

//			Double amount = 9.99;
			Double amount = mVo.getAmount();

			
			
//			Double amount = 9.99;
//			Double amount = mService.getAmount();

			
			List<PromoVO>promoCodes=promoCodeService.getPromos("caca@gmail.com");
			request.setAttribute("cards",payment );
			request.setAttribute("amount", amount);
			request.setAttribute("promos", promoCodes);
			chain.doFilter(request, response);	
		}

		// String email = (String) session.getAttribute("email");
	
		// JSONObject object = new JSONObject();
		// object.put("creditCards", payment);
		// object.put("amount", amount);
		// object.put("promoCodes", promoCodes);
		// request.setAttribute("payment", object);
			
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.fConfig = fConfig;
	}

}
