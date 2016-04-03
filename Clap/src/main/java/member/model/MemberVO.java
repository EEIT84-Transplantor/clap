package member.model;

import java.sql.Date;

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
	private String mb_name;
	private String mb_phone;
	private byte[] mb_photo;
	private Boolean mb_oneclick;
	private Integer hp_id;
	private String cc_number;
	private Boolean mb_autorenew;
	private Date mb_expire;


	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}
	public byte[] getMb_photo() {
		return mb_photo;
	}
	public void setMb_photo(byte[] mb_photo) {
		this.mb_photo = mb_photo;
	}
	public Boolean getMb_oneclick() {
		return mb_oneclick;
	}
	public void setMb_oneclick(Boolean mb_oneclick) {
		this.mb_oneclick = mb_oneclick;
	}
	public Integer getHp_id() {
		return hp_id;
	}
	public void setHp_id(Integer hp_id) {
		this.hp_id = hp_id;
	}
	public String getCc_number() {
		return cc_number;
	}
	public void setCc_number(String cc_number) {
		this.cc_number = cc_number;
	}
	public Boolean getMb_autorenew() {
		return mb_autorenew;
	}
	public void setMb_autorenew(Boolean mb_autorenew) {
		this.mb_autorenew = mb_autorenew;
	}
	public Date getMb_expire() {
		return mb_expire;
	}
	public void setMb_expire(Date mb_expire) {
		this.mb_expire = mb_expire;
	}
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
