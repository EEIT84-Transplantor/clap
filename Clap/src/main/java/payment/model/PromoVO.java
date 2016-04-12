package payment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="promo")
public class PromoVO implements Serializable {
	@Id
	@Column(name="pm_code")
	private String pm_code;
	@Column(name="pd_category")
	private Integer pd_category;
	@Column(name="pm_expire")
	private java.util.Date pm_expire;
	@Column(name="pm_tiltle")
	private String pm_tiltle;
	@Column(name="pm_discount")
	private Double pm_discount;
	
	public String getPm_code() {
		return pm_code;
	}
	public void setPm_code(String pm_code) {
		this.pm_code = pm_code;
	}
	public Integer getPd_category() {
		return pd_category;
	}
	public void setPd_category(Integer pd_category) {
		this.pd_category = pd_category;
	}
	public java.util.Date getPm_expire() {
		return pm_expire;
	}
	public void setPm_expire(java.util.Date pm_expire) {
		this.pm_expire = pm_expire;
	}
	public String getPm_tiltle() {
		return pm_tiltle;
	}
	public void setPm_tiltle(String pm_tiltle) {
		this.pm_tiltle = pm_tiltle;
	}
	public Double getPm_discount() {
		return pm_discount;
	}
	public void setPm_discount(Double pm_discount) {
		this.pm_discount = pm_discount;
	}
	@Override
	public String toString() {
		return "PromoVO [pm_code=" + pm_code + ", pd_category=" + pd_category + ", pm_expire=" + pm_expire
				+ ", pm_tiltle=" + pm_tiltle + ", pm_discount=" + pm_discount + "]";
	}
	
}
