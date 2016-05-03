package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import simulator.model.SimulatorUtil;

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
		
		if(list!=null&&list.size()!=0){
			
			return list.get(0).getId();
		}else{
			return null;
		}
	}


	public List<SimulatorVO> calculate(List<CategoryVO> categoryVOs , Map<Integer, List<ProductVO>> mapOfProductVOs,
			Map<Integer, List<ProductimgVO>> mapOfProductimgVOs, Integer env_id, Double bmi, Double smoking, Double drinking,
			Double exercising) {
		return SimulatorUtil.calculate(categoryVOs, mapOfProductVOs, mapOfProductimgVOs, env_id, bmi, smoking, drinking, exercising);
	}

	
}
