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

public class HospitalInfoAction extends ActionSupport implements ServletRequestAware{
    private HttpServletRequest request;
    private HospitalService hospitalService;
    
	public HospitalService getHospitalService() {
		return hospitalService;
	}

	public void setHospitalService(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}

	@Override
	public String execute() throws Exception {
		
		for(HospitalVO hospitalVO:hospitalService.getHospital()){
			System.out.println(hospitalVO.getAddress());
			
		}
		
		
		
		
		
		
		List<String> area = new ArrayList<String>();
	    Map<String, List<HospitalVO>> hospitals  = new HashMap<>();
		
		
		request.setAttribute("hospitals", hospitals);
		
		
		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
