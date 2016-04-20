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
	private Integer endurance;
	@Column(name="category_specialty_plus")
	private String specialty_plus;
	@Column(name="category_value2")
	private Integer skill;
	
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getSpecialty_plus() {
		return specialty_plus;
	}
	public void setSpecialty_plus(String specialty_plus) {
		this.specialty_plus = specialty_plus;
	}

	public Integer getEndurance() {
		return endurance;
	}
	public void setEndurance(Integer endurance) {
		this.endurance = endurance;
	}
	public Integer getSkill() {
		return skill;
	}
	public void setSkill(Integer skill) {
		this.skill = skill;
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
		return "CategoryVO [id=" + id + ", name=" + name + ", specialty=" + specialty + ", endurance=" + endurance
				+ ", specialty_plus=" + specialty_plus + ", skill=" + skill + "]";
	}

}
