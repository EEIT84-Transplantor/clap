package setting.controller;

import java.lang.reflect.Array;
import java.util.regex.Pattern;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberService;
import member.model.MemberVO;

public class ChangeSettingAction extends ActionSupport{
	
	private MemberVO memberVO;
	private byte[] newpassword;
	private byte[] confirm;
	private MemberService memberService;
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public void validate() {
		if (memberVO.getPassword()!=null) {
			if (memberService.login(memberVO.getEmail(),memberVO.getPassword())==null) {
				super.addFieldError("memberVO.mb_password", super.getText("mb_password.notmatch"));
			}else if(newpassword!=confirm) {
				super.addFieldError("confirm", super.getText("confirm.notmatch"));
			}
		}
		if (!Pattern.matches("/^09[0-9]{8}$/", memberVO.getMb_phone())) {
			super.addFieldError("memberVO.mb_phone", super.getText("mb_phone.type"));
		}
		if (memberVO.getMb_photo()!=null&&Array.getLength(memberVO.getMb_photo())>1024*1024){
			super.addFieldError("memberVO.mb_photo", super.getText("mb_photo.oversize"));
		}
	}
	@Override
	public String execute() throws Exception {
		System.out.println("123");
		if (memberVO.getPassword()!=null) {
			memberService.updateSetting(newpassword, memberVO.getMb_name(), memberVO.getMb_phone(), memberVO.getMb_photo());
		} else {
			memberService.updateSetting(memberService.findByEmail(memberVO.getEmail()).getPassword(), memberVO.getMb_name(), memberVO.getMb_phone(), memberVO.getMb_photo());
		}
		return SUCCESS;
	}
}



















