package product.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "product")
public class ProductVO implements Serializable  {

	@Id
	@Column(name = "product_id")
	private Integer id;
	@Column(name = "product_name")
	private String name;
	@Column(name = "product_price")
	private Double price;
	@Column(name = "product_description")
	private String description;
	@Column(name = "product_rating")
	private Integer rating;
	@Column(name = "product_discount")
	private Double discount;
	@Column(name = "category_id")
	private Integer category_id;
	@ManyToOne(optional = true)
	@JoinColumn(name = "category_id", insertable = false, updatable = false)
	private CategoryVO categoryVO;
	@Column(name = "product_endurance")
	private Double endurance;
	@Column(name = "product_skill")
	private Double skill;
	@Transient
	private Double finalValue1;
	@Transient
	private Double finalValue2;
	
	


	public Double getEndurance() {
		return endurance;
	}
	public void setEndurance(Double endurance) {
		this.endurance = endurance;
	}
	public Double getSkill() {
		return skill;
	}
	public void setSkill(Double skill) {
		this.skill = skill;
	}
	public Double getFinalValue1() {
		return finalValue1;
	}
	public void setFinalValue1(Double finalValue1) {
		this.finalValue1 = finalValue1;
	}
	public Double getFinalValue2() {
		return finalValue2;
	}
	public void setFinalValue2(Double finalValue2) {
		this.finalValue2 = finalValue2;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public CategoryVO getCategoryVO() {
		return categoryVO;
	}
	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	@Override
	public String toString() {
		return "ProductVO [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description
				+ ", rating=" + rating + ", discount=" + discount + ", category_id=" + category_id + "]";
	}
	
}
