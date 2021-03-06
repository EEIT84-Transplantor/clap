package product.model;

import java.util.List;

public interface ProductimgDAO {

	List<ProductimgVO> selectAll();

	ProductimgVO selectByProductId(Integer productId);

	ProductimgVO insert(ProductimgVO productimgVO);

	boolean update(ProductimgVO productimgVO);

	boolean delete(Integer id);

}