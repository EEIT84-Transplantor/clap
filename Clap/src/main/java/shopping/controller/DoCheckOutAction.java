package shopping.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import inventory.model.InOutLogService;
import inventory.model.InventoryDAO;
import inventory.model.InventoryService;
import member.model.MemberService;
import member.model.MemberVO;
import payment.model.CreditCardService;
import product.model.ProductService;
import shopping.model.CartService;
import shopping.model.CartVO;
import shopping.model.OrderDetailService;
import shopping.model.OrderFormService;

public class DoCheckOutAction extends ActionSupport implements ServletRequestAware {

	private OrderFormService orderFormService;
	private OrderDetailService orderDetailService;
	private CartService cartService;
	private MemberService memberService;
	private HttpSession session;
	private HttpServletRequest request;
	private ProductService productService;
	private InOutLogService  inOutLogService;
	private InventoryService inventoryService;


	public InOutLogService getInOutLogService() {
		return inOutLogService;
	}

	public void setInOutLogService(InOutLogService inOutLogService) {
		this.inOutLogService = inOutLogService;
	}

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public OrderFormService getOrderFormService() {
		return orderFormService;
	}

	public void setOrderFormService(OrderFormService orderFormService) {
		this.orderFormService = orderFormService;
	}

	public OrderDetailService getOrderDetailService() {
		return orderDetailService;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	@Override
	public String execute() throws Exception {

		// 計算購物金
		Integer total = (Integer) session.getAttribute("total");
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		String email = memberVO.getEmail();
		Double amount = memberService.getAmount(email);
		if (total > amount) {
			memberService.setAmount(email, 0.0);
		} else {
			memberService.setAmount(email, amount - total);
		}

		 // 成功後新增一筆訂單
		 Integer orderform_id = orderFormService.setOrderForm(total, email);
		
		 // 新增訂單明細 清空購物車
		 List<CartVO> cardList = cartService.getCart(email);
		for (CartVO cardVO : cardList) {
		 orderDetailService.setOrderDetail(orderform_id,cardVO);
		 if(!inventoryService.saleQuantity(cardVO.getProductVO(),cardVO.getQuantity())){ 
			request.setAttribute("error", "sorry, we don't have enough stock!");
			return "input";
		    }
		}
		
		 cartService.removeCart(email);

		 
		 
		 
		 
		 
		 
		 
		 
		return super.execute();
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		
		this.request= request;
		session = request.getSession();

	}

}
