package cart.model;

import java.util.List;

public interface CartDAO {
	
	public abstract List<CartVO> selectByEmail(String email);

	public abstract CartVO insert(CartVO cartVO);
	
	public abstract CartVO insert(String email, Integer id , Integer quantity);

	public abstract boolean update(CartVO cartVO);

	public abstract boolean update(String email, Integer id , Integer quantity);

	public abstract boolean delete(String email, Integer id);
	
	public abstract boolean delete();
}
