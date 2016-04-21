package simulator.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpRequest;

import com.opensymphony.xwork2.ActionSupport;

public class GetSavedPack extends ActionSupport {
	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		List<Integer> productIds;

		JSONArray jsonArray = new JSONArray();
	
		jsonArray.put(new JSONObject().put("pack1", (List<Integer>) session.getAttribute("pack1")));
		jsonArray.put(new JSONObject().put("pack2", (List<Integer>) session.getAttribute("pack2")));
		jsonArray.put(new JSONObject().put("pack3", (List<Integer>) session.getAttribute("pack3")));
		try {
			inputStream = new ByteArrayInputStream(jsonArray.toString().getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
}
