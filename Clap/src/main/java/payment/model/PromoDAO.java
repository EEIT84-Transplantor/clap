package payment.model;

import java.util.List;

public interface PromoDAO {
	public abstract List<PromoVO> selectAll();

	public abstract PromoVO selectByCode(String pm_code);

	public abstract PromoVO insert(PromoVO promoVO);

	public abstract boolean update(PromoVO promoVO);

	public abstract boolean delete(String pm_code);
}
