package payment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
@Embeddable
public class PromoCode implements Serializable{
    	 @Column(name="mb_email")
	    private String mb_email;
    	 @Column(name="pm_code")
    	 private String pm_code;
		public String getMb_email() {
			return mb_email;
		}
		public void setMb_email(String mb_email) {
			this.mb_email = mb_email;
		}

//		@ManyToOne
//		protected PromoVO promoVO;
//
//		public PromoVO getPromoVO() {
//			return promoVO;
//		}
//		public void setPromoVO(PromoVO promoVO) {
//			this.promoVO = promoVO;
//		}
		
		
		public String getPm_code() {
			return pm_code;
		}
		public void setPm_code(String pm_code) {
			this.pm_code = pm_code;
		}
		// 必須重新定義equals()與hashCode()
	    public boolean equals(Object obj) {
	        if(obj == this) {
	            return true;
	        }
	 
	        if(!(obj instanceof CreditCard)) {
	            return false;
	        }
	 
	        CreditCard user = (CreditCard) obj;
	        return new EqualsBuilder()
	                    .append(this.pm_code, user.getCc_number())
	                    .append(this.mb_email, user.getMb_email())
	                    .isEquals();
	    }
	 
	    public int hashCode() {
	        return new HashCodeBuilder()
	                    .append(this.pm_code)
	                    .append(this.mb_email)
	                    .toHashCode();
	    }
		  
}
