package command.order;

import java.util.List;

import bean.PointOrderBean;
import command.AbstractCommand;
import dao.order.PointOrderDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetPointOrderListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		int user_id = Integer.parseInt(rc.getParameter("user_id")[0]);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		PointOrderDAO pointOrderDAO = factory.getPointOrderDAO();
		List<PointOrderBean> pointOrderList = pointOrderDAO.getPointOrderList(user_id);
		resc.setResult(pointOrderList);

		rc.setAttribute("point_order_list_size", pointOrderList.size());

		resc.setTarget("rewardProductOrderHistory");

		return resc;
	}
}





