package payment.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import product.model.CategoryDAO;

public class PromoService {
	private PromoDAO dao;
	private CategoryDAO categoryDAO;
	
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	public static void main(String[] args){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		PromoService pservice = (PromoService)context.getBean("promoService");
		PromoDAO pdao = (PromoDAO)context.getBean("promoDAO");
		PromoVO vo = pdao.selectByCode("111");
		//vo.setPm_code("666");
		//System.out.println(pservice.setPromo(vo));
		System.out.println(pservice.isAvailable("666"));
	}
	
	public PromoService() {
	}

	public void setDao(PromoDAO dao) {
		this.dao = dao;
	}

	public boolean setPromo(PromoVO promoVO){
		boolean result = false;
		if(promoVO!=null){
			Integer pd_category = promoVO.getPd_category();
			String pm_code = promoVO.getPm_code();
			Double pm_discount = promoVO.getPm_discount();
			java.util.Date pm_expire = promoVO.getPm_expire();
			String pm_tiltle = promoVO.getPm_tiltle();
			
			if(pd_category==null){
				return result;
			}
			if(pm_code==null||pm_code.length()==0){
				return result;
			}
			if(pm_discount==null||pm_discount==0){
				return result;
			}
			
			if(pm_expire==null||pm_expire.getTime()<System.currentTimeMillis()){
				return result;
			}
			if(pm_tiltle==null||pm_tiltle.length()==0){
				return result;
			}
			if(dao.insert(promoVO)!=null){
				result = true;
			}
		}
		return result;
	};

	public boolean isAvailable(String pm_code){
		boolean result = false;
		
		if(pm_code!=null||pm_code.length()!=0){
			PromoVO temp = dao.selectByCode(pm_code);
			if(temp!=null){
				if(temp.getPm_expire().getTime()>=System.currentTimeMillis()){
					result = true;
				}
			}
		}
		return result;
	};
	public PromoVO getPromoDetail(String pm_code){
		PromoVO result = null;
		if(pm_code==null||pm_code.length()==0||!this.isAvailable(pm_code)){
			return result;
		}else{			
			result = dao.selectByCode(pm_code);
		}
		return result;
	}
	public List<PromoVO> getAllPromos(boolean involveExpired){
		if(involveExpired){
			return dao.selectAll();
		}else{
			return dao.selectUnexpired();
		}
	}
	public List<PromoVO> getAllPromosByStartDate(Date date){
		Calendar currentDate = Calendar.getInstance(); //Get the current date
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss"); //format it as per your requirement
		String dateNow = formatter.format(date.getTime());
		return dao.selectByStartDate(date);
	}
	public List<PromoVO> getAllPromosByEndDate(Date date){
		Calendar currentDate = Calendar.getInstance(); //Get the current date
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss"); //format it as per your requirement
		String dateNow = formatter.format(date.getTime());
		return dao.selectByEndingDate(date);	
	}
	public List<PromoVO> getAllPromosByBetweenDate(Date startDate,Date endDate){
	
		return dao.selectByBetweenDates(startDate,endDate);
	}
	public List<PromoVO> getAllPromosByCategory(Integer categoryId){
		return dao.selectByCategory(categoryId);
	}
	public List<String> getAllCategoryNames(List<PromoVO> promoVOs){
		List<Integer> result = new ArrayList<Integer>();
		for(PromoVO vo:promoVOs ){
			if(!result.contains(vo.getPd_category())){
				result.add(vo.getPd_category());
			}
		}
		List<String> resultInString =new ArrayList<String>();
		for(Integer r: result){
			resultInString.add(categoryDAO.selectById(r).getName());
		}
		
		return resultInString;
	}
	public boolean updatePromo(PromoVO promoVO){
		return dao.update(promoVO);
	}
	public Integer selectByCategoryName(String category_name){
		return categoryDAO.selectByCategoryName(category_name).get(0).getId();
	}
}
