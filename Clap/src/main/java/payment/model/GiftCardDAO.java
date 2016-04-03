package payment.model;

import java.util.List;

public interface GiftCardDAO {

	public abstract List<GiftCardVO> selectAll();

	public abstract GiftCardVO selectByGcNumber(String gc_number);

	public abstract GiftCardVO insert(GiftCardVO giftCardVO);

	public abstract boolean update(GiftCardVO giftCardVO);

	public abstract boolean delete(String gc_number);
	
}
