package shopping.model;

import java.io.Serializable;

import javax.persistence.Id;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

public class CartPK implements Serializable {
	private String email;
	private Integer product_id;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public CartPK(String email, Integer product_id) {
		super();
		this.email = email;
		this.product_id = product_id;
	}
	
	public CartPK() {
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}

		if (!(obj instanceof CartPK)) {
			return false;
		}

		CartPK cartPK = (CartPK) obj;
		return new EqualsBuilder().append(this.email, cartPK.getEmail()).append(this.product_id, cartPK.getProduct_id()).isEquals();
	}
	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(this.email).append(this.product_id).toHashCode();
	}
	
	
	
}

