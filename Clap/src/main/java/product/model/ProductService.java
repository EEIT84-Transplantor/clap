package product.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.propertyeditors.StringArrayPropertyEditor;
import org.springframework.context.event.EventListenerMethodProcessor;

public class ProductService {
	private ProductDAO productDAO;
	private ProductimgDAO productimgDAO;

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}
	public void setProductimgDAO(ProductimgDAO productimgDAO) {
		this.productimgDAO = productimgDAO;
	}
	
	public List<ProductVO>  test(){
		return productDAO.selectAll();
	}
	public List<ProductVO> getProductByTopAmount(Integer pageNumber, Integer pageAmount, Integer counts){
		
	}
	public List<ProductVO> searchProductByKeyName(String productKeyName){
		//取得某類別含有keyname的商品
		return productDAO.selectByKey(productKeyName);
	}
	public List<ProductVO> searchProductByCategory(Integer categoryId){
		return productDAO.selectByCategory(categoryId);
	}
	public ProductVO getProductById(Integer productId){
		return productDAO.selectByProductId(productId);
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
	public Byte[] getProductImgById(Integer productId){
		ProductimgVO result = productimgDAO.selectByProductId(productId);
		if(result!=null){
			return result.getImg();
		}else{
			return null;
		}
		
	}
	public List<Byte[]> getProductImgByList(List<ProductVO>productVOs){
		List<Byte[]> imgList = new ArrayList<Byte[]>();
		for(int i =0 ; i<productVOs.size();i++){
			ProductimgVO result = productimgDAO.selectByProductId(productVOs.get(i).getId());
			imgList.add(result.getImg());
		}
		return imgList;
		
	}
	public boolean removeProduct(Integer productId){
		productimgDAO.delete(productId);
		return productDAO.delete(productId);
	}
	public List<ProductVO> getPoupulars(Integer categoryId, int number){
		//取得最暢銷的n個商品
	}
	public List<ProductVO> getProductsByPrice(Integer categoryId,Double min,Double max){
		return productDAO.selectByPriceRange(categoryId, min, max);
	}
}
