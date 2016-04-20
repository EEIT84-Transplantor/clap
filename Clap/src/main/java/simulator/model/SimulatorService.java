package simulator.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.formula.ptg.PowerPtg;

import product.model.CategoryDAO;

public class SimulatorService {
	public CategoryDAO categoryDAO;

	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}
	public List<SimulatorVO> calculate(Integer env_id, Double bmi, Integer smoking, Integer drinking,
			Integer exercising) {
		//process the environment and body factors, use it to calculate the SimulatorVO
		//if bmi ==null, ignore this factor
		//smoking, drinking and exercising will be from 0-100
		//env_id will be null if nothing is passed in
		SimulatorVO simulatorVO = new SimulatorVO();
		Double heart=1.0;
		Double lung =1.0;
		Double liver =1.0;
		Double kidney =1.0;
		Double stomach =1.0;
		Double intestine =1.0;
		Double blood =1.0;
	

		return null;


	}
}
