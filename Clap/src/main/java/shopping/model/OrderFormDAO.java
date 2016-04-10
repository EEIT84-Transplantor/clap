package shopping.model;

import java.util.List;

public interface OrderFormDAO {

	public Boolean insert(OrderFormDAO orderFormDAO);

	public Boolean delete(Integer id);

	public Boolean update(OrderFormDAO orderFormDAO);

	public List<OrderFormDAO> select();

	public OrderFormVO select(Integer id);

}
