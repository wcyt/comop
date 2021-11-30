package command.user;

import java.util.List;

import command.AbstractCommand;
import dao.order.OrderDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetOrderHistoryCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] user_ids = reqc.getParameter("user_id");
		String user_id = user_ids[0];


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		OrderDAO msod = factory.getOrderDAO();
		List orderList = msod.getOrderList(user_id);

		resc.setResult(orderList);
		resc.setTarget("orderHistory");

		return resc;
	}
}

