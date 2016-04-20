package product.model;

import java.util.List;

import simulator.model.SimulatorVO;

public class CategoryService {
	private CategoryDAO categoryDAO;
	
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

	public List<SimulatorVO> calculate(Integer env_id, Double bmi, Integer smoking, Integer drinking,
			Integer exercising) {
		//process the environment and body factors, use it to calculate the SimulatorVO
				//if bmi ==null, ignore this factor
				//smoking, drinking and exercising will be from 0-100
				//env_id will be null if nothing is passed in
		return null;
	}
	
}
