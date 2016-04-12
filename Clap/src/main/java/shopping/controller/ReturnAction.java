package shopping.controller;

import org.apache.struts2.ServletActionContext;

import shopping.model.ReturnVO;

public class ReturnAction {
	private ReturnVO returnVO;

	public void setReturnVO(ReturnVO returnVO) {
		this.returnVO = returnVO;
	}

	public ReturnVO getReturnVO() {
		return returnVO;
	}

	public String execute(){
		
		System.out.println(returnVO.getProduct_id());
		System.out.println(returnVO.getProduct_name());
		System.out.println(returnVO.getOrderDetail_quantity());
		System.out.println(returnVO.getShipping_date());
		System.out.println(returnVO.getOrderform_id());
		System.out.println(returnVO);
		ServletActionContext.getRequest().setAttribute("returnVO", returnVO);
		return "success";
	}


}
