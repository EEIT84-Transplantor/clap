package shopping.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import com.opensymphony.xwork2.ActionSupport;

import shopping.model.OrderDetailService;
import shopping.model.OrderFormService;

public class DeleteOrderAction extends ActionSupport {

	private OrderFormService orderFormService;
	private Integer orderId;
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public OrderFormService getOrderFormService() {
		return orderFormService;
	}

	public void setOrderFormService(OrderFormService orderFormService) {
		this.orderFormService = orderFormService;
	}

	@Override
	public String execute() throws Exception {
		// 刪除orderFormVO
		Boolean result = orderFormService.removeOrder(orderId);
		inputStream = new ByteArrayInputStream(result.toString().getBytes("UTF-8"));
		return super.execute();
	}

}
