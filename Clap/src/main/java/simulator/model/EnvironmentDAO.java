package simulator.model;

import java.util.List;

public interface EnvironmentDAO {

	public List<EnvironmentVO> selectAll();

	public EnvironmentVO selectByCondition(String condition);

	public EnvironmentVO selectById(Integer id);

}
