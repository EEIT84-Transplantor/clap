package shopping.model;

public class ReturnVO {

	private Byte[] product_img;
	private String product_name;
	private java.sql.Date shipping_date;
	private Integer orderDetail_quantity;
	private String orderform_id;
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
	public String getOrderform_id() {
		return orderform_id;
	}
	public void setOrderform_id(String orderform_id) {
		this.orderform_id = orderform_id;
	}

	
	

}
