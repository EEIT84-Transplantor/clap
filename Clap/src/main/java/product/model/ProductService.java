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
		return productDAO.selectByProductId(productId);
	}
	
	public List<ProductVO> searchProduct(Integer categoryId, Double min, Double max, String key){
		if (min ==null || min<0){
			min = 0.0;
		}
		if(max ==null || max<0){
			max = 10000000000000000000.0;
		}
		if(key==null&&categoryId!=null){
			return productDAO.selectByPriceRange(categoryId,min,max);
		}else if(categoryId==null&&key!=null){
			return productDAO.selectByPriceRange2(min, max, key);
		}else if(key!=null&&categoryId!=null){
			return productDAO.searchProductByKeyPrice(categoryId, min, max, key);
		}else{
			return productDAO.selectAll();
		}
	}
	
	public boolean setOrUpdateProduct(ProductVO productVO, Byte[] productImg){
		ProductVO dbVO = productDAO.selectByProductId(productVO.getId());
		ProductimgVO productimgVO = productimgDAO.selectByProductId(productVO.getId());

		try {
			if(dbVO == null && productimgVO == null){
				productVO.setId(generateNewProductId(productVO.getCategory_id()));				
				productimgVO = new ProductimgVO();
				productimgVO.setId(productDAO.insert(productVO).getId());
				if(productImg.length>0){
				productimgVO.setImg(productImg);
				}
				productimgDAO.insert(productimgVO);
				return true;
			}else if(dbVO != null && productimgVO == null){
				dbVO.setId(productVO.getId());
				dbVO.setName(productVO.getName());
				dbVO.setPrice(productVO.getPrice());
				dbVO.setDescription(productVO.getDescription());
				dbVO.setDiscount(productVO.getDiscount());
				dbVO.setCategory_id(productVO.getCategory_id());
				productimgVO = new ProductimgVO();
				productimgVO.setId(productVO.getId());
				if(productImg.length>0){
				productimgVO.setImg(productImg);
				}
				productimgDAO.insert(productimgVO);
				return true;
			}else{
				dbVO.setId(productVO.getId());
				dbVO.setName(productVO.getName());
				dbVO.setPrice(productVO.getPrice());
				dbVO.setDescription(productVO.getDescription());
				dbVO.setDiscount(productVO.getDiscount());
				dbVO.setCategory_id(productVO.getCategory_id());
				if(productImg!=null && productImg.length>0){
					productimgVO.setImg(productImg);
				}
				return true;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
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
	public Integer getIdByProductName(String productName){
		return productDAO.getProductIdByName(productName);
	}
	
	
	//private method generate New ProductId
	private Integer generateNewProductId(Integer categoryId){
		Integer oldId = 0;
		Integer newId = null;
		List<ProductVO> tempPdList = this.searchProductByCategory(categoryId);
		for (ProductVO pVo : tempPdList){
			oldId = (oldId >= pVo.getId())?oldId:pVo.getId();
		}
		Integer tempNew = Integer.valueOf(oldId.toString().substring(1))+1;
		newId = Integer.valueOf(categoryId.toString() + tempNew.toString());
		
		
		return newId;
	}
	

}
