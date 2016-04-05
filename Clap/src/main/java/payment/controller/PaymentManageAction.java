package payment.controller;

import java.io.IOException;
import java.time.Year;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.transaction.support.ResourceTransactionManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ValidationAware;

import member.model.MemberService;
import payment.model.CreditCardDAO;
import payment.model.CreditCardService;
import payment.model.CreditCardVO;
import payment.model.GiftCardService;
import payment.model.GiftCardVO;
import payment.model.PromoCodeService;
import payment.model.PromoCodeVO;
import payment.model.PromoService;
import payment.model.PromoVO;

public class PaymentManageAction extends ActionSupport implements ValidationAware {
	private String buttonClicked;
	private CreditCardVO creditCardVO;
	private GiftCardVO giftCardVO;
	private PromoCodeVO promoCodeVO;
	private PromoService promoService = new PromoService();
	private GiftCardService giftCardService = new GiftCardService();
	
	public String getButtonClicked() {
		return buttonClicked;
	}

	public void setButtonClicked(String buttonClicked) {
		this.buttonClicked = buttonClicked;
	}

	public CreditCardVO getCreditCardVO() {
		return creditCardVO;
	}

	public void setCreditCardVO(CreditCardVO creditCardVO) {
		this.creditCardVO = creditCardVO;
	}

	public GiftCardVO getGiftCardVO() {
		return giftCardVO;
	}

	public void setGiftCardVO(GiftCardVO giftCardVO) {
		this.giftCardVO = giftCardVO;
	}

	public PromoCodeVO getPromoCodeVO() {
		return promoCodeVO;
	}

	public void setPromoCodeVO(PromoCodeVO promoCodeVO) {
		this.promoCodeVO = promoCodeVO;
	}
	public void validate(){
		System.out.println("validate");
	     if(buttonClicked.equalsIgnoreCase("AddCreditCard")){
	    	 System.out.println("button");
	    	 if(creditCardVO.getCc_number()==null||!checkCreditCard(creditCardVO.getCc_number())){
	    		 addFieldError("error.errorMsg", "Credit Card Number is not valid");
	    	 }
	    	 if(creditCardVO.getCc_cvv()==null||!Pattern.matches("\\d{3}", creditCardVO.getCc_cvv())){
	    		 addFieldError("error.errorMsg", "CVV is not valid");
	    		 System.out.println("hello2");
	    	 }
	    	 String goodThru = creditCardVO.getCc_goodthru();
	    	 if(goodThru==null||!Pattern.matches("^(0[1-9]|1[0-2])/([0-9]{2})$", goodThru)||Integer.parseInt(goodThru.substring(3))<Calendar.getInstance().get(Calendar.YEAR)||
	    			 Integer.parseInt(goodThru.substring(3))==Calendar.getInstance().get(Calendar.YEAR) &&Integer.parseInt(goodThru.substring(0,2))<Calendar.getInstance().get(Calendar.MONTH)){
	    		 addFieldError("error.errorMsg", "GoodThru is not valid");
	    		 System.out.println("hello233");
	    	 }
	     }else if(buttonClicked.equalsIgnoreCase("AddPromoCode")){
	    	 if(promoCodeVO.getPc_code()==null||!promoService.isAvailable(promoCodeVO.getPc_code())){
	    		 addFieldError("error.errorMsg", "Promo Code is not valid");
	    	 }
	     }else if(buttonClicked.equalsIgnoreCase("AddGiftCard")){
	    	 if(giftCardVO.getGc_number()==null||giftCardVO.getGc_code()==null){
	    		 addFieldError("error.errorMsg", "Gift Card is not valid");
	    	 }
	     }
	}
	private boolean checkCreditCard(String cardNum){
		boolean result = true;
		String visa = "^4[0-9]{12}(?:[0-9]{3})?$";
		String master = "^5[1-5][0-9]{14}$";
		String americanExpress="^3[47][0-9]{13}$";
		String dinersClub =" ^3(?:0[0-5]|[68][0-9])[0-9]{11}$";
		String discover ="^6(?:011|5[0-9]{2})[0-9]{12}$";
		String jcb="^(?:2131|1800|35\\d{3})\\d{11}$";

	    if(Pattern.matches(visa,cardNum)||Pattern.matches(master,cardNum)||
	    	Pattern.matches(americanExpress,cardNum)||Pattern.matches(dinersClub,cardNum)||
	    	Pattern.matches(discover,cardNum)||Pattern.matches(jcb,cardNum)){
	    		return true;
	    }else{
	    	return false;
	    }
	    
	}
	
	
	
	public String execute(){
		System.out.println("execute");
		HttpServletRequest request = ServletActionContext.getRequest();
		RequestDispatcher rd= request.getRequestDispatcher("/payment/manage.controller");
		HttpServletResponse response = ServletActionContext.getResponse();
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
//		String email = (String) request.getSession().getAttribute("mb_email");
		String email = "caca@gmail.com";
		request.setAttribute("buttonClicked", buttonClicked);
		if(buttonClicked.equalsIgnoreCase("AddCreditCard")){
			CreditCardService cservice = (CreditCardService)context.getBean("creditCardService");
			creditCardVO.setMb_email(email);
			CreditCardVO result = cservice.setCard(creditCardVO);			
			System.out.println("result="+result);
			if(result!=null){
				request.setAttribute("result", result);
			}
		}else if(buttonClicked.equalsIgnoreCase("AddGiftCard")){
			GiftCardService gservice = (GiftCardService)context.getBean("giftCardService");
			Double amount = gservice.useCard(giftCardVO.getGc_number(), giftCardVO.getGc_code());
			if(amount!=0.0){
				MemberService mservice = (MemberService)context.getBean("memeberService");
//				amount += oldAmount;
				mservice.setAmount(email,amount);	//這個setamount沒有getamount無法得知之前的$$
				request.setAttribute("result", amount);
			}
		}else if(buttonClicked.equalsIgnoreCase("AddPromoCode")){
			PromoService promoService = (PromoService)context.getBean("promoService");
			if(promoService.isAvailable(promoCodeVO.getPc_code())){
				PromoCodeService promoCodeService = (PromoCodeService)context.getBean("promoCodeService");
				PromoCodeVO result = promoCodeService.setPromotionCode(email,promoCodeVO.getPc_code());
				if(result!=null){
					request.setAttribute("result", "result");
				}
			}	
		}
		
		
		
		
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		((ConfigurableApplicationContext)context).close();
		return "success";
		
	
	}
	

}
