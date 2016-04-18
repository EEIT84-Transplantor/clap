package shopping.controller;

import com.opensymphony.xwork2.ActionSupport;

import shopping.model.OrderFormVO;

public class DoAppointmentAction extends ActionSupport {

	private String orderList;
	private String hospital;

	public String getOrderList() {
		return orderList;
	}

	public void setOrderList(String orderList) {
		this.orderList = orderList;
	}




	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	@Override
	public String execute() throws Exception {
		System.out.println(orderList);
		System.out.println(hospital);
		return super.execute();
	}

}
