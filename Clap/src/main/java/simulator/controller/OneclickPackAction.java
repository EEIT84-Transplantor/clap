package simulator.controller;

import java.util.List;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

public class OneclickPackAction extends ActionSupport {

	private List<Report> data;
	private int[] ints = { 10, 20 };

	public String execute() {
		try {

			System.out.println(data.size());
			for (int i = 0; i < data.size(); i++) {
				System.out.println("Data  " + data.get(i).getColor() + "-" + data.get(i).getDate() + "-"
						+ data.get(i).getId() + "-" + data.get(i).getName());
			}
			System.out.println("Execute Method");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public List<Report> getData() {
		System.out.println("Getter Call");
		return data;
	}

	public void setData(List<Report> data) {
		System.out.println("Setter Call Flow");
		this.data = data;
	}

	public int[] getInts() {
		return ints;
	}

	public void setInts(int[] ints) {
		this.ints = ints;
	}

}
