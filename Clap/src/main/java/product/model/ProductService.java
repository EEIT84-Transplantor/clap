package product.model;

import java.util.List;

public class ProductService {
	private ProductDAO productDAO;
	private ProductimgDAO productimgDAO;
	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}
	public void setProductimgDAO(ProductimgDAO productimgDAO) {
		this.productimgDAO = productimgDAO;
	}
	
	public List<ProductVO>  test(){
		return productDAO.selectAll();
		
		
	}
	
}
