package payment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
@Embeddable
public class CreditCard implements Serializable{
	  @Column(name="mb_email")
    private String mb_email;
	  @Column(name="cc_number")
    private  String cc_number;
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
                    .append(this.cc_number, user.getCc_number())
                    .append(this.mb_email, user.getMb_email())
                    .isEquals();
    }
 
    public int hashCode() {
        return new HashCodeBuilder()
                    .append(this.cc_number)
                    .append(this.mb_email)
                    .toHashCode();
    }
}
