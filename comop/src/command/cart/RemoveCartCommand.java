package command.cart;

import bean.CartBean;
import command.AbstractCommand;
import dao.cart.MySQLCartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

class RemoveCartCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] user_ids = reqc.getParameter("user_id");
		String user_id = user_ids[0];
		
		int user_id = reqc.

		String[] product_ids = reqc.getParameter("product_id");
		String product_id = product_ids[0];

		CartBean cb = new CartBean();
		cb.setUser_id(user_id);
		cb.setUser_id(user_id);
		cb.setProduct_id(product_id);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		cd.removeCart(cb);

		resc.setTarget("cart");

		return resc;
	}
}
