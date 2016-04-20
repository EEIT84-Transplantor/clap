package simulator.model;

import java.util.List;

public interface EnvironmentDAO {

	public List<EnvironmentVO> selectAll();

	public List<EnvironmentVO> selectByCondition(String condition);

	public List<EnvironmentVO> selectById(Integer id);

}
