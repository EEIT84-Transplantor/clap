package product.model;

import java.util.List;

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
	
}
