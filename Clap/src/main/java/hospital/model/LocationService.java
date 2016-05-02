package hospital.model;

import java.util.List;

public class LocationService {
private LocationDAO locationDAO;
	
	
    public LocationService() {
	}

	




	public LocationDAO getLocationDAO() {
		return locationDAO;
	}






	public void setLocationDAO(LocationDAO locationDAO) {
		this.locationDAO = locationDAO;
	}






	public List<LocationVO> getLocation(){
    	List<LocationVO> result = null;
    	result = locationDAO.selectAll();
    	return result;
    }
   
   
}
