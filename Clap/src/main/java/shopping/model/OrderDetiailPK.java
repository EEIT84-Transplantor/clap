package shopping.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

public class OrderDetiailPK implements Serializable{
	
	private Integer id;
	private Integer pd_id;

	public OrderDetiailPK() {
	}

	public OrderDetiailPK(Integer id, Integer pd_id) {
		this.id = id;
		this.pd_id = pd_id;
	}

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

	@Override
	public boolean equals(Object obj) {
		if(obj==this){
			return true;
		}
		if(!(obj instanceof OrderDetiailPK)){
			return false;
		}
		OrderDetiailPK orderDetiailPK = (OrderDetiailPK) obj;
		return new EqualsBuilder().append(id,orderDetiailPK.getId()).append(pd_id, orderDetiailPK.getPd_id()).isEquals();
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(id).append(pd_id).toHashCode();
	}

	

}
