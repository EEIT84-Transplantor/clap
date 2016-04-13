package product.model;

import java.util.ArrayList;
import java.util.List;

import inventory.model.InOutLogDAO;

public class ProductService {
	private ProductDAO productDAO;
	private ProductimgDAO productimgDAO;
	private InOutLogDAO inOutLogDAO;

	public void setInOutLogDAO(InOutLogDAO inOutLogDAO) {
		this.inOutLogDAO = inOutLogDAO;
	}
	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}
	public void setProductimgDAO(ProductimgDAO productimgDAO) {
		this.productimgDAO = productimgDAO;
	}
	
	public List<ProductVO>  test(){
		return productDAO.selectAll();
	}
	public List<ProductVO> searchProductByKeyName(String productKeyName){
		//取得某類別含有keyname的商品
		return productDAO.selectByKey(productKeyName);
	}
	public List<ProductVO> searchProductByCategory(Integer categoryId){
		return productDAO.selectByCategory(categoryId);
	}
	public ProductVO getProductById(Integer productId){
		System.out.println(productDAO);
		System.out.println(productId);
		return productDAO.selectByProductId(productId);
	}
	
	public List<ProductVO> searchProduct(Integer categoryId, Double min, Double max, String key){
		if (min ==null || min<0){
			min = 0.0;
		}
		if(max ==null || max<0){
			max = 10000000000000000000.0;
		}
		
		
		
		
	}
	
	public boolean setOrUpdateProduct(ProductVO productVO, Byte[] productImg){
		ProductimgVO productimgVO= new ProductimgVO();
		productimgVO.setId(productVO.getId());
		productimgVO.setImg(productImg);
		ProductVO result1= productDAO.insert(productVO);
		ProductimgVO result2 = productimgDAO.insert(productimgVO);
		if (result1!= null &&result2!=null){
			return true;
		}
		return false;
	}
	public ProductimgVO getProductImgById(Integer productId){
		ProductimgVO result = productimgDAO.selectByProductId(productId);
		if(result!=null){
			return result;
		}else{
			return null;
		}
		
	}
	public List<ProductimgVO> getProductImgByList(List<ProductVO>productVOs){
		List<ProductimgVO> imgList = new ArrayList<ProductimgVO>();
		for(int i =0 ; i<productVOs.size();i++){
			ProductimgVO result = productimgDAO.selectByProductId(productVOs.get(i).getId());
			imgList.add(result);
		}
		return imgList;	
	}
	public boolean removeProduct(Integer productId){
		productimgDAO.delete(productId);
		return productDAO.delete(productId);
	}
	public List<ProductVO> getProductsByPrice(Integer categoryId,Double min,Double max){
		return productDAO.selectByPriceRange(categoryId, min, max);
	}
	public List<ProductVO> getPoupulars(Integer categoryId, int number){
		//取得最暢銷的n個商品
		return inOutLogDAO.selectByTopSold(categoryId, number);
	}
	public List<ProductVO> getProductByTopAmount(Integer pageNumber, Integer pageAmount, Integer counts){
		return productDAO.selectByTopAmount(pageNumber, pageAmount, counts);
	}
	

}
