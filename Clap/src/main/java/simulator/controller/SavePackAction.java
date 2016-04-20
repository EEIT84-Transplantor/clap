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

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public List<Integer> getProductIds() {
		return productIds;
	}
	public void setProductIds(List<Integer> productIds) {
		this.productIds = productIds;
	}

	public String execute(){
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		JSONObject jsonObject = new JSONObject();

		String JSONstr="";
		Boolean success=false;
		if (session.getAttribute("savePack1")==null){
			session.setAttribute("savePack1", productIds);
			success=true;
		}else if(session.getAttribute("savePack2")==null){
			session.setAttribute("savePack2", productIds);
			success=true;
			jsonObject.put("savedIn", "two");
		}else if(session.getAttribute("savePack3")==null){
			session.setAttribute("savePack3", productIds);
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
