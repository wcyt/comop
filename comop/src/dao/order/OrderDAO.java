package dao.order;

import java.util.List;

import bean.OrderBean;

public interface OrderDAO {
	public void addOrder(OrderBean o);
	public List getOrderList(String user_id);

}

