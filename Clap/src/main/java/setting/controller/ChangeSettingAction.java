package setting.controller;

import java.io.File;
import java.util.Arrays;
import java.util.regex.Pattern;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.conversion.annotations.TypeConversion;

import member.model.MemberService;
import member.model.MemberVO;

public class ChangeSettingAction extends ActionSupport {

	private MemberVO memberVO;
	private byte[] newpassword;
	private byte[] confirm;
	private MemberService memberService;
	private File photo;
	private String contentType;
	private String filename;

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public byte[] getNewpassword() {
		return newpassword;
	}

	@TypeConversion(converter = "converter.BytearrayConverter")
	public void setNewpassword(byte[] newpassword) {
		this.newpassword = newpassword;
	}

	public byte[] getConfirm() {
		return confirm;
	}

	@TypeConversion(converter = "converter.BytearrayConverter")
	public void setConfirm(byte[] confirm) {
		this.confirm = confirm;
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

		// 舊密碼是否正確、新密碼的驗證碼是否正確
		if (memberVO.getPassword().length != 0) {
			if (memberService.login(memberVO.getEmail(), memberVO.getPassword()) == null) {
				super.addFieldError("memberVO.password", super.getText("password.notmatch"));
			} else if (!Arrays.equals(newpassword, confirm)) {
				System.out.println("equals");
				super.addFieldError("confirm", super.getText("confirm.notmatch"));
			}
		} else if (newpassword.length != 0) {
			super.addFieldError("memberVO.password", super.getText("password.notmatch"));
		}

		// 手機格式是否正確
		if (memberVO.getPhone().trim().length() != 0 && !Pattern.matches("/^09[0-9]{8}$/", memberVO.getPhone())) {
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
		memberService.updateSetting(memberVO, newpassword, photo);
		return SUCCESS;
	}
}
