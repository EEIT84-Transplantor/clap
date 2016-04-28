package hospital.model;

import java.util.List;

public interface HospitalDAO {
    public abstract List<HospitalVO> selectAll();
	
	public abstract HospitalVO selectById(Integer id);

	public abstract HospitalVO insert(HospitalVO hospitalVO);
	
	public abstract List<HospitalVO> selectByLocation(Integer id);
	
}
