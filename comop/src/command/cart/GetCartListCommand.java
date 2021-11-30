package command.cart;

import java.util.List;

import command.AbstractCommand;
import dao.cart.CartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetCartListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//パラメータを取得
		String[] user_ids = reqc.getParameter("user_id");
		String user_id = user_ids[0];

		//カートの中身を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		List carts = cd.getCartList(user_id);


		resc.setResult(carts);

		//cart.jspに移動
		resc.setTarget("cart");

		return resc;
	}
}