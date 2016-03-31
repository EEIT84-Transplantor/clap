package member.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;

import member.model.MemberService;

@WebServlet(urlPatterns={"/member/passwordSettingServlet.action"})
public class PasswordSettingServlet extends HttpServlet {
	private MemberService memberService;
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String password = request.getParameter("password");
		
		
	}
}
