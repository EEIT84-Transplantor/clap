package inventory.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "inventory")
public class InventoryVO {

	@Id
	@Column(name="inventory_id")
	private String id;
	@Column(name="pd_id")
	private Integer product_id;
	@Column(name="inventory_quantity")
	private Integer  quantity;
	@Column(name="inventory_manufactureDate")
	private Timestamp manufactureDate;
	@Column(name="inventory_expiryDate")
	private Timestamp expiryDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Timestamp getManufactureDate() {
		return manufactureDate;
	}
	public void setManufactureDate(Timestamp manufactureDate) {
		this.manufactureDate = manufactureDate;
	}
	public Timestamp getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Timestamp expiryDate) {
		this.expiryDate = expiryDate;
	}

}
