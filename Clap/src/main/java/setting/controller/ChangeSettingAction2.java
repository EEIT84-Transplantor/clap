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

public class ChangeSettingAction2 extends ActionSupport {

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
		if (!Pattern.matches("^09[0-9]{8}$", phone)) {
			try {
				inputStream = new ByteArrayInputStream("phone error".getBytes("UTF-8"));
				super.addActionError("");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		// 照片尺寸小於1mb
		if (photo != null && photo.length() > 1024 * 1024) {
			try {
				inputStream = new ByteArrayInputStream("photo error".getBytes("UTF-8"));
				super.addActionError("");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public String execute() throws Exception {
		MemberVO memberVO = memberService.findByEmail(email);
		memberVO.setName(name);
		memberVO.setPhone(phone);
		memberService.updateSetting(memberVO, photo, contentType);
		inputStream=new ByteArrayInputStream("update success".getBytes("UTF-8"));
		return SUCCESS;
	}
}
