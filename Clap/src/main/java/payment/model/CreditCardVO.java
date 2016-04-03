package payment.model;

public class CreditCardVO {
	private String mb_email;
	private String cc_number;
	private String cc_goodrhru;
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
	public String getCc_goodrhru() {
		return cc_goodrhru;
	}
	public void setCc_goodrhru(String cc_goodrhru) {
		this.cc_goodrhru = cc_goodrhru;
	}
	public String getCc_cvv() {
		return cc_cvv;
	}
	public void setCc_cvv(String cc_cvv) {
		this.cc_cvv = cc_cvv;
	}
	
	
}
