package simulator.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.formula.ptg.PowerPtg;

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
		Double heart=1.0;
		Double lung =1.0;
		Double liver =1.0;
		Double kidney =1.0;
		Double stomach =1.0;
		Double intestine =1.0;
		Double blood =1.0;
	
		List<EnvironmentVO>env=new ArrayList<EnvironmentVO>();
		if (env_id!=null){
			if (env_id==1){
				env.add(environmentDAO.selectById(1));
			}else if(env_id==2){
				env.add(environmentDAO.selectById(2));
			}else if(env_id==3){
				env.add(environmentDAO.selectById(3));
			}
		}else if(bmi!=null){
			EnvironmentVO temp = environmentDAO.selectByCondition("bmi");
			env.add(environmentDAO.selectByCondition("bmi"));
		}else if(smoking!=50){
			EnvironmentVO temp = environmentDAO.selectByCondition("smoking");
			Integer pow = Math.abs((smoking-50)/5);
			Double variable;
			if (smoking>50){
				variable = Math.pow(.995, pow);
			}else{
				variable = Math.pow(1.005,pow);
			}
			env.add(environmentDAO.selectByCondition("smoking"));
		}else if(drinking!=50){
			env.add(environmentDAO.selectByCondition("drinking"));
		}else if(exercising!=50){
			env.add(environmentDAO.selectByCondition("exercising"));
		}
		
		for(int i = 0; i<env.size();i++){
			heart *= env.get(i).getHeart();
			lung *= env.get(i).getLung();
			liver *=env.get(i).getLiver();
			kidney *=env.get(i).getKidney();
			stomach *=env.get(i).getStomach();
			intestine *=env.get(i).getIntestine();
			blood *=env.get(i).getBlood();
		}
		
		
		return null;
	}
	private EnvironmentVO conditionedData(EnvironmentVO environmentVO,Double condition){
		environmentVO.setHeart(environmentVO.getHeart()*condition);
		
		return environmentVO;
	}
}
