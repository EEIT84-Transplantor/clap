package setting.controller;

import java.util.Arrays;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.conversion.annotations.TypeConversion;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;

import member.model.MemberService;
import member.model.MemberVO;

public class ChangePasswordAction extends ActionSupport {

	private String email;
	private byte[] password;
	private byte[] newpassword;
	private byte[] confirm;
	private MemberService memberService;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public byte[] getPassword() {
		return password;
	}

	@TypeConversion(converter = "component.converter.BytearrayConverter")
	public void setPassword(byte[] password) {
		this.password = password;
	}

	public byte[] getNewpassword() {
		return newpassword;
	}

	@TypeConversion(converter = "component.converter.BytearrayConverter")
	public void setNewpassword(byte[] newpassword) {
		this.newpassword = newpassword;
	}

	public byte[] getConfirm() {
		return confirm;
	}

	@TypeConversion(converter = "component.converter.BytearrayConverter")
	public void setConfirm(byte[] confirm) {
		this.confirm = confirm;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public void validate() {
		
		if (password.length==0) {
			super.addFieldError("password", "password is null");			
		}
		if (newpassword.length==0) {
			super.addFieldError("newpassword", "newpassword is null");			
		}
		
		// 舊密碼是否正確、新密碼的驗證碼是否正確
		if (password.length != 0) {
			if (memberService.login(email, password) == null) {
				super.addFieldError("password", super.getText("password.notmatch"));
			} else if (!Arrays.equals(newpassword, confirm)) {
				super.addFieldError("confirm", super.getText("confirm.notmatch"));
			}
		} else if (newpassword.length != 0) {
			super.addFieldError("password", super.getText("password.notmatch"));
		}
	}

	@Override
	public String execute() throws Exception {
		MemberVO memberVO = memberService.findByEmail(email);
		memberVO.setPassword(newpassword);
		memberService.changePassword(email, newpassword);
		return SUCCESS;
	}

}
