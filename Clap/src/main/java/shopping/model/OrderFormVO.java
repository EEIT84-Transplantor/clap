package shopping.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="orderform")
public class OrderFormVO {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="orderform_id")
	private Integer id;
    @Column(name="mb_email")
	private String mb_email;
    @Column(name="orderform_time")
	private Timestamp time;
    @Column(name="orderform_total")
	private Integer total;
    @Column(name="orderform_status")
	private Byte status;
    @Column(name="hospital_id")
	private Byte hospital_id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Byte getStatus() {
		return status;
	}
	public void setStatus(Byte status) {
		this.status = status;
	}
	public Byte getHospital_id() {
		return hospital_id;
	}
	public void setHospital_id(Byte hospital_id) {
		this.hospital_id = hospital_id;
	}
}
