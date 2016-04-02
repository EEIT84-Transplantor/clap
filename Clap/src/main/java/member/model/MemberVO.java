package member.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "member")
public class MemberVO {
	
	@Id
	@Column(name="mb_email")
	private String email;
	@Column(name="mb_password")
	private byte[] password;
	private Double gc_amount;

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public byte[] getPassword() {
		return password;
	}
	public void setPassword(byte[] password) {
		this.password = password;
	}
	public Double getGc_amount() {
		return gc_amount;
	}
	public void setGc_amount(Double gc_amount) {
		this.gc_amount = gc_amount;
	}
	
}
