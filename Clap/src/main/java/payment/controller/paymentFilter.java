package payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import member.model.MemberService;
import payment.model.CreditCardService;
import payment.model.CreditCardVO;
import payment.model.PromoCodeService;
import payment.model.PromoCodeVO;
import payment.model.PromoService;
import payment.model.PromoVO;

/**
 * Servlet Filter implementation class paymentFilter
 */
//@WebFilter("/payment/*")
public class paymentFilter implements Filter {
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
//		if(session.getAttribute("login")==null){
//			session.put("uri", ((HttpServletRequest)request).getRequestURI());
//		}else{
			String email = "caca@gmail.com";
			
			
			ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(fConfig.getServletContext());

			CreditCardService cservice = (CreditCardService)context.getBean("creditCardService");
			MemberService mService = (MemberService)context.getBean("memberService");
		//	PromoCodeService promoCodeService = (PromoCodeService)context.getBean("promoCodeService");
			
			List<CreditCardVO> payment = cservice.getCards(email);
			System.out.println("aaa"+cservice);
			
			Double amount = 9.99;
//			Double amount = mService.getAmount();
			
	//		List<PromoVO>promoCodes=promoCodeService.getPromos(email);
			request.setAttribute("cards",payment );
			request.setAttribute("amount", amount);
	//		request.setAttribute("promos", promoCodes);
			chain.doFilter(request, response);	
//		}

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
