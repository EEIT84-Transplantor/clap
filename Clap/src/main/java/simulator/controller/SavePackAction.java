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
import org.json.JSONArray;
import org.json.JSONObject;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.opensymphony.xwork2.ActionSupport;

public class SavePackAction extends ActionSupport {
	private List<Integer> pack1;
	private List<Integer> pack2;
	private List<Integer> pack3;
	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public List<Integer> getPack1() {
		return pack1;
	}

	public void setPack1(List<Integer> pack1) {
		this.pack1 = pack1;
	}

	public List<Integer> getPack2() {
		return pack2;
	}

	public void setPack2(List<Integer> pack2) {
		this.pack2 = pack2;
	}

	public List<Integer> getPack3() {
		return pack3;
	}

	public void setPack3(List<Integer> pack3) {
		this.pack3 = pack3;
	}

	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		System.out.println("Pre process======================================");
		System.out.println("Pack: "+pack1);
		System.out.println("Pack: "+pack2);
		System.out.println("Pack: "+pack3);
		if(isSent(pack3)){
			processPack(pack3);
		}else if(isSent(pack2)){
			processPack(pack2);
			processPack(pack3);
		}else{
			processPack(pack1);
			processPack(pack2);
			processPack(pack3);
		}
		System.out.println("After process======================================");
		System.out.println("Pack: "+pack1);
		System.out.println("Pack: "+pack2);
		System.out.println("Pack: "+pack3);
		
		
		
		session.setAttribute("pack1", pack1);
		session.setAttribute("pack2", pack2);
		session.setAttribute("pack3", pack3);
		JSONArray jsonArray = new JSONArray();
	
		jsonArray.put(new JSONObject().put("pack1", pack1));
		jsonArray.put(new JSONObject().put("pack2", pack2));
		jsonArray.put(new JSONObject().put("pack3", pack3));
		try {
			inputStream = new ByteArrayInputStream(jsonArray.toString().getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	private boolean isSent(List<Integer> pack){
		try {
			return pack.get(0)==999;
		} catch (Exception e) {
			return false;
		}
	}
	private List<Integer> processPack(List<Integer> pack){
		if(pack!=null){
			if(isSent(pack)){
				pack.remove(0);
			}else{
				for(int index=0;index<pack.size();index++){
					pack.set(index, 0);	
				}
			}
		}
		return pack;
	}
}
