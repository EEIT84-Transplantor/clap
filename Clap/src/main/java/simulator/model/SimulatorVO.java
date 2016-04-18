package simulator.model;

import java.util.List;

import product.model.CategoryVO;
import product.model.ProductVO;
import product.model.ProductimgVO;

public class SimulatorVO {
	private CategoryVO categoryVO;
	private List<ProductVO> productVOs;
	private List<ProductimgVO> productimgVOs;
	public CategoryVO getCategoryVO() {
		return categoryVO;
	}
	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}
	public List<ProductVO> getProductVOs() {
		return productVOs;
	}
	public void setProductVOs(List<ProductVO> productVOs) {
		this.productVOs = productVOs;
	}
	public List<ProductimgVO> getProductimgVOs() {
		return productimgVOs;
	}
	public void setProductimgVOs(List<ProductimgVO> productimgVOs) {
		this.productimgVOs = productimgVOs;
	}
	
}
