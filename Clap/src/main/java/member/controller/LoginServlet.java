package member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberService;
import member.model.MemberVO;

@WebServlet(urlPatterns = { "/member/login.action" })
public class LoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO memberVO;
		MemberService memberService = new MemberService();
		Map<String,String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
				
		//input
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//validator cast
		if(password.trim().length()==0){
			error.put("password", "password is null");
		}
		
		//mvc
		if(!error.isEmpty()){
			request.getRequestDispatcher("SignUpLogin.view").forward(request, response);
		}
		
		if ((memberVO=memberService.login(email, password))!=null) {
			request.getSession().setAttribute("login",memberVO);	
			request.getRequestDispatcher("index.view").forward(request, response);
		}else {
			error.put("password", "password is worng");
			request.getRequestDispatcher("signuplogin.view").forward(request, response);			
		}
		
		
	}

}
