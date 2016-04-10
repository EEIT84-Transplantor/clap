package product.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "productimg")
public class ProductimgVO {

	@Id
	@Column(name="pd_Id")
	private String id;
	@Column(name="productimg_img")
	private Byte[] img;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Byte[] getImg() {
		return img;
	}
	public void setImg(Byte[] img) {
		this.img = img;
	}
	
	
}
