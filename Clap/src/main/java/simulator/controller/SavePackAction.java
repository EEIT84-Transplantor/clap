package simulator.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.opensymphony.xwork2.ActionSupport;

public class SavePackAction extends ActionSupport{
	private InputStream inputStream;
	private List<Integer> productIds;
	private Double weight;
	private Double height;
	private Integer smoking;
	private Integer drinking;
	private Integer exercising;
	private Integer env_id;
	
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public List<Integer> getProductIds() {
		return productIds;
	}
	public void setProductIds(List<Integer> productIds) {
		this.productIds = productIds;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public Integer getSmoking() {
		return smoking;
	}
	public void setSmoking(Integer smoking) {
		this.smoking = smoking;
	}
	public Integer getDrinking() {
		return drinking;
	}
	public void setDrinking(Integer drinking) {
		this.drinking = drinking;
	}
	public Integer getExercising() {
		return exercising;
	}
	public void setExercising(Integer exercising) {
		this.exercising = exercising;
	}
	public Integer getEnv_id() {
		return env_id;
	}
	public void setEnv_id(Integer env_id) {
		this.env_id = env_id;
	}
	public String execute(){
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		JSONObject jsonObject = new JSONObject();
		Map<String, Number> map = new HashMap<>();
		map.put("height", height);
		map.put("weight", weight);
		map.put("smoking", smoking);
		map.put("drinking", drinking);
		map.put("exercising", exercising);
		map.put("env_id", env_id);
		String JSONstr="";
		Boolean success=false;
		if (session.getAttribute("savePack1")==null){
			session.setAttribute("conditions1", map);
			session.setAttribute("savePack1", productIds);
			success=true;
		}else if(session.getAttribute("savePack2")==null){
			session.setAttribute("savePack2", productIds);
			session.setAttribute("conditions2", map);
			success=true;
			jsonObject.put("savedIn", "two");
		}else if(session.getAttribute("savePack3")==null){
			session.setAttribute("savePack3", productIds);
			session.setAttribute("conditions3", map);
			success=true;
			jsonObject.put("savedIn", "three");
		}
		jsonObject.put("isSaved", success);
		if(success){
			jsonObject.put("message", "Saved");
		}else{
			jsonObject.put("message", "all the saves are full, please delete one and try again");
		}
		JSONstr = jsonObject.toString();
		System.out.println(JSONstr);
		try {
			inputStream = new ByteArrayInputStream(JSONstr.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
