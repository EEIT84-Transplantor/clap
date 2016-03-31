package member.model.email;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import member.model.MemberService;


@WebServlet(name = "EmailConfirm", urlPatterns = { "/8d9fd0ea9d/emailConfirm.servlet" })
public class EmailConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EmailConfirmServlet() {
        super();
   }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService memberService = (MemberService)WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean("memberService");
		String email;
		String confirmCode;
		PrintWriter out = response.getWriter();
		try {
			email = request.getParameter("acct");
			confirmCode = request.getParameter("cfr");
			if(memberService.checkConfirmCode(email, confirmCode))
			{
				out.print("Successful");
				return;
			}
				out.print("Failed");
				return;
		} catch (Exception e) {
			
			e.printStackTrace();
			out.print("Wrong confirmation string");
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
