package shopping.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import inventory.model.InOutLogDAO;
import inventory.model.InOutLogService;
import inventory.model.InOutLogVO;
import product.model.ProductService;

public class ReturnService {
	private OrderFormService orderFormService;
	private ProductService productService;
	private OrderDetailService orderDetailService;
	private InOutLogService inOutLogService;
	private InOutLogDAO inOutLogDAO;

	public void setInOutLogDAO(InOutLogDAO inOutLogDAO) {
		this.inOutLogDAO = inOutLogDAO;
	}

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
						Byte[] imgB = productService.getProductImgById(odtVO.getProduct_id()).getImg();
						if(imgB == null){}else{
							byte[] imgb = new byte[imgB.length];
							returnVO.setProduct_img(imgB);
							for(int index=0;index<imgB.length;index++){
								imgb[index] = imgB[index];
							}
							returnVO.setProduct_img64(Base64.getEncoder().encodeToString(imgb));
						}						
						returnVO.setProduct_id(odtVO.getProduct_id());
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
	public boolean returnProduct(ReturnVO returnVO) {
		List<OrderDetailVO> orderDetailVOs = orderDetailService.getOrderDetailList(returnVO.getOrderform_id());
		InOutLogVO inOutLogVO = null;
		List<InOutLogVO> inOutLogVOs = new ArrayList<InOutLogVO>();
		for(OrderDetailVO odVO : orderDetailVOs){
			inOutLogVOs.addAll(inOutLogDAO.selectByOrderDetailId(odVO.getId()));
		}
		for(InOutLogVO inOut : inOutLogVOs){
			if(inOut.getOutQuantity()>0){
			inOutLogVO = new InOutLogVO();
			inOutLogVO.setInventory_id(inOut.getInventory_id());
			inOutLogVO.setProduct_id(inOut.getProduct_id());
			inOutLogVO.setInQuantity(inOut.getOutQuantity());
			inOutLogVO.setOrderdetail_id(inOut.getOrderdetail_id());
			inOutLogVO.setOutQuantity(0);
			inOutLogVO.setManufactureDate(inOut.getManufactureDate());
			inOutLogVO.setExpiryDate(inOut.getExpiryDate());
			inOutLogVO.setDestination(inOut.getDestination());
			inOutLogVO.setDate(new Timestamp(System.currentTimeMillis()));
			inOutLogDAO.insert(inOutLogVO);
			}
		}
		orderFormService.removeOrder(returnVO.getOrderform_id());
		System.out.println("return");
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
