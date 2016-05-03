package shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import hospital.model.DoctorService;
import hospital.model.DoctorVO;
import hospital.model.HospitalService;
import hospital.model.HospitalVO;
import hospital.model.LocationService;
import shopping.model.OrderDetailService;
import shopping.model.OrderDetailVO;

public class AppointmentAction extends ActionSupport implements ServletRequestAware {

	@Override
	public String execute() throws Exception {

		// 給值
		
		Integer orderform_id = (Integer) request.getSession().getAttribute("orderform_id");
//		request.getSession().removeAttribute("orderform_id");

		List<HospitalVO> hospitalList = hospitalService.getHospital();
		List<DoctorVO> doctorList = doctorService.getDoctors();
		List<OrderDetailVO> orderList = orderDetailService.getOrderDetailList(orderform_id);

		request.setAttribute("hospitalList", hospitalList);
		request.setAttribute("doctorList", doctorList);
		request.setAttribute("orderList", orderList);
		request.setAttribute("orderform_id", orderform_id);

		
		    	hospitals  = hospitalService.selectHospitalByLocation(1);
		    	request.setAttribute("hospitals", hospitals);
		    	request.setAttribute("locations", locationService.getLocation());
		    	return SUCCESS;
		   
	}

	private HospitalService hospitalService;
	private DoctorService doctorService;
	private OrderDetailService orderDetailService;
	private HttpServletRequest request;
    private LocationService locationService;
    private Integer location;
    private List<HospitalVO> hospitals;

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
	public void setLocationService(LocationService locationService) {
		this.locationService = locationService;
	}

	public List<HospitalVO> getHospitals() {
		return hospitals;

	}

	public void setLocation(Integer location) {
		this.location = location;
	}
	public HospitalService getHospitalService() {
		return hospitalService;
	}

	public void setHospitalService(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}

	public DoctorService getDoctorService() {
		return doctorService;
	}

	public void setDoctorService(DoctorService doctorService) {
		this.doctorService = doctorService;
	}

	public OrderDetailService getOrderDetailService() {
		return orderDetailService;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}

}
