package simulator.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import product.model.CategoryService;
import product.model.CategoryVO;
import product.model.ProductService;
import product.model.ProductVO;
import product.model.ProductimgVO;

public class SimulatorUtil {

	public static List<SimulatorVO> calculate(List<CategoryVO> categoryVOs , Map<Integer, List<ProductVO>> mapOfProductVOs,
			Map<Integer, List<ProductimgVO>> mapOfProductimgVOs, Integer env_id, Double bmi, Double smoking, Double drinking,
			Double exercising) {
		List<SimulatorVO> result  = new ArrayList<SimulatorVO>();
		
		SimulatorVO simulatorVO = null;
		//process the environment and body factors, use it to calculate the SimulatorVO
				//if bmi ==null, ignore this factor
				//smoking, drinking and exercising will be from 0-100
				//env_id will be null if nothing is passed in
		
		//放目錄
		for(CategoryVO categoryVO:categoryVOs){
			
			simulatorVO = new SimulatorVO();
			//放產品
			List<ProductVO> temp = mapOfProductVOs.get(categoryVO.getId());
			List<ProductVO> productVOs = new ArrayList<ProductVO>();
			List<ProductimgVO> productimgVOs = new ArrayList<ProductimgVO>();
			
			//改變產品數據
			for(ProductVO productVO : temp){
				//宣告
				Double finalValue1 = 1.0;
				Double finalValue2 = 1.0;
				//取值
				Double skill = productVO.getSkill();
				Double endurance = productVO.getEndurance();
				//拿來用
				
				//環境
				
				Double envValue = 1.0;
				if(env_id!=0){
				if(env_id == 0){
					//預設
				}
				if(env_id == 1){
					//森林
					envValue = categoryVO.getForest();
				}
				if(env_id == 2){
					//城市
					envValue = categoryVO.getCity();
				}
				if(env_id == 3){
					//工廠
					envValue = categoryVO.getIndustrial();
				}
				}
				//BMI
				
				Double bmiValue = 1.0;
				if(bmi!=null){
				if(bmi<18||bmi>24){
					bmiValue = bmi*categoryVO.getBmi() ;
				}
				}
				//抽菸smoking
				Double smokingValue = 1.0;
				if(smoking!=0){
					smokingValue = (100 - smoking) * categoryVO.getSmoking()/100;
				}
				
				//酗酒
				Double drinkingValue = 1.0;
				if(drinking!=0){
				drinkingValue = (100 - drinking) * categoryVO.getDrinking()/100;
				}
				//運動
				Double exercisingValue = 1.0;
				if(exercising!=0){
				exercisingValue = exercising / categoryVO.getExercising()/100;
				}
				
				Double totalEffect = envValue * bmiValue * smokingValue * drinkingValue * exercisingValue;
				if(skill==null){
					skill=Math.ceil(Math.random()*100.0+1);
				}
				if(endurance==null){
					endurance=Math.ceil(Math.random()*100.0+1);
				}
				finalValue1 = skill * totalEffect;
				finalValue2 = endurance * totalEffect;
				//結束
				productVO.setFinalValue1(finalValue1);
				productVO.setFinalValue2(finalValue2);
				productVOs.add(productVO);
			}
			
			//放圖片
			for(int index = 0; index<productVOs.size();index++){
				productimgVOs.add(mapOfProductimgVOs.get(categoryVO.getId()).get(index));
			}
			simulatorVO.setCategoryVO(categoryVO);
			simulatorVO.setProductimgVOs(productimgVOs);
			simulatorVO.setProductVOs(productVOs);
			result.add(simulatorVO);
		}
		return result;
	}
	
}
