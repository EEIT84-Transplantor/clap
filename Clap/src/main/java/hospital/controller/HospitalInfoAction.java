package hospital.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import hospital.model.HospitalService;
import hospital.model.HospitalVO;

public class HospitalInfoAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private HospitalService hospitalService;
	private List<String> hospitals;
	private String abc;
	private String[] str;

	@Override
	public String execute() throws Exception {

		// for (HospitalVO hospitalVO : hospitalService.getHospital()) {
		// System.out.println(hospitalVO.getAddress());
		//
		// }
		// List<String> area = new ArrayList<String>();
		// Map<String, List<HospitalVO>> hospitals = new HashMap<>();
		// request.setAttribute("hospitals", hospitals);

		hospitals = new ArrayList<>();
		hospitals.add("123");
		hospitals.add("456");
		hospitals.add("789");

		setStr(new String[] { "123", "456", "789" });

		return SUCCESS;
	}

	public String[] getStr() {
		return str;
	}

	public void setStr(String[] str) {
		this.str = str;
	}

	public String getAbc() {
		System.out.println("getAbc");
		return abc;
	}

	public void setAbc(String abc) {
		this.abc = abc;
	}

	public List<String> getHospitals() {
		System.out.println("getHospitals");
		System.out.println(hospitals);
		return hospitals;
	}

	public void setHospitals(List<String> hospitals) {
		this.hospitals = hospitals;
	}

	 public HospitalService getHospitalService() {
	 return hospitalService;
	 }
	
	public void setHospitalService(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

}
