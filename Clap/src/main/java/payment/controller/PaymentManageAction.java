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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.transaction.support.ResourceTransactionManager;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.ValidationAware;

import member.model.MemberService;
import member.model.MemberVO;
import payment.model.CreditCardPK;
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
	private PromoVO promoVO;
	
	private PromoService promoService;
	private GiftCardService giftCardService;
	private CreditCardService creditCardService;
	private MemberService memberService;
	private PromoCodeService promoCodeService;
	
	private String errorMessage;


	public void setPromoCodeService(PromoCodeService promoCodeService) {
		this.promoCodeService = promoCodeService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setCreditCardService(CreditCardService creditCardService) {
		this.creditCardService = creditCardService;
	}

	public void setPromoService(PromoService promoService) {
		this.promoService = promoService;
	}

	public void setGiftCardService(GiftCardService giftCardService) {
		this.giftCardService = giftCardService;
	}

	public PromoVO getPromoVO() {
		return promoVO;
	}

	public void setPromoVO(PromoVO promoVO) {
		this.promoVO = promoVO;
	}
	
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
		HttpServletRequest request = ServletActionContext.getRequest();
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("login");
		String email = memberVO.getEmail();
		if(buttonClicked.equalsIgnoreCase("AddCreditCard")){
	    	 System.out.println("button");
	    	 if(creditCardVO.getCreditCardPK().getCc_number()==null||!checkCreditCardPK(creditCardVO.getCreditCardPK().getCc_number())){
	    		 errorMessage= "Credit Card Number is not valid";
	    		
	    	 }
	    	 System.out.println(email+creditCardVO.getCreditCardPK().getCc_number() );
	    	 System.out.println(creditCardService.getCard(  email,   creditCardVO.getCreditCardPK().getCc_number()  ));
    		 if(creditCardService.getCard(email,creditCardVO.getCreditCardPK().getCc_number()  ) != null){
	    		 errorMessage= "Credit Card Number already exists";
	    	 }
	    	 
	    	 if(creditCardVO.getCc_cvv()==null||!Pattern.matches("\\d{3}", creditCardVO.getCc_cvv())){
	    		 errorMessage="CVV is not valid";
	    	 }
	    	 String goodThru = creditCardVO.getCc_goodthru();
	    	 if(goodThru==null||!Pattern.matches("^(0[1-9]|1[0-2])/([0-9]{2})$", goodThru)||Integer.parseInt(goodThru.substring(3))+2000<Calendar.getInstance().get(Calendar.YEAR)||
	    			 Integer.parseInt(goodThru.substring(3))+2000==Calendar.getInstance().get(Calendar.YEAR) &&Integer.parseInt(goodThru.substring(0,2))<Calendar.getInstance().get(Calendar.MONTH)+1){
	    		 errorMessage="GoodThru is not valid";
	    	 }
	    	 
	     }else if(buttonClicked.equalsIgnoreCase("AddPromoCode")){
	    	 if(promoCodeVO.getPromoCode().getPm_code()==null||!promoService.isAvailable(promoCodeVO.getPromoCode().getPm_code())){
	    		 errorMessage= "Promo Code is not valid";
	    	 }
	     }else if(buttonClicked.equalsIgnoreCase("UseGiftCard")){
	    	 System.out.println("4");
	    	 if(giftCardVO.getGc_number()==null||giftCardVO.getGc_code()==null){
	    		 errorMessage="Gift Card is not valid";
	    	 }
	     }
	}
	private Boolean checkCreditCardPK(String cardNum){
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
		System.out.println(errorMessage);
		System.out.println("execute");
		HttpServletRequest request = ServletActionContext.getRequest();
		RequestDispatcher rd= request.getRequestDispatcher("/payment/manage.controller");
		HttpServletResponse response = ServletActionContext.getResponse();
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("login");
		String email = memberVO.getEmail();
		String name = memberVO.getName();
//		String name="haha";
		if(name== null||name.length()==0){
			name="Guest";
		}
//		String email = "caca@gmail.com";
		
		//send error JSON
		if(errorMessage!=null){
			JSONArray res = new JSONArray();
			JSONObject buttonClickedJson = new JSONObject();
			buttonClickedJson.put("isError", true);
			buttonClickedJson.put("errorMessage", errorMessage);
			buttonClickedJson.put("buttonClicked", buttonClicked);
			res.put(buttonClickedJson);
			request.setAttribute("results", res);
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "success";
		}
		//end of error JSON
		System.out.println("jiii"+email);
		errorMessage =null;
		request.setAttribute("buttonClicked", buttonClicked);
		JSONArray res = new JSONArray();
		JSONObject buttonClickedJson = new JSONObject();
		buttonClickedJson.put("buttonClicked", buttonClicked);
		buttonClickedJson.put("isError", false);
		res.put(buttonClickedJson);
		
		if(buttonClicked.equalsIgnoreCase("AddCreditCard")){
//			creditCard.setMb_email(email);
//			creditCardVO.setCreditCardPK(creditCard);

			creditCardVO.getCreditCardPK().setMb_email(email);

			System.out.println("jsssssi"+creditCardVO.getCreditCardPK().getCc_number()+creditCardVO.getCreditCardPK().getMb_email()+creditCardVO.getCc_cvv());

			CreditCardVO resultVO = creditCardService.setCard(creditCardVO);
			JSONObject result = new JSONObject();
			String cardType = this.checkCreditCardType(resultVO.getCreditCardPK().getCc_number());
			System.out.println("ji"+resultVO);
			result.put("cc_number", resultVO.getCreditCardPK().getCc_number());
			result.put("cc_goodthru", resultVO.getCc_goodthru());
			result.put("name", name);
			result.put("cardType", cardType);
			res.put(result);	
		}else if(buttonClicked.equalsIgnoreCase("USEGiftCard")){
			Double amount = giftCardService.useCard(giftCardVO.getGc_number(), giftCardVO.getGc_code());
			Boolean success1=false;
			Double amountPrev = amount;
			if(amount!=0.0){
				Double a= 0.0;
				if(memberService.getAmount(email)!=null){
					a=memberService.getAmount(email);
				}
				amount+=a;
				success1 =memberService.setAmount(email,amount);
			}
			JSONObject result = new JSONObject();
			result.put("success", success1);
			result.put("result", amountPrev);
			result.put("amount", amount);

			res.put(result);	

			
		}else if(buttonClicked.equalsIgnoreCase("AddPromoCode")){
			Boolean resultBoolean=false;
			JSONObject promoDetails = null;
			if(promoService.isAvailable(promoCodeVO.getPromoCode().getPm_code())){
				PromoCodeVO result = promoCodeService.setPromotionCode(email,promoCodeVO.getPromoCode().getPm_code());

				if(result!=null){

					resultBoolean = true;
					PromoVO promoDetailVO = promoService.getPromoDetail(promoCodeVO.getPromoCode().getPm_code());
					promoDetails=new JSONObject();
					System.out.println(promoDetailVO);
					promoDetails.put("pm_title", promoDetailVO.getPm_title());
					promoDetails.put("pm_expire", promoDetailVO.getPm_expire());
					promoDetails.put("pm_code", promoDetailVO.getPm_code());
					promoDetails.put("pd_category", promoDetailVO.getPd_category());
					promoDetails.put("pm_discount", promoDetailVO.getPm_discount());
				}
			}
			
			JSONObject result = new JSONObject();
			result.put("result", resultBoolean);
			res.put(result);
			if(promoDetails!=null){
				res.put(promoDetails);
			}
			System.out.println(res.toString());
		
		}else if(buttonClicked.equalsIgnoreCase("deleteCreditCard")){
			//removeCard should be able to take in email as param
			Boolean resultBoolean = creditCardService.removeCard(creditCardVO.getCreditCardPK().getCc_number(),email);
			JSONObject result = new JSONObject();
			result.put("result", resultBoolean);
			result.put("cc_number",creditCardVO.getCreditCardPK().getCc_number());
			res.put(result);
		}else if(buttonClicked.equalsIgnoreCase("deletePromotion")){
			Boolean resultBoolean= false;
			resultBoolean = promoCodeService.removePromotionCode(email, promoCodeVO.getPromoCode().getPm_code());

			JSONObject result = new JSONObject();
			result.put("result", resultBoolean);
			res.put(result);
		}

		request.setAttribute("results", res);
		
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
		
	}
	
	private String checkCreditCardType(String cardNum){
		String visa = "^4[0-9]{12}(?:[0-9]{3})?$";
		String master = "^5[1-5][0-9]{14}$";
		String jcb="^(?:2131|1800|35\\d{3})\\d{11}$";
	    if(Pattern.matches(visa,cardNum)){
	    	return "visa";
	    }else if(Pattern.matches(master,cardNum)){
	    	return "master";
	    }else if(Pattern.matches(jcb,cardNum)){
	    	return "JCB";
	    } else{
	    	return "master";	
	    }
	}
	
	
	
}
