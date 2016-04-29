package shopping.model;

import java.util.List;

public interface OrderFormDAO {

	public Boolean insert(OrderFormVO orderFormVO);

	public Boolean delete(Integer id);

	public Boolean update(OrderFormVO orderFormVO);

	public List<OrderFormVO> select();

	public OrderFormVO select(Integer id);

}
