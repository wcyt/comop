package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.order.OrderDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

class GetOrderListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		String user_id = (String)rc.getParameter("user_id")[0];

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		OrderDAO odao = factory.getOrderDAO();
		List orderlist = odao.getOrderList(user_id);

		resc.setResult(orderlist);
		resc.setTarget("orderHistory");

		return resc;
	}
}





