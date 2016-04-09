package cart.model;

import java.util.List;

public interface CartDAO {
	
	public abstract List<CartVO> selectByEmail(String email);

	public abstract CartVO insert(CartVO cartVO);
	
	public abstract CartVO insert(String email, int id , int quantity);

	public abstract boolean update(CartVO cartVO);

	public abstract boolean update(String email, int id , int quantity);

	public abstract boolean delete(String email, int id);
}
