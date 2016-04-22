package hospital.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import hospital.model.HospitalService;
import hospital.model.HospitalVO;
import hospital.model.LocationService;


public class HospitalInfoAction extends ActionSupport implements ServletRequestAware{
    private HttpServletRequest request;
    private HospitalService hospitalService;
    private LocationService locationService;
    private Integer location;
    private List<HospitalVO> hospitals;
    

	public void setLocationService(LocationService locationService) {
		this.locationService = locationService;
	}

	public List<HospitalVO> getHospitals() {
		return hospitals;

	}

	public HospitalService getHospitalService() {
		return hospitalService;
	}

	public void setHospitalService(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}



	public void setLocation(Integer location) {
		this.location = location;
	}

	@Override
	public String execute() throws Exception {
	    if(location!=null){
	        hospitals  = hospitalService.selectHospitalByLocation(location);
			request.setAttribute("hospitals", hospitals);
	    	location = null;
	    	return "showData";
			
	    }else{
	    	hospitals  = hospitalService.selectHospitalByLocation(1);
	    	request.setAttribute("hospitals", hospitals);
	    	request.setAttribute("locations", locationService.getLocation());
	    	return SUCCESS;
	    }

	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
