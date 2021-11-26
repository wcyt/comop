package command.cart;

import java.util.List;

import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.cart.MySQLCartDAO;
import tera.RequestContext;
import tera.ResponseContext;

public class GetCartListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] user_ids = reqc.getParameter("user_id");
		String user_id = user_ids[0];


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLCartDAO mscd = factory.getMySQLCartDAO();

		List carts = mscd.getCartList();


		resc.setResult(carts);
		resc.setTarget("cart");

		return resc;
	}
}