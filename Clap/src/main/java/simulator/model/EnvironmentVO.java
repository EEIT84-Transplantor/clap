package simulator.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "environment")
public class EnvironmentVO implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="env_id")
	private Integer id;
	@Column(name="env_condition")
	private String condition;
	@Column(name="heart")
	private Double heart;
	@Column(name="lung")
	private Double lung;
	@Column(name="liver")
	private Double liver;
	@Column(name="kidney")
	private Double kidney;
	@Column(name="stomach")
	private Double stomach;
	@Column(name="intestine")
	private Double intestine;
	@Column(name="blood")
	private Double blood;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public Double getHeart() {
		return heart;
	}
	public void setHeart(Double heart) {
		this.heart = heart;
	}
	public Double getLung() {
		return lung;
	}
	public void setLung(Double lung) {
		this.lung = lung;
	}
	public Double getLiver() {
		return liver;
	}
	public void setLiver(Double liver) {
		this.liver = liver;
	}
	public Double getKidney() {
		return kidney;
	}
	public void setKidney(Double kidney) {
		this.kidney = kidney;
	}
	public Double getStomach() {
		return stomach;
	}
	public void setStomach(Double stomach) {
		this.stomach = stomach;
	}
	public Double getIntestine() {
		return intestine;
	}
	public void setIntestine(Double intestine) {
		this.intestine = intestine;
	}
	public Double getBlood() {
		return blood;
	}
	public void setBlood(Double blood) {
		this.blood = blood;
	}
	@Override
	public String toString() {
		return "EnvironmentVO [id=" + id + ", condition=" + condition + ", heart=" + heart + ", lung=" + lung
				+ ", liver=" + liver + ", kidney=" + kidney + ", stomach=" + stomach + ", intestine=" + intestine
				+ ", blood=" + blood + "]";
	}
	
}
