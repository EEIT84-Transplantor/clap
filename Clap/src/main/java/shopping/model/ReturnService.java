package shopping.model;

import java.util.ArrayList;
import java.util.List;

import inventory.model.InOutLogService;
import product.model.ProductService;

public class ReturnService {
	private OrderFormService orderFormService;
	private ProductService productService;
	private OrderDetailService orderDetailService;
	private InOutLogService inOutLogService;

	public OrderFormService getOrderFormService() {
		return orderFormService;
	}

	public void setOrderFormService(OrderFormService orderFormService) {
		this.orderFormService = orderFormService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public OrderDetailService getOrderDetailService() {
		return orderDetailService;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}

	public InOutLogService getInOutLogService() {
		return inOutLogService;
	}

	public void setInOutLogService(InOutLogService inOutLogService) {
		this.inOutLogService = inOutLogService;
	}


	
	public List<ReturnVO> getReturnableOrderProduct(String email){
		List<ReturnVO> returnVOs = null;
		ReturnVO returnVO = null;
		try {
			List<OrderFormVO> orderFormVOs = orderFormService.getOrderList(email);
			List<OrderDetailVO> orderDetailVOs = null;
			
			for(OrderFormVO ofVO : orderFormVOs){
				returnVOs = new ArrayList<ReturnVO>();
				orderDetailVOs = orderDetailService.getOrderDetailList(ofVO.getId());
				for(OrderDetailVO odtVO : orderDetailVOs){
					returnVO = new ReturnVO();
					
					try {
						returnVO.setProduct_id(odtVO.getProduct_id());
						returnVO.setProduct_img(productService.getProductImgById(odtVO.getProduct_id()).getImg());
						returnVO.setProduct_name(odtVO.getProductVO().getName());
						returnVO.setShipping_date(new java.sql.Date(odtVO.getOrderformVO().getTime().getTime()));
						returnVO.setOrderform_id(odtVO.getOrderformVO().getId());
						returnVO.setOrderDetail_quantity(odtVO.getCart_quantity());
						
						returnVOs.add(returnVO);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnVOs;
	}
	public boolean returnProduct(String orderId, Integer product_id){
		
		return false;
	}
	/*
	private Byte[] product_img;
	private Integer product_id;
	private String product_name;
	private java.sql.Date shipping_date;
	private Integer orderDetail_quantity;
	private Integer orderform_id;
	*/
}
