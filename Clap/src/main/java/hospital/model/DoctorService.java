package hospital.model;

import java.util.List;

public class DoctorService {
private DoctorDAO doctorDAO;
	
    public DoctorService() {
	}

	public DoctorDAO getDoctorDAO() {
		return doctorDAO;
	}

	public void setDoctorDAO(DoctorDAO doctorDAO) {
		this.doctorDAO = doctorDAO;
	}
	
	public List<DoctorVO> getDoctors(){
    	List<DoctorVO> result = null;
    	result = doctorDAO.selectAll();
    	return result;
    }
    
    public DoctorVO getDoctor(Integer id){
    	DoctorVO result = null;
    	result = doctorDAO.selectById(id);
    	return result;
    }
    
    public DoctorVO insertDoctor(DoctorVO doctorVO){
    	DoctorVO result = null;
    	try {
    		doctorDAO.insert(doctorVO);
			result = doctorVO;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return result;
    }
}
