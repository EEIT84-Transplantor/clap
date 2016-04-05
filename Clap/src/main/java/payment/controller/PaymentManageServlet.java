package payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.model.CreditCardVO;
@WebServlet("/payment/manage.controller")
public class PaymentManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello");
		String buttonClicked =(String) request.getParameter("payment.id");
		System.out.println(buttonClicked);
		CreditCardVO creditCardVO = (CreditCardVO)request.getAttribute("creditCardVO");
		response.getWriter().append("Served at: ").append(request.getContextPath()).append(creditCardVO.getCc_cvv());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
