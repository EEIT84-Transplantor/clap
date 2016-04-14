package hospital.model;

import java.util.List;

public interface DoctorDAO {
	public abstract List<DoctorVO> selectAll();

	public abstract DoctorVO selectById(Integer id);

	public abstract DoctorVO insert(DoctorVO doctorVO);
}
