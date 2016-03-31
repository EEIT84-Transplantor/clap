package member.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/member/passwordSettingServlet.action"})
public class PasswordSettingServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		request.getParameter("email");
		request.getParameter("email");

		
		
	}
}
