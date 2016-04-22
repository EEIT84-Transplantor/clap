package hospital.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import hospital.model.HospitalService;
import hospital.model.HospitalVO;

public class HospitalInfoAction extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	private HospitalService hospitalService;
	private String location;
	private List<HospitalVO> hospitals;

	@Override
	public String execute() throws Exception {
		if (location != null) {
			location = null;
			// List<String> locations = locationService.getAll();
			// hospitals = hospitalService.selectHospitalByLocation("default");
			//
			// request.setAttribute("locations", locations);
			// request.setAttribute("hospitals", hospitals);
			hospitals = hospitalService.getHospital();
			// System.out.println("aaaaaaaaaaa"+hospitals.size());

			return "showData";

		} else {
			// hospitals = hospitalService.selectHospitalByLocation(location);

			return SUCCESS;
		}
	}

	public HospitalService getHospitalService() {
		return hospitalService;
	}

	public void setHospitalService(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<HospitalVO> getHospitals() {
		return hospitals;
	}

	public void setHospitals(List<HospitalVO> hospitals) {
		this.hospitals = hospitals;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
