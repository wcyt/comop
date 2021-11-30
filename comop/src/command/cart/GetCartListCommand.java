package command.cart;

import java.util.List;

import bean.CartBean;
import command.AbstractCommand;
import dao.cart.CartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetCartListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String user_id = reqc.getParameter("user_id")[0];

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		List<CartBean> carts = cd.getCartList(user_id);

		resc.setResult(carts);
		resc.setTarget("cart");

		return resc;
	}
}