package payment.model;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GiftCardService {
	
	public static void main(String[] args){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		GiftCardService gservice = (GiftCardService)context.getBean("giftCardService");
		System.out.println(gservice.isAvailable("1111"));
		System.out.println(gservice.getAmount("1111"));
		gservice.useCard("1111","gccode1");
	}
	
	private GiftCardDAO dao;
	
	public GiftCardService() {
		super();
	}
	public void setDao(GiftCardDAO dao) {
		this.dao = dao;
	}
	public Double useCard (String gc_number,String gc_code){
		Double result = 0.0;
		if(gc_number==null||gc_number.length()==0){
			return result;
		}
		if(gc_code==null||gc_code.length()==0){
			return result;
		}
		 GiftCardVO temp = dao.selectByGcNumber(gc_number);
		 if(temp==null){
			 return result;
		 }
		 
		 if(temp.getGc_code().equals(gc_code)&&isAvailable(gc_number)){
			//此卡片失效
			 temp.setGc_available(0);
			 if(dao.update(temp)){
				 result = temp.getGc_amount();
				 System.out.println(result);
			 }
			 
		 }
		return result;
	};
	private boolean isAvailable(String gc_number){
		boolean result = false;
		if(gc_number==null||gc_number.length()==0){
			return result;
		}
		
		 GiftCardVO temp = dao.selectByGcNumber(gc_number);
		if(temp!=null){
			if(temp.getGc_available()==1){
				result = true;
			}
		}
		return result;
	};
	private Double getAmount(String gc_number){
		Double result = 0.0;
		if(gc_number==null||gc_number.length()==0){
			return result;
		}
		
		GiftCardVO  temp = dao.selectByGcNumber(gc_number);
	    if(temp!=null){
	    	result = temp.getGc_amount();
	    }
		return result;
	};

}
