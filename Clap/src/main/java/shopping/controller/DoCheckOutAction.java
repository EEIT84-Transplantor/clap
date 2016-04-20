package shopping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import hospital.model.DoctorService;
import hospital.model.DoctorVO;
import hospital.model.HospitalService;
import hospital.model.HospitalVO;
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
import shopping.model.OrderDetailVO;
import shopping.model.OrderFormService;

public class DoCheckOutAction extends ActionSupport implements ServletRequestAware {

	private OrderFormService orderFormService;
	private OrderDetailService orderDetailService;
	private CartService cartService;
	private MemberService memberService;
	private HttpSession session;
	private HttpServletRequest request;
	private InOutLogService inOutLogService;
	private InventoryService inventoryService;
	private HospitalService hospitalService;
	private DoctorService doctorService;

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

		// 新增訂單明細
		List<CartVO> cardList = cartService.getCart(email);
		Map<String, String> errors = new HashMap<String, String>();
		for (CartVO cardVO : cardList) {
			orderDetailService.setOrderDetail(orderform_id, cardVO);
			if (!inventoryService.saleQuantity(cardVO.getProductVO(), cardVO.getQuantity(), null)) {
				request.setAttribute(cardVO.getProductVO().getName() + "error",
						"sorry, we don't have enough " + cardVO.getProductVO().getName());
				return "input";
			}
		}

		// 清空購物車
		cartService.removeCart(email);

		// 給值
		List<HospitalVO> hospitalList = hospitalService.getHospital();
		List<DoctorVO> doctorList = doctorService.getDoctors();
		List<OrderDetailVO> orderList = orderDetailService.getOrderDetailList(orderform_id);
		
		request.setAttribute("hospitalList", hospitalList);
		request.setAttribute("doctorList", doctorList);
		request.setAttribute("orderList", orderList);
		request.setAttribute("orderFormId", orderform_id);

		return super.execute();
	}

	public DoctorService getDoctorService() {
		return doctorService;
	}

	public void setDoctorService(DoctorService doctorService) {
		this.doctorService = doctorService;
	}

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

	public HospitalService getHospitalService() {
		return hospitalService;
	}

	public void setHospitalService(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}

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
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		session = request.getSession();
	}

}
