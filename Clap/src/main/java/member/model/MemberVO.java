package member.model;

import java.sql.Date;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

import com.opensymphony.xwork2.conversion.annotations.TypeConversion;

@Entity
@Table(name = "member")
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
	@Column(name = "mb_contenttype")
	private String contentType;
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

	public MemberVO setEmail(String email) {
		this.email = email;
		return this;
	}

	public byte[] getPassword() {
		return password;
	}

	@TypeConversion(converter = "converter.BytearrayConverter")
	public MemberVO setPassword(byte[] password) {
		this.password = password;
		return this;
	}

	public Double getAmount() {
		return amount;
	}

	public MemberVO setAmount(Double amount) {
		this.amount = amount;
		return this;
	}

	public String getName() {
		return name;
	}

	public MemberVO setName(String name) {
		this.name = name;
		return this;
	}

	public String getPhone() {
		return phone;
	}

	public MemberVO setPhone(String phone) {
		this.phone = phone;
		return this;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public MemberVO setPhoto(byte[] photo) {
		this.photo = photo;
		return this;
	}

	public Boolean getOneclick() {
		return oneclick;
	}

	public MemberVO setOneclick(Boolean oneclick) {
		this.oneclick = oneclick;
		return this;
	}

	public Integer getId() {
		return id;
	}

	public MemberVO setId(Integer id) {
		this.id = id;
		return this;
	}

	public String getNumber() {
		return number;
	}

	public MemberVO setNumber(String number) {
		this.number = number;
		return this;
	}

	public Boolean getAutorenew() {
		return autorenew;
	}

	public MemberVO setAutorenew(Boolean autorenew) {
		this.autorenew = autorenew;
		return this;
	}

	public Date getExpire() {
		return expire;
	}

	public MemberVO setExpire(Date expire) {
		this.expire = expire;
		return this;
	}

	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", password=" + Arrays.toString(password) + ", amount=" + amount + ", name="
				+ name + ", phone=" + phone + ", photo=" + Arrays.toString(photo) + ", oneclick=" + oneclick + ", id="
				+ id + ", number=" + number + ", autorenew=" + autorenew + ", expire=" + expire + "]";
	}

}
