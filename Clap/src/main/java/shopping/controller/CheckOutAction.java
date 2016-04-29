package shopping.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import member.model.MemberVO;
import payment.model.CreditCardService;
import payment.model.CreditCardVO;
import product.model.ProductService;
import shopping.model.OrderFormService;

public class CheckOutAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;
	private HttpSession session;
	private CreditCardService creditCardService;
	private OrderFormService orderFormService;
	private String productArray;
	private String promoTitle;
	private ProductService productService;
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Override
	public String execute() throws Exception {

		JSONObject product;
		Double price;
		Integer quantity;
		Double total = 0.0;
		String result;

		// 判斷是否登入
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		if(memberVO == null){
			result="false";
			return super.execute();
		}else{
			result="true";
		}
		inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
		System.out.println("aaaaaaaaaaaaaaa"+inputStream);

		// 算出total
		String[] productArray = request.getParameterValues("productArray[]");
		for (String productStr : productArray) {
			product = new JSONObject(productStr);
			Integer prodcutId = Integer.parseInt((String) product.get("productId"));
			price = productService.getProductById(prodcutId).getPrice();
			quantity = Integer.parseInt(product.get("quantity").toString());
			total += price * quantity;
		}
		total *= Integer.parseInt(promoTitle);

		// 取出creditCardList
		memberVO = (MemberVO) session.getAttribute("login");
		List<CreditCardVO> creditCardList = creditCardService.getCards(memberVO.getEmail());

		session.setAttribute("creditCardList", creditCardList);
		session.setAttribute("total", total);
		
		return super.execute();

	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public CreditCardService getCreditCardService() {
		return creditCardService;
	}

	public void setCreditCardService(CreditCardService creditCardService) {
		this.creditCardService = creditCardService;
	}

	public OrderFormService getOrderFormService() {
		return orderFormService;
	}

	public void setOrderFormService(OrderFormService orderFormService) {
		this.orderFormService = orderFormService;
	}

	public String getPromoTitle() {
		return promoTitle;
	}

	public void setPromoTitle(String promoTitle) {
		this.promoTitle = promoTitle;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
		session = request.getSession();
	}

	public String getProductArray() {
		return productArray;
	}

	public void setProductArray(String productArray) {
		this.productArray = productArray;
	}

}
