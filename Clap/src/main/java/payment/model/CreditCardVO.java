package payment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

import member.model.MemberVO;

@Entity
@Table(name = "creditcard")
public class CreditCardVO implements Serializable {

	@EmbeddedId
	private CreditCardPK creditCardPK;
	@Column(name = "cc_goodthru")
	private String cc_goodthru;
	@Column(name = "cc_cvv")
	private String cc_cvv;
	@ManyToOne(optional = true)
	@JoinColumn(name = "mb_email", insertable = false, updatable = false)
	private MemberVO memberVO;

	public CreditCardPK getCreditCardPK() {
		return creditCardPK;
	}

	public void setCreditCardPK(CreditCardPK creditCardPK) {
		this.creditCardPK = creditCardPK;
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

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}

		if (!(obj instanceof CreditCardVO)) {
			return false;
		}

		CreditCardVO cardVO = (CreditCardVO) obj;
		return new EqualsBuilder().append(creditCardPK.getMb_email(), cardVO.getCreditCardPK().getMb_email()).append(creditCardPK.getCc_number(), cardVO.getCreditCardPK().getCc_number()).isEquals();

	}

	public int hashCode() {

		return new HashCodeBuilder().append(creditCardPK.getMb_email()).append(creditCardPK.getCc_number()).toHashCode();

	}

}
