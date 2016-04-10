package shopping.model;

import java.util.List;

public interface OrderDetailDAO {

	public Boolean insert(OrderDetailVO orderDetailVO);

	public Boolean delete(Integer id, Integer pd_id);

	public Boolean update(OrderDetailVO orderDetailVO);

	public List<OrderDetailVO> select();

	public OrderDetailVO select(Integer id, Integer pd_id);

}
