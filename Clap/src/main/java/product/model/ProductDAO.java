package product.model;

import java.util.List;

public interface ProductDAO {

	List<ProductVO> selectAll();

	ProductVO selectByProductId(Integer productId);

	ProductVO insert(ProductVO productVO);

	boolean update(ProductVO productVO);

	boolean delete(Integer id);
	
	List<ProductVO> selectByKey(String productName);

	List<ProductVO> selectByCategory(Integer category_id);

	List<ProductVO> selectByPriceRange(Integer category_id, Double min, Double max);


}