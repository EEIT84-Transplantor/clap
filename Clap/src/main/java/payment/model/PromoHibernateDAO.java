package payment.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class PromoHibernateDAO implements PromoDAO{

	private SessionFactory sessionFactory;
	private Session session;
	final private String SELECT_ALL = "from PromoVO";
	final private String SELECT_ALL_UNEXPIRED = "from PromoVO where pm_expire>?";
	final private String SELECT_ALL_ENDING_DATE = "from PromoVO where pm_expire<?";
	final private String SELECT_ALL_BETWEEN = "from PromoVO where pm_expire < ? and pm_expire >? ";

	public PromoHibernateDAO() {
		
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<PromoVO> selectAll() {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL);
		List<PromoVO> result = query.list();
		return result;
	}
	@Override
	public List<PromoVO> selectUnexpired() {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL_UNEXPIRED);
		Calendar currentDate = Calendar.getInstance(); //Get the current date
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss"); //format it as per your requirement
		String dateNow = formatter.format(currentDate.getTime());
		System.out.println(dateNow);
		query.setParameter(0, dateNow);
		List<PromoVO> result = query.list();
		return result;
	}
	@Override
	public List<PromoVO> selectByStartDate(String startDate) {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL_UNEXPIRED);
		System.out.println(startDate);
		query.setParameter(0, startDate);
		List<PromoVO> result = query.list();
		return result;
	}
	@Override
	public List<PromoVO> selectByEndingDate (String endDate) {
		session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(SELECT_ALL_ENDING_DATE);
		System.out.println(endDate);
		query.setParameter(0, endDate);
		List<PromoVO> result = query.list();
		return result;
	}
	@Override
	public PromoVO selectByCode(String pm_code) {
		session = sessionFactory.getCurrentSession();
		PromoVO result = session.get(PromoVO.class, pm_code);
		return result;
	}

	@Override
	public PromoVO insert(PromoVO promoVO) {
        session = sessionFactory.getCurrentSession();
		
		try {
			session.save(promoVO);
			return promoVO;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean update(PromoVO promoVO) {
        session = sessionFactory.getCurrentSession();
		
		try {
			session.update(promoVO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(String pm_code) {
		session = sessionFactory.getCurrentSession();
		PromoVO result = session.get(PromoVO.class, pm_code);
		try {
			session.delete(result);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
