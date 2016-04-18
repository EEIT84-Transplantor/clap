package simulator.controller;

import java.io.InputStream;

import com.opensymphony.xwork2.ActionSupport;

public class BodySimulatorAction extends ActionSupport{
	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}
}
