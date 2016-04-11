package inventory.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "inoutlog")
public class InOutLogVO {

	@Id
	@Column(name="inoutlog_id")
	private Integer id;
	@Column(name="inventory_id")
	private Integer inventory_id;
	@Column(name="pd_id")
	private Integer product_id;
	
	@Column(name="inoutlog_inQuantity")
	private Integer inQuantity;
	@Column(name="inoutlog_outQuantity")
	private Integer outQuantity;
	
	@Column(name="inoutlog_manufactureDate")
	private Timestamp manufactureDate;
	@Column(name="inoutlog_expiryDate")
	private Timestamp expiryDate;
	@Column(name="inoutlog_destination")
	private String destination;
	@Column(name="inoutlog_date")
	private Timestamp date;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(Integer inventory_id) {
		this.inventory_id = inventory_id;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public Integer getInQuantity() {
		return inQuantity;
	}
	public void setInQuantity(Integer inQuantity) {
		this.inQuantity = inQuantity;
	}
	public Integer getOutQuantity() {
		return outQuantity;
	}
	public void setOutQuantity(Integer outQuantity) {
		this.outQuantity = outQuantity;
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
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "InOutLogVO [id=" + id + ", inventory_id=" + inventory_id + ", product_id=" + product_id
				+ ", inQuantity=" + inQuantity + ", outQuantity=" + outQuantity + ", manufactureDate=" + manufactureDate
				+ ", expiryDate=" + expiryDate + ", destination=" + destination + ", date=" + date + "]";
	}

}
