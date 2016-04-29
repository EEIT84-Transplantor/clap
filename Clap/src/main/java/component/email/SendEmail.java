package component.email;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;

public class SendEmail {

	private String host;
	private String port;
	private String user;
	private String pass;
	private EmailUtility emailUtility;
	private EmailconfirmCode emailConfirm;

	public void setEmailConfirm(EmailconfirmCode emailConfirm) {
		this.emailConfirm = emailConfirm;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public void setEmailUtility(EmailUtility emailUtility) {
		this.emailUtility = emailUtility;
	}

	public SendEmail() {
		super();
	}

	public boolean checkingConfirmCode(String email, String codeFromLink){
		if(codeFromLink!=null && codeFromLink.trim().length()==47){
			String randomString = codeFromLink.substring(0, 15);
			String codeFromServer = emailConfirm.generateCheckingCode(email, randomString);
			if(codeFromServer.equals(codeFromLink)){
				return true;
			}
		}
		
		return false;
	}
	public Map<String, String> sendEmail(String email) {
		String confirmCode = emailConfirm.generateEmailCfmCode(email);
		String resultMessage = null;
		Map<String, String> sendingInfo = new HashMap<String, String>();
		sendingInfo.put("confirmCode", confirmCode);
		if (confirmCode != null) {
			String recipient = email;
			String subject = "Confirming email from C.L.A.P Transplantor";
			String content = "Please click the link below \n\n" + "https://clapeeit84.cloudapp.net/member/emailconfirm.servlet?email=" + email + "&confirmCode=" + confirmCode
					+ "\n\n C.L.A.P Transplantor";

			System.out.println(host + "\n" + port + "\n" + user + "\n" + pass + "\n" + recipient + "\n" + subject + "\n"
					+ content);
			try {
				emailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
				resultMessage = "The e-mail was sent successfully";
				sendingInfo.put("resultMessage", resultMessage);
				sendingInfo.put("resultStatus", "true");
			} catch (Exception ex) {
				ex.printStackTrace();
				resultMessage = "There were an error: " + ex.getMessage();
				sendingInfo.put("resultMessage", resultMessage);
				sendingInfo.put("resultStatus", "false");
			} finally {

			}

		}

		return sendingInfo;
	}

}
