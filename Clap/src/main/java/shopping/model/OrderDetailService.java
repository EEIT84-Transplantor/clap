package shopping.model;

import java.util.List;

import org.springframework.dao.support.DaoSupport;

public class OrderDetailService {

	private OrderDetailHibernateDAO orderDetailHibernateDAO;

	public OrderDetailHibernateDAO getOrderDetailHibernateDAO() {
		return orderDetailHibernateDAO;
	}

	public void setOrderDetailHibernateDAO(OrderDetailHibernateDAO orderDetailHibernateDAO) {
		this.orderDetailHibernateDAO = orderDetailHibernateDAO;
	}

	public Boolean setOrderDetail(Integer orderform_id, CartVO cartVO) {
		OrderDetailVO orderDetailVO = new OrderDetailVO();
		orderDetailVO.setId(orderform_id);
		orderDetailVO.setProduct_id(cartVO.getProduct_id());
		orderDetailVO.setCt_quantity(cartVO.getQuantity());
		orderDetailVO.setOrderform_id(orderform_id);
		return orderDetailHibernateDAO.insert(orderDetailVO);
	}

	public List<OrderDetailVO> getOrderDetailList(Integer orderId) {
		return orderDetailHibernateDAO.select(orderId);
	}

	//修改orderDetailVO
	public Boolean updateOrderDetail(OrderDetailVO orderDetailVO) {
		return orderDetailHibernateDAO.update(orderDetailVO);
	}
	
	//取得 orderDetailVO
	public OrderDetailVO getOrderDetailById(Integer orderDetailId) {
		return orderDetailHibernateDAO.selectById(orderDetailId);
	}

}
