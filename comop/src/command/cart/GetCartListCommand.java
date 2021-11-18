package command.cart;

import command.AbstractCommand;
import dao.cart.CartDAO;
import tera.ResponseContext;

public class GetCartListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		CartDAO cd = new CartDAO();

		resc.setResult(cd.getCartList());

		return resc;
	}
}