package shopping.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

import product.model.ProductVO;

@Entity
@IdClass(OrderDetailPK.class)
@Table(name = "orderdetail")
public class OrderDetailVO implements Serializable {

	@Id
	@Column(name = "od_id")
	private Integer id;
	@Id
	@Column(name = "pd_id")
	private Integer pd_id;
	@Column(name = "ct_quantity")
	private Integer ct_quantity;
	// optional 外鍵是否允許為空
	@ManyToOne(optional = true)
	@JoinColumn(name = "pd_id", insertable = false, updatable = false)
	private ProductVO productVO;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPd_id() {
		return pd_id;
	}

	public void setPd_id(Integer pd_id) {
		this.pd_id = pd_id;
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

	@Override
	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}
		if (!(obj instanceof OrderDetailVO)) {
			return false;
		}
		OrderDetailVO orderDetiailVO = (OrderDetailVO) obj;
		return new EqualsBuilder().append(id, orderDetiailVO.getId()).append(pd_id, orderDetiailVO.getPd_id())
				.isEquals();
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(id).append(pd_id).toHashCode();
	}

	// public ProductVO getProductVO() {
	// return productVO;
	// }
	//
	// public void setProductVO(ProductVO productVO) {
	// this.productVO = productVO;
	// }

}
