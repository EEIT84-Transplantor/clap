package product.model;

import java.util.List;

public interface CategoryDAO {

	List<CategoryVO> selectAll();

	CategoryVO insert(CategoryVO categoryVO);

	boolean update(CategoryVO categoryVO);

	boolean delete(String id);

}