package dao.order;

import java.util.List;

import bean.CreditBean;
import bean.OrderBean;
import bean.OrderDetailBean;

public interface OrderDAO {
	public void addOrder(OrderBean o,List<OrderDetailBean> order_details);
	public List<OrderBean> getOrderList(int user_id);
	public List<OrderBean> getShippedOrderList(int user_id);
	public void addCreditInfo(CreditBean creditBean);
	public List<CreditBean> getCreditInfo(int user_id);
	public void updateShipped(int user_id ,OrderBean orderBean);
}

