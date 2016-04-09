package cart.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

@Entity
@Table(name="cart")
public class CartVO implements Serializable{
	 private String email;
     private Integer id;
     private Integer quantity;
     
     public CartVO() {
 	}
     
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
     
	public boolean equals(Object obj) {
        if(obj == this) {
            return true;
        }
 
        if(!(obj instanceof CartVO)) {
            return false;
        }
 
        CartVO cart = (CartVO) obj;
        return new EqualsBuilder()
                    .append(this.email, cart.getEmail())
                    .append(this.id, cart.getId())
                    .isEquals();
    }
 
    public int hashCode() {
        return new HashCodeBuilder()
                    .append(this.email)
                    .append(this.id)
                    .toHashCode();
    }
}
