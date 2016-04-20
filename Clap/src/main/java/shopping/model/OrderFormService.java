package shopping.model;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Session;

public class OrderFormService {

	private OrderFormHibernateDAO orderFormHibernateDAO;

	public OrderFormHibernateDAO getOrderFormHibernateDAO() {
		return orderFormHibernateDAO;
	}

	public void setOrderFormHibernateDAO(OrderFormHibernateDAO orderFormHibernateDAO) {
		this.orderFormHibernateDAO = orderFormHibernateDAO;
	}

	// 新增訂單 回傳訂單編號
	public Integer setOrderForm(Double total, String mb_email) {
		OrderFormVO orderFormVO = new OrderFormVO();
		orderFormVO.setMb_email(mb_email);
		orderFormVO.setStatus((byte) 1);
		orderFormVO.setTime(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		orderFormVO.setTotal(total);
		orderFormHibernateDAO.insert(orderFormVO);
		return orderFormVO.getId();
	}

	// 刪除order 一並刪除order detail
	public Boolean removeOrder(Integer id) {
		return orderFormHibernateDAO.delete(id);
	}

	//取得某會員有所有的orderform
	public List<OrderFormVO> getOrderList(String email) {
		return orderFormHibernateDAO.select(email);
	}


	//依照id搜尋
	public OrderFormVO getOrderById(Integer id) {
		return orderFormHibernateDAO.select(id);
	}

	//修改orderDetail
	public Boolean updateOrderForm(OrderFormVO orderFormVO) {
		return orderFormHibernateDAO.update(orderFormVO);
	}

}
