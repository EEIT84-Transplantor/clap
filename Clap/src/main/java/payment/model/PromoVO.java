package payment.model;

public class PromoVO {
	private String pm_code;
	private String pd_category;
	private java.util.Date pm_expire;
	private String pm_tiltle;
	private Double pm_discount;
	
	public String getPm_code() {
		return pm_code;
	}
	public void setPm_code(String pm_code) {
		this.pm_code = pm_code;
	}
	public String getPd_category() {
		return pd_category;
	}
	public void setPd_category(String pd_category) {
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
}
