package product.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class CategoryVO implements Serializable  {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="category_id")
	private Integer id;
	@Column(name="category_name")
	private String name;
	@Column(name="category_specialty")
	private String specialty;
	@Column(name="category_value1")
	private Integer value1;
	@Column(name="category_specialty_plus")
	private String specialty_plus;
	@Column(name="category_value2")
	private Integer value2;
	
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public Integer getValue1() {
		return value1;
	}
	public void setValue1(Integer value1) {
		this.value1 = value1;
	}
	public String getSpecialty_plus() {
		return specialty_plus;
	}
	public void setSpecialty_plus(String specialty_plus) {
		this.specialty_plus = specialty_plus;
	}
	public Integer getValue2() {
		return value2;
	}
	public void setValue2(Integer value2) {
		this.value2 = value2;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "CategoryVO [id=" + id + ", name=" + name + ", specialty=" + specialty + ", value1=" + value1
				+ ", specialty_plus=" + specialty_plus + ", value2=" + value2 + "]";
	}


}
