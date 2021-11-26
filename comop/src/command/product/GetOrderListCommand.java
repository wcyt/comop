package command.product;

import java.util.List;

import command.AbstractCommand;
import dao.order.OrderDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

class GetOrderListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		RequestContext rc = getRequestContext();

		String user_id = (String)rc.getParameter("user_id")[0];

		OrderDAO odao = factory.getOrderDAO();

		List orderlist = odao.getOrderList(user_id);
		resc.setResult(orderlist);

		resc.setTarget("/WEB-INF/jsp/orderHistory.jsp");


		return resc;
	}
}





