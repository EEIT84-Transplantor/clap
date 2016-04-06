package payment.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="creditcard")
public class CreditCardVO {
	@Column(name="mb_email")
	private String mb_email;
	@Id
	@Column(name="cc_number")
	private String cc_number;
	@Column(name="cc_goodthru")
	private String cc_goodthru;
	@Column(name="cc_cvv")
	private String cc_cvv;
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getCc_number() {
		return cc_number;
	}
	public void setCc_number(String cc_number) {
		this.cc_number = cc_number;
	}
	
	
	public String getCc_goodthru() {
		return cc_goodthru;
	}
	public void setCc_goodthru(String cc_goodthru) {
		this.cc_goodthru = cc_goodthru;
	}
	public String getCc_cvv() {
		return cc_cvv;
	}
	public void setCc_cvv(String cc_cvv) {
		this.cc_cvv = cc_cvv;
	}
	
	
}
