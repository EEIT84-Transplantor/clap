package payment.model;

import java.util.List;

import javax.persistence.EmbeddedId;
import javax.persistence.ManyToOne;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class PromoCodeHibernateDAO implements PromoCodeDAO{


	private SessionFactory sessionFactory;
	private Session session;
	final private String SELECT_ALL = "from PromoCodeVO";

	public PromoCodeHibernateDAO() {
		
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<PromoCodeVO> selectAll() {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		List<PromoCodeVO> result = query.list();
		return result;
	}

	@Override
	public List<PromoCodeVO> selectByEmail(String mb_email) {
		List<PromoCodeVO> result = null;
		return result;
	}

	@Override
	public List<PromoVO> selectPromoVOByEmail(String mb_email) {
		List<PromoVO> result = null;
		return null;
	}
//	@EmbeddedId
//	private PromoCode promoCode;
//    @ManyToOne
//	protected PromoVO promoVO;
	@Override
	public PromoCodeVO insert(PromoCode promoCode) {
		System.out.println("################################A");
		session = sessionFactory.getCurrentSession();
		PromoCodeVO result = session.get(PromoCodeVO.class, promoCode);
//		Query query = session.createQuery("select po.pm_code,pd_category,pm_expire,pm_tiltle,pm_discount,mb_email from promocode as pc inner join promo as po on pc.pm_code=po.pm_code where po.pm_code=?");
//		System.out.println("################################q");
//		query.setParameter(0, promoCode);
//		PromoCodeVO result = null;
//		List<PromoCodeVO> list = query.list();
//	
//		for(PromoCodeVO pcv:list){
//			result = pcv;
//		}
		
		System.out.println("################################B");
		try {
			session.save(result);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean delete(String mb_email, String pm_code) {
		session = sessionFactory.getCurrentSession();
		PromoCodeVO result = new PromoCodeVO();
        PromoCode temp = new PromoCode();
		
		temp.setMb_email(mb_email);
		//temp.setPromoVO(promoVO);.setPm_code(pm_code);
		result.setPromoCode(temp);
		try {
			session.delete(result);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
