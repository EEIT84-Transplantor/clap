package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Id;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import member.model.MemberService;
import member.model.MemberVO;

@WebServlet(urlPatterns = { "/member/emailconfirm.servlet" })
public class EmailConfirmServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberVO memberVO;
		MemberService memberService = (MemberService) WebApplicationContextUtils
				.getWebApplicationContext(request.getServletContext()).getBean("memberService");

		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);

		// ivc
		String email;
		String confirmCode;
		try {
			email = request.getParameter("email");
			confirmCode = request.getParameter("confirmCode");
			if (email == null || email.trim().length() == 0) {
				error.put("email", "email is null");
			}
			if (confirmCode == null || confirmCode.trim().length() == 0) {
				error.put("confirmCode", "confirmCode is null");
			}

			// mvc
			if (!error.isEmpty()) {
				response.sendRedirect("../index.jsp");
				return;
			}

			if (memberService.checkConfirmCode(email, confirmCode)) {
				request.setAttribute("email", email);
				request.getRequestDispatcher("passwordsetting.jsp").forward(request, response);
			} else {
				error.put("confirmcode", "confirm is wrong");
				response.sendRedirect("../index.jsp");
			}
			return;

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

}
