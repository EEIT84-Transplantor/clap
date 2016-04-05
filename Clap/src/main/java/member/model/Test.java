package member.model;

import java.io.Console;
import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.junit.runner.Request;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService memberService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO rs = memberService.login("andrew@gmail.com", "andrew".getBytes());
		HttpSession session =request.getSession();
		
		session.setAttribute("user", rs.getEmail());
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
		memberService = (MemberService) context.getBean("memberService");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
