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

@WebServlet(urlPatterns={"/member/emailconfirm.action"})
public class EmailConfirmServlet extends HttpServlet{
	
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO memberVO;
		MemberService memberService = new MemberService();
		Map<String,String> error = new HashMap<>();
		request.setAttribute("error", error);
		
		//ivc
		String email = request.getParameter("email");
		String comfirmCode = request.getParameter("comfirmCode");
		
		System.out.println(123);
		//mvc
		
	
	
	}
	
	
	
}
