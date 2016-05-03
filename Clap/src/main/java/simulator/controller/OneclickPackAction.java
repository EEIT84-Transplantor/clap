package simulator.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import inventory.model.InventoryService;
import member.model.MemberVO;
import product.model.ProductService;
import shopping.model.CartVO;
import shopping.model.OrderDetailService;
import shopping.model.OrderDetailVO;
import shopping.model.OrderFormService;
import shopping.model.OrderFormVO;


public class OneclickPackAction extends ActionSupport implements ServletRequestAware {


	private OrderDetailService orderDetailService;
	private OrderFormService orderFormService;
	private InventoryService inventoryService;
	private ProductService productService;
	private HttpServletRequest request;

	private List<CartVO> productList;
	private List<Integer> outOfStock = new ArrayList<Integer>();
	private String result;

	@Override
	public String execute() throws Exception {

		
		
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("login");
		String mb_email = memberVO.getEmail();
		Double total = 0.0;

		
		// 判斷所有商品都有庫存 計算訂單總額
		for (CartVO cartVO : productList) {
			Integer product_id = cartVO.getProduct_id();
			if (inventoryService.inStock(product_id, 1)) {
				total += productService.getProductById(product_id).getPrice();
			} else {
				outOfStock.add(product_id);
			}
		}
		
		if (!outOfStock.isEmpty()) {
			setResult("false");
			return super.input();
		}

		// 建立訂單
		Integer orderform_id = orderFormService.setOrderForm(total, mb_email);
		request.getSession().setAttribute("orderform_id", orderform_id);

		
		// 把訂單編號放入orderDetailVO
		for (CartVO cartVO : productList) {
			cartVO.setQuantity(1);
			orderDetailService.setOrderDetail(orderform_id, cartVO);
		}

		
		// 回傳結果
		setResult("true");
		return super.execute();
	}

	public OrderDetailService getOrderDetailService() {
		return orderDetailService;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}

	public OrderFormService getOrderFormService() {
		return orderFormService;
	}

	public void setOrderFormService(OrderFormService orderFormService) {
		this.orderFormService = orderFormService;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<CartVO> getProductList() {
		return productList;
	}

	public void setProductList(List<CartVO> productList) {
		this.productList = productList;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

}
