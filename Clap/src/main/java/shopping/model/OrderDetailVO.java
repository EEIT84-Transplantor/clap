package shopping.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
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
@Table(name = "orderdetail")
public class OrderDetailVO implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderdetail_id")
	private Integer id;
	@Column(name = "product_id")
	private Integer product_id;
	@Column(name = "ct_quantity")
	private Integer ct_quantity;
	@Column(name = "doctor_id")
	private Integer doctor_id;
	@Column(name = "orderform_id")
	private Integer orderform_id;
	@Column(name = "orderdetail_surgerytime")
	private Timestamp orderdetail_surgerytime;
	// optional 外鍵是否允許為空
	@ManyToOne(optional = true)
	@JoinColumn(name = "product_id", insertable = false, updatable = false)
	private ProductVO productVO;
	@ManyToOne(optional = true)
	@JoinColumn(name = "doctor_id", insertable = false, updatable = false)
	private DoctorVO doctorVO;
	@ManyToOne(optional = true)
	@JoinColumn(name = "orderform_id", insertable = false, updatable = false)
	private OrderFormVO orderformVO;

	public Timestamp getOrderdetail_surgerytime() {
		return orderdetail_surgerytime;
	}

	public void setOrderdetail_surgerytime(Timestamp orderdetail_surgerytime) {
		this.orderdetail_surgerytime = orderdetail_surgerytime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public Integer getCart_quantity() {
		return ct_quantity;
	}

	public void setCart_quantity(Integer ct_quantity) {
		this.ct_quantity = ct_quantity;
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
