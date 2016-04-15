package component;

import java.awt.Dialog;

import com.opensymphony.xwork2.ActionSupport;

import antlr.DocBookCodeGenerator;

public class Test extends ActionSupport {

	 private Dog dog1;
	 private Dog dog2;
	
	 public Dog getDog1() {
	 return dog1;
	 }
	
	 public void setDog1(Dog dog1) {
	 this.dog1 = dog1;
	 }
	
	 public Dog getDog2() {
	 return dog2;
	 }
	
	 public void setDog2(Dog dog2) {
	 this.dog2 = dog2;
	 }

//	private String dog1;
//	private String dog2;
//
//	public String getDog1() {
//		return dog1;
//	}
//
//	public void setDog1(String dog1) {
//		this.dog1 = dog1;
//	}
//
//	public String getDog2() {
//		return dog2;
//	}
//
//	public void setDog2(String dog2) {
//		this.dog2 = dog2;
//	}

	@Override
	public String execute() throws Exception {
		System.out.println(123);
		System.out.println(dog1);
		System.out.println(dog1.getName());
		return super.execute();
	}

}
