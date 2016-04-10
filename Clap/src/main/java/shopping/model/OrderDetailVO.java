package shopping.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import product.model.ProductVO;

@Entity
@Table(name="orderdetail")
public class OrderDetailVO implements Serializable{

	@Id
	//主鍵的生成方式有四種(TABLE,SEQUENCE,IDENTITY,AUTO) 
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="od_id")
	private Integer id;
	@Column(name="pd_id")
	private Integer pd_id;
	@Column(name="ct_quantity")
	private Integer ct_quantity;
	//optional 外鍵是否允許為空
//	@ManyToOne(optional=true)
//	@JoinColumn(name="pd_id",insertable=false,updatable=false)
//	private ProductVO productVO;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPd_Id() {
		return pd_id;
	}

	public void setPd_Id(Integer pd_id) {
		this.pd_id = pd_id;
	}

	public Integer getCt_quantity() {
		return ct_quantity;
	}

	public void setCt_quantity(Integer ct_quantity) {
		this.ct_quantity = ct_quantity;
	}

//	public ProductVO getProductVO() {
//		return productVO;
//	}
//
//	public void setProductVO(ProductVO productVO) {
//		this.productVO = productVO;
//	}

}
