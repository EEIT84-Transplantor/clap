package setting.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.regex.Pattern;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberService;
import member.model.MemberVO;

public class ChangeSettingAction extends ActionSupport {

	private String email;
	private String name;
	private String phone;
	private MemberService memberService;
	private File photo;
	private String contentType;
	private String filename;
	private InputStream inputStream;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public void setPhotoContentType(String contentType) {
		this.contentType = contentType;
	}

	public void setPhotoFileName(String filename) {
		this.filename = filename;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	@Override
	public void validate() {

		// 手機格式是否正確
		if (phone.trim().length() != 0 && !Pattern.matches("/^09[0-9]{8}$/", phone)) {
			super.addFieldError("memberVO.phone", super.getText("phone.type"));
		}

		// 照片尺寸小於1mb
		if (photo != null && photo.length() > 1024 * 1024) {
			System.out.println(photo.length());
			super.addFieldError("photo", super.getText("photo.oversize"));
		}

	}

	@Override
	public String execute() throws Exception {
		MemberVO memberVO = memberService.findByEmail(email);
		memberVO.setName(name);
		memberVO.setPhone(phone);
		memberService.updateSetting(memberVO, photo, contentType);

		inputStream = new ByteArrayInputStream("Hello World! This is a text string response from a Struts 2 Action.".getBytes("UTF-8"));

		return SUCCESS;
	}
}
