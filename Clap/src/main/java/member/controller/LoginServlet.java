package member.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/member/login.action"})
public class LoginServlet extends HttpServlet{
	public void doGet(HttpServletRequest request , HttpServletResponse response) {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request , HttpServletResponse response) {
		
		//input
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//validator cast
		if(email.trim().length()==0){
			
		}
		
		//mvc
		
	}
	
}
