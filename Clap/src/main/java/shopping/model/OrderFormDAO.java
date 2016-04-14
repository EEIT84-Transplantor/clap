package shopping.model;

import java.util.List;

public interface OrderFormDAO {

	public Boolean insert(OrderFormVO orderFormVO);

	public Boolean delete(Integer id);

	public Boolean update(OrderFormVO orderFormVO);

	public List<OrderFormDAO> select();

	public OrderFormVO select(Integer id);

}
