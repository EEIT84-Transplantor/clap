package simulator.controller;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.http.HttpRequest;

import com.opensymphony.xwork2.ActionSupport;

public class GetSavedPack extends ActionSupport {
	public Integer selected;
	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public Integer getSelected() {
		return selected;
	}

	public void setSelected(Integer selected) {
		this.selected = selected;
	}
	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Map<String, Number> map;
		List<Integer> productIds;
		if (selected==1){
			map=(Map<String, Number>) session.getAttribute("conditions1");
			productIds=(List<Integer>) session.getAttribute("savePack1");
		}else if(selected==2){
			map=(Map<String, Number>) session.getAttribute("conditions2");
			productIds=(List<Integer>) session.getAttribute("savePack2");
		}else{
			map=(Map<String, Number>) session.getAttribute("conditions3");
			productIds=(List<Integer>) session.getAttribute("savePack3");
		}
		request.setAttribute("height", map.get("height"));
		request.setAttribute("weight", map.get("weight"));
		request.setAttribute("smoking", map.get("smoking"));
		request.setAttribute("drinking", map.get("drinking"));
		request.setAttribute("exercising", map.get("exercising"));
		request.setAttribute("env_id", map.get("env_id"));
		request.setAttribute("productIds", productIds);
		return SUCCESS;
	}
	
}
