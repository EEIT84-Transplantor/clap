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
	private ProductService productService;
	private InOutLogService inOutLogService;
	private InventoryService inventoryService;
	private HospitalService hospitalService;
	private DoctorService doctorService;
	private CartService cartService;
	private MemberService memberService;
	private HttpSession session;
	private HttpServletRequest request;

	private String cc_number;

	@Override
	public String execute() throws Exception {

//		System.out.println("哈" + 1);
//		// 計算購物金
//		Double total = (Double) session.getAttribute("total");
//		MemberVO memberVO = (MemberVO) session.getAttribute("login");
//		String email = memberVO.getEmail();
//		Double amount = memberService.getAmount(email);
//		if (total > amount) {
//			memberService.setAmount(email, 0.0);
//		} else {
//			memberService.setAmount(email, amount - total);
//		}
//
//		System.out.println("哈" + 2);
//		// 成功後新增一筆訂單
//		Integer orderform_id = orderFormService.setOrderForm(total, email);
//
//		System.out.println("哈" + 3);
//		// 新增訂單明細
//		List<CartVO> cardList = cartService.getCart(email);
//		Map<String, String> errors = new HashMap<String, String>();
//		for (CartVO cardVO : cardList) {
//			orderDetailService.setOrderDetail(orderform_id, cardVO);
//			// if (!inventoryService.saleQuantity(cardVO.getProductVO(),
//			// cardVO.getQuantity(), null)) {
//			// request.setAttribute(cardVO.getProductVO().getName() + "error",
//			// "sorry, we don't have enough " +
//			// cardVO.getProductVO().getName());
//			// return "input";
//			// }
//		}
//
//		System.out.println("哈" + 4);
//		// 清空購物車
//		cartService.removeCart(email);
//
//		System.out.println("哈" + 5);
//		// 給值
//		List<HospitalVO> hospitalList = hospitalService.getHospital();
//		List<DoctorVO> doctorList = doctorService.getDoctors();
//		List<OrderDetailVO> orderList = orderDetailService.getOrderDetailList(orderform_id);
//
//		request.setAttribute("hospitalList", hospitalList);
//		request.setAttribute("doctorList", doctorList);
//		request.setAttribute("orderList", orderList);
//		request.setAttribute("orderFormId", orderform_id);
//
//		System.out.println("哈" + 6);
		return super.execute();
	}

	public String getCc_number() {
		return cc_number;
	}

	public void setCc_number(String cc_number) {
		this.cc_number = cc_number;
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

	// @Override
	// public String execute() throws Exception {
	//
	// // 計算購物金
	// Double total = (Double) session.getAttribute("total");
	// MemberVO memberVO = (MemberVO) session.getAttribute("login");
	// String email = memberVO.getEmail();
	// Double amount = memberService.getAmount(email);
	// if (total > amount) {
	// memberService.setAmount(email, 0.0);
	// } else {
	// memberService.setAmount(email, amount - total);
	// }
	//
	// // 成功後新增一筆訂單
	// Integer orderform_id = orderFormService.setOrderForm(total, email);
	//
	// // 新增訂單明細 清空購物車
	// List<CartVO> cartList = cartService.getCart(email);
	// Map<String, String> errors = new HashMap<String, String>();
	// for (CartVO cartVO : cartList) {
	// orderDetailService.setOrderDetail(orderform_id, cartVO);
	// // 判斷是否還有庫存
	// // if (!inventoryService.saleQuantity(cartVO.getProductVO(),
	// // cartVO.getQuantity(), null)) {
	// // System.out.println(4);
	// // request.setAttribute(cartVO.getProductVO().getName() + "error",
	// // "sorry, we don't have enough " +
	// // cartVO.getProductVO().getName());
	// // return "input";
	// }
	// cartService.removeCart(email);
	//
	// return super.execute();
	// }

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		session = request.getSession();
	}

}
