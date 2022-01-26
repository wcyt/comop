package command.order;

import java.util.List;

import bean.OrderBean;
import command.AbstractCommand;
import dao.order.OrderDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetOrderListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		int user_id = Integer.parseInt(rc.getParameter("user_id")[0]);
		int total_price = 0;

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		OrderDAO orderDAO = factory.getOrderDAO();
		List<OrderBean> orderlist = orderDAO.getOrderList(user_id);
		resc.setResult(orderlist);

		for (OrderBean orderBean : orderlist) {
			total_price += orderBean.getPrice();
		}

		rc.setAttribute("total_price", total_price);
		rc.setAttribute("order_list_size", orderlist.size());
		resc.setTarget("orderHistory");

		return resc;
	}
}





