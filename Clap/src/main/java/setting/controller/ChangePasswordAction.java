package setting.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.regex.Pattern;

import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberService;
import member.model.MemberVO;

public class ChangePasswordAction extends ActionSupport {

	private byte password;
	private String name;
	private String phone;
	private MemberService memberService;
	private File photo;
	private String contentType;
	private String filename;

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
	

	@Override
	public void validate() {
		// 手機格式是否正確
		if (phone.trim().length()!=0&&!Pattern.matches("^09[0-9]{8}$", phone)) {
				super.addFieldError("phone",getText("phone.type"));
		}

		// 照片尺寸小於1mb
		if (photo != null && photo.length() > 1024 * 1024) {
				super.addFieldError("photo",getText("photo.oversize"));
		}

	}

	@Override
	public String execute() throws Exception {
		MemberVO memberVO = memberService.findByEmail(email);
		memberVO.setName(name);
		memberVO.setPhone(phone);
		memberService.updateSetting(memberVO, photo, contentType);
		return SUCCESS;
	}
}
