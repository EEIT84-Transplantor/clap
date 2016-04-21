package shopping.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.JoinColumnOrFormula;

import hospital.model.HospitalVO;

@Entity
@Table(name = "orderform")
public class OrderFormVO implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderform_id")
	private Integer id;
	@Column(name = "mb_email")
	private String mb_email;
	@Column(name = "orderform_time")
	private Timestamp time;
	@Column(name = "orderform_total")
	private Double total;
	@Column(name = "orderform_status")
	private Byte status;
	@ManyToOne
	@JoinColumn(name = "hospital_id", insertable = false)
	private HospitalVO hospitalVO;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "orderform_id")
	private Set<OrderDetailVO> orderDetailVOs;

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

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public HospitalVO getHospitalVO() {
		return hospitalVO;
	}

	public void setHospitalVO(HospitalVO hospitalVO) {
		this.hospitalVO = hospitalVO;
	}

	@Override
	public String toString() {
		return "OrderFormVO [id=" + id + ", mb_email=" + mb_email + ", time=" + time + ", total=" + total + ", status="
				+ status + ", hospitalVO=" + hospitalVO + ", orderDetailVOs=" + orderDetailVOs + "]";
	}

}
