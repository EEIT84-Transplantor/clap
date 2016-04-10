package shopping.model;

import java.util.List;

public interface OrderFormDAO {

	public Boolean insert(OrderFormDAO OrderFormDAO);

	public Boolean delete(Integer id);

	public Boolean update(OrderFormDAO OrderFormDAO);

	public List<OrderFormDAO> select();

	public OrderFormDAO select(Integer id);

}
