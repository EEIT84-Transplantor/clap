package shopping.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import product.model.ProductVO;

@Entity
@Table(name ="cart")
@IdClass(CartPK.class)
public class CartVO implements Serializable {
	
	@Id
	@Column(name="mb_email")
	private String email;
	@Id
	@Column(name="pd_id")
	private Integer product_id;
	@Column(name="ct_quantity")
	private Integer quantity;
<<<<<<< HEAD
=======
	
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git
	public CartVO() {
	}

	public CartVO(String email, Integer product_id, Integer quantity) {
		this.email = email;
		this.product_id = product_id;
		this.quantity = quantity;
	}

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

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
}
