package shopping.controller;

import java.io.InputStream;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import hospital.model.HospitalVO;
import inventory.model.InOutLogService;
import inventory.model.InventoryService;
import shopping.model.OrderDetailService;
import shopping.model.OrderDetailVO;
import shopping.model.OrderFormService;
import shopping.model.OrderFormVO;

public class DoAppointmentAction extends ActionSupport implements ServletRequestAware, ParameterAware {

	private HttpServletRequest request;
	private InOutLogService inOutLogService;
	private OrderFormService orderFormService;
	private OrderDetailService orderDetailService;
	private InventoryService inventoryService;

	private ArrayList<JSONObject> orderList;
	private String hospital;
	private String orderform_id;

	@Override
	public String execute() throws Exception {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		System.out.println(hospital);
		System.out.println(orderform_id);
		System.out.println(orderList.toString());
		System.out.println("DoAppointmentAction 1");
		// 修改 orderform
		OrderFormVO orderFormVO = orderFormService.getOrderById(Integer.parseInt(orderform_id));
		HospitalVO hospitalVO = new HospitalVO();
		hospitalVO.setId(Integer.parseInt(hospital));
		orderFormVO.setHospitalVO(hospitalVO);
		orderFormService.updateOrderForm(orderFormVO);

		System.out.println("DoAppointmentAction 2");
		// 修改 orderdetail inventory
		OrderDetailVO orderDetailVO;
		Integer orderDetailId;
		Date time;
		for (JSONObject order : orderList) {
			System.out.println(1);
			time = simpleDateFormat.parse((String) orderList.get(0).get("time"));
			System.out.println(2);
			orderDetailId = Integer.parseInt((String) order.get("id"));
			System.out.println(3);
			orderDetailVO = orderDetailService.getOrderDetailById(orderDetailId);
			System.out.println(4);
			orderDetailVO.setDoctor_id( Integer.parseInt((String) order.get("doctor")));
			System.out.println(5);
			orderDetailVO.setOrderdetail_surgerytime(new Timestamp(time.getTime()));
			System.out.println(6);
			inventoryService.saleQuantity(orderDetailVO.getProductVO(), orderDetailVO.getCart_quantity(), hospital);
			System.out.println(7);
		}

		return super.execute();
	}

	public String getOrderform_id() {
		return orderform_id;
	}

	public void setOrderform_id(String orderform_id) {
		this.orderform_id = orderform_id;
	}

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

	public InOutLogService getInOutLogService() {
		return inOutLogService;
	}

	public void setInOutLogService(InOutLogService inOutLogService) {
		this.inOutLogService = inOutLogService;
	}

	public OrderFormService getOrderFormService() {
		return orderFormService;
	}

	public void setOrderFormService(OrderFormService orderFormService) {
		this.orderFormService = orderFormService;
	}

	public OrderDetailService getOrderDetailService() {
		return orderDetailService;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}

	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;

	}

	@Override
	public void setParameters(Map<String, String[]> arg0) {
		String[] orderListStr = arg0.get("orderList[]");
		orderList = new ArrayList<>();
		for (String orderStr : orderListStr) {
			JSONObject order = new JSONObject(orderStr);
			orderList.add(order);
		}
	}

}
