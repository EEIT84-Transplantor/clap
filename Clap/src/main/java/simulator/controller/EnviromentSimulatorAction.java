package simulator.controller;

import java.io.InputStream;

import com.opensymphony.xwork2.ActionSupport;

public class EnviromentSimulatorAction extends ActionSupport {
	private InputStream inputStream;
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

}
