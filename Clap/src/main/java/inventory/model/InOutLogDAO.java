package inventory.model;

import java.util.List;

public interface InOutLogDAO {

	List<InOutLogVO> selectAll();

	List<InOutLogVO> selectByProductId(String productId);

	InOutLogVO insert(InOutLogVO inOutLogVO);

	boolean update(InOutLogVO inOutLogVO);
	
	boolean delete(String id);
}