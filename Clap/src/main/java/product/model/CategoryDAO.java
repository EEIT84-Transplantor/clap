package product.model;

import java.util.List;

public interface CategoryDAO {

	List<CategoryVO> selectAll();

	CategoryVO insert(CategoryVO categoryVO);

	boolean update(CategoryVO categoryVO);

	boolean delete(Integer id);

	CategoryVO selectById(Integer categoryId);

	List<CategoryVO> selectByCategoryName(String category_name);

}