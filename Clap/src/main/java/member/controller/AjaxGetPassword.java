package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import member.model.MemberService;
import member.model.MemberVO;

/**
 * Servlet implementation class AjaxGetPassword
 */
@WebServlet("/member/getpassword.servlet")
public class AjaxGetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxGetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService ms = (MemberService)WebApplicationContextUtils.getWebApplicationContext(getServletContext()).getBean("memberService");
		MemberVO memberVO = ms.findByEmail(request.getParameter("email"));
		PrintWriter out = response.getWriter();
		if(Arrays.equals(memberVO.getPassword(),request.getParameter("oldPassword").getBytes())){
			out.append("true");
			
		}else{
			out.append("false");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
