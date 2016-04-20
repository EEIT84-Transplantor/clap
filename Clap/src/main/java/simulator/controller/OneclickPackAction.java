package simulator.controller;

import javax.persistence.SqlResultSetMapping;

import com.opensymphony.xwork2.ActionSupport;

public class OneclickPackAction extends ActionSupport {

	private int[] array;

	public int[] getArray() {
		return array;
	}

	public void setArray(int[] array) {
		this.array = array;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("execute");
		System.out.println(array.toString());
		return super.execute();
	}
}
