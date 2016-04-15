package shopping.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

public class OrderDetailPK implements Serializable {

	private Integer id;
	private Integer product_id;

	public OrderDetailPK() {
	}

	public OrderDetailPK(Integer id, Integer product_id) {
		this.id = id;
		this.product_id = product_id;
	}

	public Integer getId() {
		return id;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}
		if (!(obj instanceof OrderDetailPK)) {
			return false;
		}
		OrderDetailPK orderDetiailPK = (OrderDetailPK) obj;
		return new EqualsBuilder().append(id, orderDetiailPK.getId()).append(product_id, orderDetiailPK.getProduct_id())
				.isEquals();
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(id).append(product_id).toHashCode();
	}

}
