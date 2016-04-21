package simulator.controller;

import java.util.List;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.json.annotations.JSON;
import org.hibernate.property.access.spi.Setter;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.opensymphony.xwork2.ActionSupport;

import shopping.model.OrderDetailVO;

public class OneclickPackAction extends ActionSupport {

	private List<OrderDetailVO> productList;
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}

	public List<OrderDetailVO> getProductList() {
		return productList;
	}

	public void setProductList(List<OrderDetailVO> productList) {
		this.productList = productList;
	}

}
