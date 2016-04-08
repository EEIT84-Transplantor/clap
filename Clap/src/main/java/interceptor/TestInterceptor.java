package interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.PreResultListener;
import com.sun.mail.handlers.message_rfc822;

import member.model.MemberService;

public class TestInterceptor extends AbstractInterceptor {

	private String result;
	private MemberService memberService;

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		
		System.out.println(memberService.findByEmail("poan@gmail.com"));
		
		arg0.addPreResultListener(new PreResultListener() {
			@Override
			public void beforeResult(ActionInvocation arg0, String arg1) {
				System.out.println("Interceptor@beforeResult");
			}
		});

		System.out.println("Interceptor@befor action");

		result = arg0.invoke();

		System.out.println("Interceptor@after action");

		return result;
	}

}
