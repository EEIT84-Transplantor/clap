package product.model;

import java.util.List;

public interface ProductDAO {

	List<ProductVO> selectAll();

	List<ProductVO> selectByProductId(String productId);

	ProductVO insert(ProductVO productVO);

	boolean update(ProductVO productVO);

	boolean delete(String id);

}