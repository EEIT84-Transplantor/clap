package member.model.email;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import member.model.MemberService;

@WebServlet("/EmailSendingTestServlet")
public class EmailSendingTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmailSendingTestServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberService memberService = (MemberService)WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean("memberService");
		String sendingResult = memberService.sendComfirmEmail("jlin218@uw.edu");
		response.getWriter().print(sendingResult);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
