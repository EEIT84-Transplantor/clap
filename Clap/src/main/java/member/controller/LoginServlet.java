package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
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
import shopping.model.CartService;
import shopping.model.CartVO;

@WebServlet(urlPatterns = { "/member/login.servlet" })
public class LoginServlet extends HttpServlet {
	private CreditCardService creditCardService ;
	private MemberService memberService;
	private PromoCodeService promoCodeService;
	private HttpSession session;
	private CartService cartService;
	
	
	@Override
	public void init() throws ServletException {
		ApplicationContext context=WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		memberService = (MemberService) context.getBean("memberService");
		creditCardService = (CreditCardService) context.getBean("creditCardService");
		promoCodeService = (PromoCodeService) context.getBean("promoCodeService");
		cartService = (CartService) context.getBean("cartService");
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		MemberVO memberVO = null;
		MemberService memberService = (MemberService) request.getAttribute("memberService");
		Map<String,String> error = new HashMap<>();
		request.setAttribute("error", error);
		//input
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//validator cast
		if(password.trim().length()==0){
			error.put("password", "password is null");
		}
		
		//mvc
		if(!error.isEmpty()){
			request.getRequestDispatcher("signuplogin.jsp").forward(request, response);
			return;
		}
		
		if ((memberVO=memberService.login(email, password.getBytes()))!=null) {
			session = request.getSession();
			//清空購物車
			Map<Integer, Integer> tempCart = (Map<Integer, Integer>)session.getAttribute("tempCart");
		
			if (tempCart != null) {
				
				for(Integer key:tempCart.keySet()){
					
					Integer newQuantity=tempCart.get(key);
					for(CartVO cartvo:cartService.getCart(email)){
						System.out.println("9 9 "+cartvo.getProduct_id());
						if(cartvo.getProduct_id().equals(key)){
							System.out.println("a"+cartvo.getQuantity());
							newQuantity = tempCart.get(key)+cartvo.getQuantity();
							break;
						}
					}
					System.out.println("b"+newQuantity);
					cartService.setCart(email, key, newQuantity);
					
					
				}
				
				session.removeAttribute("tempCart");
				
			}
			
			//放會員資料及付款資料 進session
			
			
			session.setAttribute("login",memberVO);
			List<CartVO> cart = cartService.getCart(memberVO.getEmail());
			Integer totalCart = 0;
			for(CartVO cartVO:cart ){
				totalCart+=cartVO.getQuantity();
			}
			
			session.setAttribute("totalCart", totalCart);
			String uri = (String) session.getAttribute("uri");
			
			List<CreditCardVO> payment = creditCardService.getCards(email);
 			List<String> cardType = new ArrayList<>();
			if(payment!=null){
	 			for(CreditCardVO cardIt:payment){
					String visa = "^4[0-9]{12}(?:[0-9]{3})?$";
					String master = "^5[1-5][0-9]{14}$";
					String jcb="^(?:2131|1800|35\\d{3})\\d{11}$";
					String cardNum =cardIt.getCreditCardPK().getCc_number();
					if(Pattern.matches(visa,cardNum)){
						 cardType.add("visa");
				    }else if(Pattern.matches(master,cardNum)){
				    	cardType.add("master");
				    }else if(Pattern.matches(jcb,cardNum)){
				    	cardType.add("JCB");
				    } else{
				    	cardType.add("master");	
				    }	
	 			}
				}
 			Double amount = memberVO.getAmount();
 			if(amount==null){
 				amount = 0.0;
 			}
 			
 			List<PromoVO>promoCodes=promoCodeService.getPromos(email);
 			session.setAttribute("cards",payment);
 			session.setAttribute("amount", amount);
 			session.setAttribute("promos", promoCodes);
 			session.setAttribute("cardType", cardType);
			
			if(uri==null){
				response.sendRedirect("../index.jsp");	
			}else{
				response.sendRedirect(uri);
			}
			
		}else {
			error.put("password", "password is wrong");
			request.getRequestDispatcher("signuplogin.jsp").forward(request, response);			
		}
		return;
		
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
