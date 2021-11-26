package dao.order;

import java.util.List;

import bean.OrderBean;
import bean.OrderDetailBean;

public interface OrderDAO {
	public void addOrder(OrderBean o,List<OrderDetailBean> order_details);
	public List<OrderBean> getOrderList(String user_id);

}

