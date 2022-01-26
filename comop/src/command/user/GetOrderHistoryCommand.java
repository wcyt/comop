package command.user;

import java.util.List;

import bean.OrderBean;
import command.AbstractCommand;
import dao.order.OrderDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetOrderHistoryCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//パラメータを取得
		String user_id = reqc.getParameter("user_id")[0];
		int total_price = 0;

		//注文リストを取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		OrderDAO msod = factory.getOrderDAO();
		List<OrderBean> orderList = msod.getOrderList(Integer.parseInt(user_id));

		resc.setResult(orderList);

		for (OrderBean orderBean : orderList) {
			total_price += orderBean.getPrice();
		}

		reqc.setAttribute("total_price", total_price);
		reqc.setAttribute("order_list_size", orderList.size());

		//orderHistory.jspに移動
		resc.setTarget("orderHistory");

		return resc;
	}
}

