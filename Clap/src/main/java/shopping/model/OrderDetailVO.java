package shopping.model;

import payment.model.PromoVO;
import product.model.ProductVO;

public class OrderDetailVO {

	private Integer id;
	private Integer pd_Id;
	private Integer ct_quantity;
	private ProductVO productVO;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPd_Id() {
		return pd_Id;
	}

	public void setPd_Id(Integer pd_Id) {
		this.pd_Id = pd_Id;
	}

	public Integer getCt_quantity() {
		return ct_quantity;
	}

	public void setCt_quantity(Integer ct_quantity) {
		this.ct_quantity = ct_quantity;
	}

	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

}
