package payment.model;

import java.util.List;

public interface PromoCodeDAO {
	public abstract List<PromoCodeVO> selectAll();

	public abstract List<PromoCodeVO> selectByEmail(String mb_email);
	
	public abstract List<PromoVO> selectPromoVOByEmail(String mb_email);

	public abstract PromoCodeVO insert(String mb_email,String pc_code);

	public abstract boolean delete(String mb_email,String pc_code);
}
