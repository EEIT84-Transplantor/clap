package shopping.model;

import java.util.List;

public interface CartDAO {
	public abstract List<CartVO> selectAll();
	
	public abstract List<CartVO> selectByEmail(String email);

	public abstract CartVO insert(CartVO cartVO);
	
	public abstract CartVO insert(String email, Integer id , Integer quantity);

	public abstract CartVO update(CartVO cartVO);

	public abstract CartVO update(String email, Integer id , Integer quantity);

	public abstract boolean delete(String email, Integer id);
	
	public abstract boolean delete(String email);
}
