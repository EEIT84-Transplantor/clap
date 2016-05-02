package hospital.model;

import java.util.List;

public class HospitalService {
	private HospitalDAO hospitalDAO;
	
	
    public HospitalService() {
	}

	public HospitalDAO getHospitalDAO() {
		return hospitalDAO;
	}

	public void setHospitalDAO(HospitalDAO hospitalDAO) {
		this.hospitalDAO = hospitalDAO;
	}

	public List<HospitalVO> getHospital(){
    	List<HospitalVO> result = null;
    	result = hospitalDAO.selectAll();
    	return result;
    }
    
    public HospitalVO getHospital(Integer id){
    	HospitalVO result = null;
    	result = hospitalDAO.selectById(id);
    	return result;
    }
    
    public HospitalVO insertHospital(HospitalVO hospitalVO){
    	HospitalVO result = null;
    	try {
			hospitalDAO.insert(hospitalVO);
			result = hospitalVO;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return result;
    }
    
    public List<HospitalVO> selectHospitalByLocation(Integer id) {
    	List<HospitalVO> result = null;
    	
     	result = hospitalDAO.selectByLocation(id);
    	
    	return result;
	}
}
