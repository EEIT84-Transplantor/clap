package payment.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="giftcard")
public class GiftCardVO {
	@Id
	@Column(name="gc_number")
	private String gc_number;
	@Column(name="gc_code")
	private String gc_code;
	@Column(name="gc_amount")
	private Double gc_amount;
	@Column(name="gc_available")
	private Integer gc_available;
	public String getGc_number() {
		return gc_number;
	}
	public void setGc_number(String gc_number) {
		this.gc_number = gc_number;
	}
	public String getGc_code() {
		return gc_code;
	}
	public void setGc_code(String gc_code) {
		this.gc_code = gc_code;
	}
	public Double getGc_amount() {
		return gc_amount;
	}
	public void setGc_amount(Double gc_amount) {
		this.gc_amount = gc_amount;
	}
	public Integer getGc_available() {
		return gc_available;
	}
	public void setGc_available(Integer gc_available) {
		this.gc_available = gc_available;
	}
}
