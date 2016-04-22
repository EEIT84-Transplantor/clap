package product.model;

import java.util.ArrayList;
import java.util.List;

//import simulator.model.SimulatorUtil;

import simulator.model.SimulatorVO;

public class CategoryService {
	private CategoryDAO categoryDAO;
	private ProductService productService;
	
	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	public List<CategoryVO>  getAllCategory(){
		return categoryDAO.selectAll();
	}
	
	public CategoryVO addNewCategory(Integer id, String category_name){
		CategoryVO categoryVO = new CategoryVO();
		categoryVO.setName(category_name);
		return categoryDAO.insert(categoryVO);	
	}
	public Integer selectByCategoryName(String category_name){
		List<CategoryVO>list = categoryDAO.selectByCategoryName(category_name);
		System.out.println(list.size());
		if(list!=null&&list.size()!=0){
			System.out.println("here"+list.get(0).getId());
			return list.get(0).getId();
		}else{
			return null;
		}
	}


//	public List<SimulatorVO> calculate(Integer env_id, Double bmi, Double smoking, Double drinking,
//			Double exercising) {
//		return SimulatorUtil.calculate(productService, this, env_id, bmi, smoking, drinking, exercising);
//	}

	
}
