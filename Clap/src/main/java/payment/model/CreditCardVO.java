package payment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import member.model.MemberVO;

@Entity
@Table(name = "creditcard")
public class CreditCardVO implements Serializable {
	
	@EmbeddedId
	private CreditCard creditCard;
	@Column(name = "cc_goodthru")
	private String cc_goodthru;
	@Column(name = "cc_cvv")
	private String cc_cvv;
	@ManyToOne(optional=true)
	@JoinColumn(name="mb_email",insertable=false,updatable=false)
	private MemberVO memberVO;

	public CreditCard getCreditCard() {
		return creditCard;
	}

	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
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

}
