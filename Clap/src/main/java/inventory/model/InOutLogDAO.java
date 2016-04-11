package inventory.model;

import java.util.List;

public interface InOutLogDAO {

	List<InOutLogVO> selectAll();

	List<InOutLogVO> selectByProductId(Integer productId);
	
	List<InOutLogVO> selectByTopSold(Integer categoryId, int number);

	InOutLogVO insert(InOutLogVO inOutLogVO);

	boolean update(InOutLogVO inOutLogVO);
	
	boolean delete(Integer id);
}