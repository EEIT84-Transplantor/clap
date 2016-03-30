package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import member.model.MemberService;
import member.model.MemberVO;

@WebServlet(urlPatterns={"/member/emailexist.action"})

public class EmailExistServlet extends HttpServlet{

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		
		MemberVO memberVO;
		MemberService memberService = new MemberService();
		Map<String,String> error = new HashMap<>();
		request.setAttribute("error", error);
		
		response.setContentType("application/json");
		PrintWriter printWriter = response.getWriter();
		
		//ivc
		String email = request.getParameter("email");
		if(email.trim().length()==0){
			error.put("email", "email is null");
		}
		
		//mvc
		if(!error.isEmpty()){
			request.getRequestDispatcher("SignUpLogin.view").forward(request, response);
		}
		if ((memberVO=memberService.findByEmail(email))!=null) {
			JSONObject jsonObject = new JSONObject(memberVO);
			printWriter.write(jsonObject.toString());			
		}else {
			memberService.sendComfirmEmail(email);
		}
	}
}















