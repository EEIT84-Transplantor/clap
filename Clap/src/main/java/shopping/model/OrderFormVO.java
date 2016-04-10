package shopping.model;

import java.sql.Date;

public class OrderFormVO {

	private Integer id;
	private String mb_email;
	private Date time;
	private Integer total;
	private Byte os_id;

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

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Byte getOs_id() {
		return os_id;
	}

	public void setOs_id(Byte os_id) {
		this.os_id = os_id;
	}

}
