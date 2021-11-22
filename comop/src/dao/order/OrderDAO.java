package dao.order;

import java.util.List;

import bean.OrderBean;
import bean.OrderDetailBean;

public interface OrderDAO {
	public void addOrder(OrderBean o,OrderDetailBean od);
	public List getOrderList(String user_id);

}

