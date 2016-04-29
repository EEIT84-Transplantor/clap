package shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.junit.runner.Request;

import com.opensymphony.xwork2.ActionSupport;

import shopping.model.OrderDetailService;
import shopping.model.OrderDetailVO;

public class OrderDetailAction extends ActionSupport implements ServletRequestAware {

	private OrderDetailService orderDetailService;
	private String orderId;
	private HttpServletRequest request;

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public OrderDetailService getOrderDetailService() {
		return orderDetailService;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Override
	public String execute() throws Exception {
		// 取得orderDetail
		Integer id = Integer.parseInt(orderId);
		List<OrderDetailVO> orderList = orderDetailService.getOrderDetailList(id);
		request.setAttribute("orderList", orderList);
		return super.execute();
	}

}
