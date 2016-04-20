package simulator.model;

import java.util.List;

public class SimulatorService {
	public EnvironmentDAO environmentDAO;

	public EnvironmentDAO getEnvironmentDAO() {
		return environmentDAO;
	}
	public void setEnvironmentDAO(EnvironmentDAO environmentDAO) {
		this.environmentDAO = environmentDAO;
	}

	public List<SimulatorVO> calculate(Integer env_id, Double bmi, Integer smoking, Integer drinking,
			Integer exercising) {
		//process the environment and body factors, use it to calculate the SimulatorVO
		//if bmi ==null, ignore this factor
		//smoking, drinking and exercising will be from 0-100
		//env_id will be null if nothing is passed in
		SimulatorVO simulatorVO = new SimulatorVO();
		if (env_id!=null){
			
		}else if(bmi!=null){
			
		}else if(smoking!=50){
			
		}else if(drinking!=50){
			
		}else if(exercising!=50){
			
		}
		return null;
	}

}
