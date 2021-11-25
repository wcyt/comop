package command.user;

import command.AbstractCommand;
import dao.order.OrderDAO;
import tera.ResponseContext;

class GetOrderHistoryCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		OrderDAO od = new OrderDAO();
		resc.setResult(od.getOrderList());

		resc.setTarget("orderHistory");

		return resc;
	}
}

