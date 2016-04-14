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

	List<ProductVO> selectByTopAmount(Integer pageNumber, Integer pageAmount, Integer counts);

	List<ProductVO> searchProductByKeyPrice(Integer categoryId, Double min, Double max, String key);

	List<ProductVO> selectByOnlyPriceRange(Double min, Double max);

	List<ProductVO> selectByPriceRange2(Double min, Double max, String key);

}