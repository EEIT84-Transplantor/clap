package hospital.model;

import java.util.List;

public interface LocationDAO {
	public abstract List<LocationVO> selectAll();
}
