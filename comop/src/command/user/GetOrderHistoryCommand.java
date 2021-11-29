package command.user;

import java.util.List;

import bean.OrderBean;
import command.AbstractCommand;
import dao.order.MySQLOrderDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

class GetOrderHistoryCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] user_ids = reqc.getParameter("user_id");
		String user_id = user_ids[0];

		OrderBean ob = new OrderBean();
		ob.setUser_id(Integer.parseInt(user_id));


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLOrderDAO msod = factory.getMySQLOrderDAO();

		List orderList = msod.getOrderList(ob);

		resc.setResult(orderList);
		resc.setTarget("orderHistory");

		return resc;
	}
}

