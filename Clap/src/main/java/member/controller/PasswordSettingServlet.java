package member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.remoting.support.RemoteInvocationResult;

import member.model.MemberService;
import member.model.MemberVO;

@WebServlet(urlPatterns = { "/member/passwordSettingServlet.servlet" })
public class PasswordSettingServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberVO memberVO;
		MemberService memberService = (MemberService) request.getAttribute("memberService");
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);

		// ivc
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String passwordconfirm = request.getParameter("passwordconfirm");

		// mvc
		if (password.trim().length() != 0 && password.equals(passwordconfirm)) {
			memberService.signUp(email, password);
			memberVO = memberService.login(email, password.getBytes());
			request.setAttribute("login", memberVO);
			request.getRequestDispatcher("../index.jsp").forward(request, response);
		} else {
			error.put("password", "password confirm failure");
			request.getRequestDispatcher("passwordsetting.jsp").forward(request, response);
		}
		return;
	}
}
