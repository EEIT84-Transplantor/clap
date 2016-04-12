package product.model;

import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "productimg")
public class ProductimgVO {

	@Id
	@Column(name="pd_Id")
	private Integer id;
	@Column(name="productimg_img")
	private Byte[] img;
	private String img64;
	
	public String getImg64() {
		return img64;
	}
	public void setImg64(String img64) {
		this.img64 = img64;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Byte[] getImg() {
		return img;
	}
	public void setImg(Byte[] img) {
		this.img = img;
		byte[] to64byte = new byte[this.img.length];
		for(int index=0;index<this.img.length;index++){
			to64byte[index] = this.img[index];
		}
		
		this.img64= Base64.getEncoder().encodeToString(to64byte);
	}
	
	
}
