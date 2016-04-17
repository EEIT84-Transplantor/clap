package shopping.model;

import java.io.Serializable;
import java.util.Arrays;

public class ReturnVO implements Serializable  {

	private Byte[] product_img;
	private Integer product_id;
	private String product_name;
	private java.sql.Date shipping_date;
	private Integer orderDetail_quantity;
	private Integer orderform_id;
	private String product_img64;
	
	public String getProduct_img64() {
		return product_img64;
	}
	public void setProduct_img64(String product_img64) {
		this.product_img64 = product_img64;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public Byte[] getProduct_img() {
		return product_img;
	}
	public void setProduct_img(Byte[] product_img) {
		this.product_img = product_img;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public java.sql.Date getShipping_date() {
		return shipping_date;
	}
	public void setShipping_date(java.sql.Date shipping_date) {
		this.shipping_date = shipping_date;
	}
	public Integer getOrderDetail_quantity() {
		return orderDetail_quantity;
	}
	public void setOrderDetail_quantity(Integer orderDetail_quantity) {
		this.orderDetail_quantity = orderDetail_quantity;
	}
	public Integer getOrderform_id() {
		return orderform_id;
	}
	public void setOrderform_id(Integer orderform_id) {
		this.orderform_id = orderform_id;
	}
	@Override
	public String toString() {
		return "ReturnVO [product_img=" + Arrays.toString(product_img) + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", shipping_date=" + shipping_date + ", orderDetail_quantity="
				+ orderDetail_quantity + ", orderform_id=" + orderform_id + "]";
	}

	
	

}
