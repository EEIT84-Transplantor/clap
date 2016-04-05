package member.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

import com.opensymphony.xwork2.conversion.annotations.TypeConversion;

@Entity
@Table(name = "member")
@DynamicUpdate(value = true)
public class MemberVO {

	@Id
	@Column(name = "mb_email")
	private String email;
	@Column(name = "mb_password")
	private byte[] password;
	@Column(name = "gc_amount")
	private Double amount;
	@Column(name = "mb_name")
	private String name;
	@Column(name = "mb_phone")
	private String phone;
	@Column(name = "mb_photo")
	private byte[] photo;
	@Column(name = "mb_oneclick")
	private Boolean oneclick;
	@Column(name = "hp_id")
	private Integer id;
	@Column(name = "cc_number")
	private String number;
	@Column(name = "mb_autorenew")
	private Boolean autorenew;
	@Column(name = "mb_expire")
	private Date expire;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public byte[] getPassword() {
		return password;
	}

	@TypeConversion(converter = "converter.BytearrayConverter")
	public void setPassword(byte[] password) {
		this.password = password;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public Boolean getOneclick() {
		return oneclick;
	}

	public void setOneclick(Boolean oneclick) {
		this.oneclick = oneclick;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public Boolean getAutorenew() {
		return autorenew;
	}

	public void setAutorenew(Boolean autorenew) {
		this.autorenew = autorenew;
	}

	public Date getExpire() {
		return expire;
	}

	public void setExpire(Date expire) {
		this.expire = expire;
	}

}
