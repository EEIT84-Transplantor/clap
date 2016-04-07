package payment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
@Embeddable
public class PromoCode implements Serializable{
    	 @Column(name="mb_email")
	    private String mb_email;
		  @Column(name="pc_code")
	    private  String pc_code;
		  
		public String getMb_email() {
			return mb_email;
		}
		public void setMb_email(String mb_email) {
			this.mb_email = mb_email;
		}
		public String getPc_code() {
			return pc_code;
		}
		public void setPc_code(String pc_code) {
			this.pc_code = pc_code;
		}
		  
		  
}
