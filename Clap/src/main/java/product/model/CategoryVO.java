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
	@Column(name="smoking")
	private Double smoking;
	@Column(name="bmi")
	private Double bmi;
	@Column(name="drinking")
	private Double drinking;
	@Column(name="exercising")
	private Double exercising;
	@Column(name="industrial")
	private Double industrial;
	@Column(name="forest")
	private Double forest;
	@Column(name="city")
	private Double city;
	
	
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
	public Double getSmoking() {
		return smoking;
	}
	public void setSmoking(Double smoking) {
		this.smoking = smoking;
	}
	public Double getBmi() {
		return bmi;
	}
	public void setBmi(Double bmi) {
		this.bmi = bmi;
	}
	public Double getDrinking() {
		return drinking;
	}
	public void setDrinking(Double drinking) {
		this.drinking = drinking;
	}
	public Double getExercising() {
		return exercising;
	}
	public void setExercising(Double exercising) {
		this.exercising = exercising;
	}
	public Double getIndustrial() {
		return industrial;
	}
	public void setIndustrial(Double industrial) {
		this.industrial = industrial;
	}
	public Double getForest() {
		return forest;
	}
	public void setForest(Double forest) {
		this.forest = forest;
	}
	public Double getCity() {
		return city;
	}
	public void setCity(Double city) {
		this.city = city;
	}

}
