package command.product;

import java.util.ArrayList;
import java.util.List;

import bean.OrderBean;
import bean.OrderDetailBean;
import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.order.OrderDAO;
import tera.RequestContext;
import tera.ResponseContext;

class AddOrderCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rc = getRequestContext();

		int user_id = Integer.parseInt(rc.getParameter("user_id")[0]);
		int buy_count = 0;
		int total_price = 0;

		List list = new ArrayList();

		for(int i = 0; i < rc.getParameter("product_id").length; i++) {
			OrderDetailBean od = new OrderDetailBean();
			od.setProduct_id(Integer.parseInt(rc.getParameter("product_id")[0]));
			od.setBuy_count(Integer.parseInt(rc.getParameter("buy_count")[i]));

			buy_count += Integer.parseInt(rc.getParameter("buy_count")[i]);
			total_price += Integer.parseInt(rc.getParameter("price")[i])*Integer.parseInt(rc.getParameter("buy_count")[i]);

			list.add(od);
		}

		OrderBean o = new OrderBean();
		o.setUser_id(user_id);
		o.setTotal_price(total_price);
		o.setBuy_count(buy_count);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();


		OrderDAO ordao = factory.getOrderDAO();

		ordao.addOrder(o, list);
		resc.setTarget("/WEB-INF/jsp/cart.jsp");

		return resc;
	}
}




