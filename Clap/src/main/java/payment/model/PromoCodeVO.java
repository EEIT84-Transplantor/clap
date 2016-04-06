package payment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
@Entity
@Table(name="promocode")
public class PromoCodeVO implements Serializable{
	@Column(name="mb_email")
	private String mb_email;
	@Column(name="pc_code")
	private String pc_code;
	
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
	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(this.mb_email).append(this.pc_code).toHashCode();
	}
	@Override
	public boolean equals(Object obj) {
		 if(obj == this) {
	            return true;
	        }
	 
	        if(!(obj instanceof PromoCodeVO)) {
	            return false;
	        }
	 
	        PromoCodeVO vo = (PromoCodeVO) obj;
	        return new EqualsBuilder().append(this.mb_email, vo.getMb_email()).append(this.pc_code, vo.getPc_code()).isEquals();
	}
	
	
}
