package payment.model;

import java.io.Serializable;
<<<<<<< HEAD

=======
<<<<<<< HEAD
=======
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
<<<<<<< HEAD
import javax.persistence.Table;
=======
import javax.persistence.Table;
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git

<<<<<<< HEAD
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import member.model.MemberVO;

public class CreditCardVO implements Serializable {

	// crud
	public static void main(String[] args) {
		Configuration config = new Configuration().configure();
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction transaction=null;
		
		CreditCardVO cardVO = new CreditCardVO();
		cardVO.setEmail("poan@gmail.com");
		cardVO.setNumber("123456789");
		cardVO.setCvv("321");
		cardVO.setGoodthru("12/12");
		
		try {
			transaction = session.beginTransaction();
//			session.save(cardVO);
//			session.update(cardVO);
//			session.delete(cardVO);
			cardVO = session.get(CreditCardVO.class, cardVO);
//			System.out.println("hahah:"+cardVO.toString());
			System.out.println(cardVO.getMemberVO().getEmail());

			
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}
=======
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
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git
	}

<<<<<<< HEAD

	// ==============================================================================================================================================
	private String email;
	private String number;
	private String goodthru;
	private String cvv;
	private MemberVO memberVO;

	public String getEmail() {
		return email;
=======
	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git
	}

<<<<<<< HEAD
	public void setEmail(String email) {
		this.email = email;
=======
	public String getCc_goodthru() {
		return cc_goodthru;
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git
	}

<<<<<<< HEAD
	public String getNumber() {
		return number;
=======
	public void setCc_goodthru(String cc_goodthru) {
		this.cc_goodthru = cc_goodthru;
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git
	}

<<<<<<< HEAD
	public void setNumber(String number) {
		this.number = number;
=======
	public String getCc_cvv() {
		return cc_cvv;
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git
	}

<<<<<<< HEAD
	public String getGoodthru() {
		return goodthru;
=======
	public void setCc_cvv(String cc_cvv) {
		this.cc_cvv = cc_cvv;
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git
	}

<<<<<<< HEAD
	public void setGoodthru(String goodthru) {
		this.goodthru = goodthru;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String toString() {
		return "CreditCardVO [email=" + email + ", number=" + number + ", goodthru=" + goodthru + ", cvv=" + cvv
				+ ", memberVO=" + memberVO + "]";
	}

	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}

		if (!(obj instanceof CreditCardVO)) {
			return false;
		}

		CreditCardVO cardVO = (CreditCardVO) obj;
		return new EqualsBuilder().append(this.email, cardVO.getEmail()).append(this.number, cardVO.getNumber())
				.isEquals();

	}

	public int hashCode() {

		return new HashCodeBuilder().append(this.email).append(this.number).toHashCode();
=======
	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
>>>>>>> branch 'master' of https://github.com/EEIT84-Transplantor/clap.git
	}

}
