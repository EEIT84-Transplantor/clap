package shopping.model;

import java.util.List;

public interface OrderDetailDAO {

	public Boolean insert(OrderDetailVO orderDetailVO);

	public Boolean delete(Integer id, Integer product_id);

	public Boolean update(OrderDetailVO orderDetailVO);

	public List<OrderDetailVO> select();

	public List<OrderDetailVO> select(Integer id);

	public OrderDetailVO selectById(Integer id);

}
