package setting.controller;

import java.lang.reflect.Array;
import java.util.regex.Pattern;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberService;

public class ChangeSettingAction extends ActionSupport{
	
	private String mb_email;
	private String mb_password;
	private String newpassword;
	private String confirm;
	private String mb_name;
	private String mb_phone;
	private byte[] mb_photo;
	private MemberService memberService;
	
	public String getEmail() {
		return mb_email;
	}
	public void setEmail(String email) {
		this.mb_email = email;
	}
	public String getPassword() {
		return mb_password;
	}
	public void setPassword(String password) {
		this.mb_password = password;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getName() {
		return mb_name;
	}
	public void setName(String name) {
		this.mb_name = name;
	}
	public String getPhone() {
		return mb_phone;
	}
	public void setPhone(String phone) {
		this.mb_phone = phone;
	}
	public byte[] getPhoto() {
		return mb_photo;
	}
	public void setPhoto(byte[] photo) {
		this.mb_photo = photo;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public void validate() {
		if (mb_password!=null) {
			if (memberService.login(mb_email, mb_password)!=null) {
				super.addFieldError("mb_password", super.getText("mb_password.notmatch"));
			}else if(newpassword!=confirm) {
				super.addFieldError("confirm", super.getText("confirm.notmatch"));
			}
		}
		if (!Pattern.matches("/^09[0-9]{8}$/", mb_phone)) {
			super.addFieldError("mb_phone", super.getText("mb_phone.type"));
		}
		if (Array.getLength(mb_photo)>1024*1024){
			super.addFieldError("mb_photo", super.getText("mb_photo.oversize"));
		}
	}
	@Override
	public String execute() throws Exception {
		if (mb_password!=null) {
			memberService.updateSetting(newpassword, mb_name, mb_phone, mb_photo);
		} else {
			memberService.updateSetting(memberService.findByEmail(mb_email).getPassword().toString(), mb_name, mb_phone, mb_photo);
		}
		return SUCCESS;
	}
}



















