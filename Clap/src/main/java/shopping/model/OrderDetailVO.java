package shopping.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

import hospital.model.DoctorVO;
import product.model.ProductVO;

@Entity
@IdClass(OrderDetailPK.class)
@Table(name = "orderdetail")
public class OrderDetailVO implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "orderdetail_id")
	private Integer id;
	@Id
	@Column(name = "pd_id")
	private Integer pd_id;
	@Column(name = "cart_quantity")
	private Integer cart_quantity;
	@Column(name = "doctor_id")
	private Integer doctor_id;
	@Column(name = "orderform_id")
	private Integer orderform_id;
	@Column(name="surgery_time")
	private Date surgery_time;
	
	public Date getSurgery_time() {
		return surgery_time;
	}

	public void setSurgery_time(Date surgery_time) {
		this.surgery_time = surgery_time;
	}

	// optional 外鍵是否允許為空
	@ManyToOne(optional = true)
	@JoinColumn(name = "pd_id", insertable = false, updatable = false)
	private ProductVO productVO;
	
	@ManyToOne(optional = true)
	@JoinColumn(name = "doctor_id", insertable = false, updatable = false)
	private DoctorVO doctorVO;
	
	@ManyToOne(optional = true)
	@JoinColumn(name = "orderform_id", insertable = false, updatable = false)
	private OrderFormVO orderformVO;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPd_id() {
		return pd_id;
	}

	public void setPd_id(Integer pd_id) {
		this.pd_id = pd_id;
	}

	public Integer getCart_quantity() {
		return cart_quantity;
	}

	public void setCart_quantity(Integer cart_quantity) {
		this.cart_quantity = cart_quantity;
	}

	public Integer getDoctor_id() {
		return doctor_id;
	}

	public void setDoctor_id(Integer doctor_id) {
		this.doctor_id = doctor_id;
	}

	public Integer getOrderform_id() {
		return orderform_id;
	}

	public void setOrderform_id(Integer orderform_id) {
		this.orderform_id = orderform_id;
	}

	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	public DoctorVO getDoctorVO() {
		return doctorVO;
	}

	public void setDoctorVO(DoctorVO doctorVO) {
		this.doctorVO = doctorVO;
	}

	public OrderFormVO getOrderformVO() {
		return orderformVO;
	}

	public void setOrderformVO(OrderFormVO orderformVO) {
		this.orderformVO = orderformVO;
	}
	
}
