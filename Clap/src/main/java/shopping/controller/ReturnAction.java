package shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import member.model.MemberVO;
import shopping.model.ReturnService;
import shopping.model.ReturnVO;

public class ReturnAction {
	private ReturnVO returnVO;
	private ReturnService returnService;

	public void setReturnService(ReturnService returnService) {
		this.returnService = returnService;
	}

	public void setReturnVO(ReturnVO returnVO) {
		this.returnVO = returnVO;
	}

	public ReturnVO getReturnVO() {
		return returnVO;
	}

	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String email = ((MemberVO)request.getSession().getAttribute("login")).getEmail();
		
		System.out.println(returnVO.getProduct_id());
		System.out.println(returnVO.getProduct_name());
		System.out.println(returnVO.getOrderDetail_quantity());
		System.out.println(returnVO.getShipping_date());
		System.out.println(returnVO.getOrderform_id());
		System.out.println(returnVO);
		returnService.returnProduct(returnVO);
		List<ReturnVO> returnVOs = returnService.getReturnableOrderProduct(email);
		if(returnVOs!=null){
		request.getSession().setAttribute("returnVOs", returnVOs);
		request.getSession().setAttribute("returnCount", returnVOs.size());
		}
		return "success";
	}


}
